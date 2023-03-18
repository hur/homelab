data "cloudflare_zone" "zone" {
  name = "atte.cloud"
}

data "cloudflare_api_token_permission_groups" "all" {}

data "http" "public_ipv4" {
  url = "https://ipv4.icanhazip.com"
}

# data "http" "public_ipv6" {
#   url = "https://ipv6.icanhazip.com"
# }

locals {
  public_ips = [
    "${chomp(data.http.public_ipv4.body)}/32",
    # "${chomp(data.http.public_ipv6.body)}/128"
  ]
}

resource "random_password" "tunnel_secret" {
  length  = 64
  special = false
}

resource "random_password" "tunnel_pub_secret" {
  length  = 64
  special = false
}

resource "cloudflare_tunnel" "homelab" {
  account_id = var.cloudflare_account_id
  name       = "homelab"
  secret     = base64encode(random_password.tunnel_secret.result)
}

resource "cloudflare_tunnel" "homelab_public" {
  account_id = var.cloudflare_account_id
  name       = "homelab-public"
  secret     = base64encode(random_password.tunnel_pub_secret.result)
}

# Not proxied, not accessible. Just a record for auto-created CNAMEs by external-dns.
resource "cloudflare_record" "tunnel" {
  zone_id = data.cloudflare_zone.zone.id
  type    = "CNAME"
  name    = "homelab-tunnel"
  value   = "${cloudflare_tunnel.homelab.id}.cfargotunnel.com"
  proxied = false
  ttl     = 1 # Auto
}

# Not proxied, not accessible. Just a record for auto-created CNAMEs by external-dns.
resource "cloudflare_record" "tunnel_public" {
  zone_id = data.cloudflare_zone.zone.id
  type    = "CNAME"
  name    = "public-tunnel"
  value   = "${cloudflare_tunnel.homelab_public.id}.cfargotunnel.com"
  proxied = false
  ttl     = 1 # Auto
}

resource "kubernetes_secret" "cloudflared_public_tunnel_credentials" {
  metadata {
    name      = "cloudflared-public-credentials"
    namespace = "cloudflared-public"
  }

  data = {
    "credentials.json" = jsonencode({
      AccountTag   = var.cloudflare_account_id
      TunnelName   = cloudflare_tunnel.homelab_public.name
      TunnelID     = cloudflare_tunnel.homelab_public.id
      TunnelSecret = base64encode(random_password.tunnel_pub_secret.result)
    })
  }
}

resource "kubernetes_secret" "cloudflared_credentials" {
  metadata {
    name      = "cloudflared-credentials"
    namespace = "cloudflared"
  }

  data = {
    "credentials.json" = jsonencode({
      AccountTag   = var.cloudflare_account_id
      TunnelName   = cloudflare_tunnel.homelab.name
      TunnelID     = cloudflare_tunnel.homelab.id
      TunnelSecret = base64encode(random_password.tunnel_secret.result)
    })
  }
}

resource "cloudflare_api_token" "external_dns" {
  name = "homelab_external_dns"

  policy {
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.permissions["Zone Read"],
      data.cloudflare_api_token_permission_groups.all.permissions["DNS Write"]
    ]
    resources = {
      "com.cloudflare.api.account.zone.*" = "*"
    }
  }

  condition {
    request_ip {
      in = local.public_ips
    }
  }
}

resource "kubernetes_secret" "external_dns_token" {
  metadata {
    name      = "cloudflare-api-token"
    namespace = "external-dns"
  }

  data = {
    "value" = cloudflare_api_token.external_dns.value
  }
}

resource "cloudflare_api_token" "cert_manager" {
  name = "homelab_cert_manager"

  policy {
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.permissions["Zone Read"],
      data.cloudflare_api_token_permission_groups.all.permissions["DNS Write"]
    ]
    resources = {
      "com.cloudflare.api.account.zone.*" = "*"
    }
  }

  condition {
    request_ip {
      in = local.public_ips
    }
  }
}

resource "kubernetes_secret" "cert_manager_token" {
  metadata {
    name      = "cloudflare-api-token"
    namespace = "cert-manager"
  }

  data = {
    "api-token" = cloudflare_api_token.cert_manager.value
  }
}

/*
resource "cloudflare_ruleset" "redirect_root_to_www" {
  zone_id     = data.cloudflare_zone.zone.id
  name        = "redirect_root_to_www"
  description = "Redirects requests to the apex domain to www subdomain"
  kind        = "zone"
  phase       = "http_request_dynamic_redirect"

  rules {
    action = "redirect"
    action_parameters {
      from_value {
        status_code = 301
        target_url {
          value = "https://www.atte.cloud"
        }
        preserve_query_string = true
      }
    }
    expression = "(starts_with(http.request.full_uri, \"https://atte.cloud\"))"
    description = "Redirect requests to the apex domain to www subdomain"
    enabled     = true
  }
}
*/