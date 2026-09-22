{{- define "crtsh-kubernetes.prometheus" -}}
apiVersion: monitoring.coreos.com/v1
kind: Prometheus
metadata:
  name: {{ .Values.prometheus.name | default "prometheus" }}
  namespace: {{ .Values.prometheus.namespace | default "monitoring" }}
spec:
  serviceMonitorSelector:
    matchLabels:
      {{- toYaml .Values.prometheus.serviceMonitorSelector.matchLabels | nindent 6 }}
{{- end }}


{{- define "crtsh-kubernetes-service-monitor.labels" -}}
{{- toYaml .Values.prometheus.serviceMonitorSelector.matchLabels }}
{{- end }}


{{- define "crtsh-kubernetes.prometheus-namespace" -}}
namespace: {{ .Values.prometheus.namespace | default "monitoring" }}
{{- end }}


{{- define "crtsh-kubernetes.prometheus-name" -}}
name: {{ .Values.prometheus.name | default "prometheus" }}
{{- end }}
