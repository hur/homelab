{{/*
Expand the name of the chart.
*/}}
{{- define "yeti.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "yeti.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "yeti.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "yeti.labels" -}}
helm.sh/chart: {{ include "yeti.chart" . }}
{{ include "yeti.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "yeti.selectorLabels" -}}
app.kubernetes.io/name: {{ include "yeti.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "yeti.server.selectorLabels" -}}
app.kubernetes.io/name: {{ include "yeti.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: server
{{- end }}

{{/*
Selector labels
*/}}
{{- define "yeti.frontend.selectorLabels" -}}
app.kubernetes.io/name: {{ include "yeti.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: frontend
{{- end }}

{{/*
Selector labels
*/}}
{{- define "yeti.worker.selectorLabels" -}}
app.kubernetes.io/name: {{ include "yeti.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: worker
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "yeti.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "yeti.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
\
{{/*
Redis subcharts connection port
*/}}
{{- define "redis.port" -}}
{{- if (index .Values "redis").enabled -}}
{{ (index .Values "redis").service.ports.redis }}
{{- end -}}
{{- end -}}

{{/*
Redis subcharts service name
*/}}
{{- define "redis.servicename" -}}
{{- if (index .Values "redis").enabled -}}
{{- printf "%s-redis-master.%s.svc.%s" .Release.Name .Release.Namespace .Values.clusterDomain -}}
{{- end -}}
{{- end -}}
