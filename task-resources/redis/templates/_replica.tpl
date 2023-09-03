# database replica information, that value can be overrited at specific environment config
{{- define "cachereplica" -}}
{{- if .Values.redis.replica -}}
replicas: {{ .Values.redis.replica }}
{{- end -}}
{{- end -}}