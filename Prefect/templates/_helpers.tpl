{{- define "prefect.dbEnv" }}
- name: PGHOST
  value: {{ .Values.postgres.service | quote }}
- name: PGPORT
  valueFrom:
    configMapKeyRef:
      name: {{ .Values.postgres.configmap | quote }}
      key: POSTGRES_PORT
- name: PGUSER
  valueFrom:
    secretKeyRef:
      name: {{ .Values.postgres.secret | quote }}
      key: username
- name: PGPASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ .Values.postgres.secret | quote }}
      key: password
- name: PREFECTDB
  value: {{ .Values.app | quote }}
{{- end}}