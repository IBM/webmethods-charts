{{/*
Kubernetes standard labels

Usage:
  {{ include "common.labels.standard" . | nindent 4 }}
  {{ include "common.labels.standard" (list . "pre-") | nindent 4 }}
  {{ include "common.labels.standard" (list . "pre-" "-post") | nindent 4 }}
*/}}
{{- define "common.labels.standard" -}}
{{- $ctx := . -}}
{{- $prefix := "" -}}
{{- $suffix := "" -}}

{{- if kindIs "slice" . }}
  {{- $ctx = index . 0 -}}
  {{- if ge (len .) 2 }}{{- $prefix = default "" (index . 1) -}}{{- end -}}
  {{- if ge (len .) 3 }}{{- $suffix = default "" (index . 2) -}}{{- end -}}
{{- end -}}

{{- $name := printf "%s%s%s" $prefix (include "common.names.name" $ctx) $suffix -}}

app.kubernetes.io/name: {{ $name }}
helm.sh/chart: {{ include "common.names.chart" $ctx }}
app.kubernetes.io/instance: {{ $ctx.Release.Name }}
app.kubernetes.io/managed-by: {{ $ctx.Release.Service }}
app.kubernetes.io/version: {{ default $ctx.Chart.AppVersion $ctx.Values.appVersion | quote }}
{{- end -}}


{{/*
Labels to use on deploy.spec.selector.matchLabels and svc.spec.selector

Usage:
  {{ include "common.labels.matchLabels" . | nindent 4 }}
  {{ include "common.labels.matchLabels" (list . "pre-") | nindent 4 }}
  {{ include "common.labels.matchLabels" (list . "pre-" "-post") | nindent 4 }}
*/}}
{{- define "common.labels.matchLabels" -}}
{{- $ctx := . -}}
{{- $prefix := "" -}}
{{- $suffix := "" -}}

{{- if kindIs "slice" . }}
  {{- $ctx = index . 0 -}}
  {{- if ge (len .) 2 }}{{- $prefix = default "" (index . 1) -}}{{- end -}}
  {{- if ge (len .) 3 }}{{- $suffix = default "" (index . 2) -}}{{- end -}}
{{- end -}}

{{- $name := printf "%s%s%s" $prefix (include "common.names.name" $ctx) $suffix -}}

app.kubernetes.io/name: {{ $name }}
app.kubernetes.io/instance: {{ $ctx.Release.Name }}
{{- end -}}
