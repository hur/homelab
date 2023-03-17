# Atte's Homelab
![Blog](https://img.shields.io/website?down_message=down&label=blog&style=flat-square&up_message=up&url=https%3A%2F%2Fwww.atte.cloud)

Initial setup based on [khuedoan/homelab](https://github.com/khuedoan/homelab)

This project utilizes [Infrastructure as Code](https://en.wikipedia.org/wiki/Infrastructure_as_code) and [GitOps](https://www.weave.works/technologies/gitops) to automate provisioning, operating, and updating self-hosted services in my homelab.

### Hardware

- ThinkPad x1 Carbon 7th gen
    - CPU: `Intel(R) Core(TM) i5-8265U CPU @ 1.60GHz`
    - RAM: `16GB`
    - SSD: `256GB`

### Features

- [x] Common applications: Gitea, Seafile, Jellyfin, Paperless...
- [x] Automated bare metal provisioning with PXE boot
- [x] Automated Kubernetes installation and management
- [x] Installing and managing applications using GitOps
- [x] Automatically update apps (with approval)
- [x] Modular architecture, easy to add or remove features/components
- [x] Automated certificate management
- [x] Automatically update DNS records for exposed services
- [x] VPN without port forwarding
- [x] Expose services to the internet securely with [Cloudflare Tunnel](https://www.cloudflare.com/products/tunnel/)
- [x] CI/CD platform
- [x] Private container registry
- [ ] Automatic rolling upgrade for OS and Kubernetes
- [ ] Distributed storage
- [ ] Support multiple environments (dev, prod)
- [ ] Monitoring and alerting 🚧
- [ ] Automated offsite backups
- [ ] Single sign-on 🚧
- [ ] Infrastructure testing
### Tech stack

<table>
    <tr>
        <th>Logo</th>
        <th>Name</th>
        <th>Description</th>
    </tr>
    <tr>
        <td><img width="32" src="https://simpleicons.org/icons/ansible.svg"></td>
        <td><a href="https://www.ansible.com">Ansible</a></td>
        <td>Automate bare metal provisioning and configuration</td>
    </tr>
    <tr>
        <td><img width="32" src="https://cncf-branding.netlify.app/img/projects/argo/icon/color/argo-icon-color.svg"></td>
        <td><a href="https://argoproj.github.io/cd">ArgoCD</a></td>
        <td>GitOps tool built to deploy applications to Kubernetes</td>
    </tr>
    <tr>
        <td><img width="32" src="https://github.com/jetstack/cert-manager/raw/master/logo/logo.png"></td>
        <td><a href="https://cert-manager.io">cert-manager</a></td>
        <td>Cloud native certificate management</td>
    </tr>
    <tr>
        <td><img width="32" src="https://avatars.githubusercontent.com/u/314135?s=200&v=4"></td>
        <td><a href="https://www.cloudflare.com">Cloudflare</a></td>
        <td>DNS and Tunnel</td>
    </tr>
    <tr>
        <td><img width="32" src="https://www.docker.com/wp-content/uploads/2022/03/Moby-logo.png"></td>
        <td><a href="https://www.docker.com">Docker</a></td>
        <td>Ephemeral PXE server and convenient tools container</td>
    </tr>
    <tr>
        <td><img width="32" src="https://github.com/kubernetes-sigs/external-dns/raw/master/docs/img/external-dns.png"></td>
        <td><a href="https://github.com/kubernetes-sigs/external-dns">ExternalDNS</a></td>
        <td>Synchronizes exposed Kubernetes Services and Ingresses with DNS providers</td>
    </tr>
    <tr>
        <td><img width="32" src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Fedora_logo.svg/267px-Fedora_logo.svg.png"></td>
        <td><a href="https://getfedora.org/en/server">Fedora Server</a></td>
        <td>Base OS for Kubernetes nodes</td>
    </tr>
    <tr>
        <td><img width="32" src="https://upload.wikimedia.org/wikipedia/commons/b/bb/Gitea_Logo.svg"></td>
        <td><a href="https://gitea.com">Gitea</a></td>
        <td>Self-hosted Git service</td>
    </tr>
    <tr>
        <td><img width="32" src="https://grafana.com/static/img/menu/grafana2.svg"></td>
        <td><a href="https://grafana.com">Grafana</a></td>
        <td>Operational dashboards</td>
    </tr>
    <tr>
        <td><img width="32" src="https://cncf-branding.netlify.app/img/projects/helm/icon/color/helm-icon-color.svg"></td>
        <td><a href="https://helm.sh">Helm</a></td>
        <td>The package manager for Kubernetes</td>
    </tr>
    <tr>
        <td><img width="32" src="https://cncf-branding.netlify.app/img/projects/k3s/icon/color/k3s-icon-color.svg"></td>
        <td><a href="https://k3s.io">K3s</a></td>
        <td>Lightweight distribution of Kubernetes</td>
    </tr>
    <tr>
        <td><img width="32" src="https://cncf-branding.netlify.app/img/projects/kubernetes/icon/color/kubernetes-icon-color.svg"></td>
        <td><a href="https://kubernetes.io">Kubernetes</a></td>
        <td>Container-orchestration system, the backbone of this project</td>
    </tr>
    <tr>
        <td><img width="32" src="https://github.com/grafana/loki/blob/main/docs/sources/logo.png?raw=true"></td>
        <td><a href="https://grafana.com/oss/loki">Loki</a></td>
        <td>Log aggregation system</td>
    </tr>
    <tr>
        <td><img width="32" src="https://cncf-branding.netlify.app/img/projects/longhorn/icon/color/longhorn-icon-color.svg"></td>
        <td><a href="https://longhorn.io">Longhorn</a></td>
        <td>Cloud native distributed block storage for Kubernetes</td>
    </tr>
    <tr>
        <td><img width="32" src="https://avatars.githubusercontent.com/u/60239468?s=200&v=4"></td>
        <td><a href="https://metallb.org">MetalLB</a></td>
        <td>Bare metal load-balancer for Kubernetes</td>
    </tr>
    <tr>
        <td><img width="32" src="https://avatars.githubusercontent.com/u/1412239?s=200&v=4"></td>
        <td><a href="https://www.nginx.com">NGINX</a></td>
        <td>Kubernetes Ingress Controller</td>
    </tr>
    <tr>
        <td><img width="32" src="https://cncf-branding.netlify.app/img/projects/prometheus/icon/color/prometheus-icon-color.svg"></td>
        <td><a href="https://prometheus.io">Prometheus</a></td>
        <td>Systems monitoring and alerting toolkit</td>
    </tr>
    <tr>
        <td><img width="32" src="https://docs.renovatebot.com/assets/images/logo.png"></td>
        <td><a href="https://www.whitesourcesoftware.com/free-developer-tools/renovate">Renovate</a></td>
        <td>Automatically update dependencies</td>
    </tr>
    <tr>
        <td><img width="32" src="https://avatars.githubusercontent.com/u/47602533?s=200&v=4"></td>
        <td><a href="https://tekton.dev">Tekton</a></td>
        <td>Cloud native solution for building CI/CD systems</td>
    </tr>
    <tr>
        <td><img width="32" src="https://goharbor.io/img/logos/harbor-icon-color.png"></td>
        <td><a href="https://goharbor.io/">Harbor</a></td>
        <td>Private container registry</td>
    </tr>
    <tr>
        <td><img width="32" src="https://simpleicons.org/icons/vault.svg"></td>
        <td><a href="https://www.vaultproject.io">Vault</a></td>
        <td>Secrets and encryption management system</td>
    </tr>
    <tr>
        <td><img width="32" src="https://docs.zerotier.com/img/ZeroTierIcon.png"></td>
        <td><a href="https://zerotier.com">ZeroTier</a></td>
        <td>VPN without port forwarding</td>
    </tr>
</table>

## License

Copyright &copy; 2023 - Atte Niemi

Copyright &copy; 2020 - 2023 Khue Doan

Distributed under the GPLv3 License.
See [license page](https://homelab.khuedoan.com/reference/license) or `LICENSE.md` file for more information.

## Acknowledgements

References:

- [khuedoan/homelab](https://github.com/khuedoan/homelab)
- [Ephemeral PXE server inspired by Minimal First Machine in the DC](https://speakerdeck.com/amcguign/minimal-first-machine-in-the-dc)
- [ArgoCD usage and monitoring configuration in locmai/humble](https://github.com/locmai/humble)
- [README template](https://github.com/othneildrew/Best-README-Template)
- [Run the same Cloudflare Tunnel across many `cloudflared` processes](https://developers.cloudflare.com/cloudflare-one/tutorials/many-cfd-one-tunnel)
- [MAC address environment variable in GRUB config](https://askubuntu.com/questions/1272400/how-do-i-automate-network-installation-of-many-ubuntu-18-04-systems-with-efi-and)
- [Official k3s systemd service file](https://github.com/k3s-io/k3s/blob/master/k3s.service)
- [Official Cloudflare Tunnel examples](https://github.com/cloudflare/argo-tunnel-examples)
- [Initialize GitOps repository on Gitea and integrate with Tekton by RedHat](https://github.com/redhat-scholars/tekton-tutorial/tree/master/triggers)
- [SSO configuration from xUnholy/k8s-gitops](https://github.com/xUnholy/k8s-gitops)
- [Pre-commit config from k8s-at-home/flux-cluster-template](https://github.com/k8s-at-home/flux-cluster-template)
- [Diátaxis technical documentation framework](https://diataxis.fr)
- [Official Terratest examples](https://github.com/gruntwork-io/terratest/tree/master/test)

Here is a list of the contributors who have helped to improve this project.
Big shout-out to them!

- ![](https://github.com/locmai.png?size=24) [@locmai](https://github.com/locmai)
- ![](https://github.com/MatthewJohn.png?size=24) [@MatthewJohn](https://github.com/MatthewJohn)
- ![](https://github.com/karpfediem.png?size=24) [@karpfediem](https://github.com/karpfediem)
- ![](https://github.com/linhng98.png?size=24) [@linhng98](https://github.com/linhng98)
- ![](https://github.com/BlueHatbRit.png?size=24) [@BlueHatbRit](https://github.com/BlueHatbRit)
- ![](https://github.com/dotdiego.png?size=24) [@dotdiego](https://github.com/dotdiego)
- ![](https://github.com/Crimrose.png?size=24) [@Crimrose](https://github.com/Crimrose)
- ![](https://github.com/eventi.png?size=24) [@eventi](https://github.com/eventi)
- ![](https://github.com/Bourne-ID.png?size=24) [@Bourne-ID](https://github.com/Bourne-ID)
- ![](https://github.com/akwan.png?size=24) [@akwan](https://github.com/akwan)
- ![](https://github.com/trangmaiq.png?size=24) [@trangmaiq](https://github.com/trangmaiq)

If you feel you're missing from this list, feel free to add yourself in a PR.