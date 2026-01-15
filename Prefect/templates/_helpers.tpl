{{- define "pg.env" -}}
- name: PGHOST
  value: {{ .Values.pg.app }}-service
- name: PGPORT
  valueFrom:
    secretKeyRef:
      name: {{ .Values.pg.app }}-secret
      key: POSTGRES_PORT
- name: PGUSER
  valueFrom:
    secretKeyRef:
      name: {{ .Values.pg.app }}-secret
      key: POSTGRES_USER
- name: PGPASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ .Values.pg.app }}-secret
      key: POSTGRES_PASSWORD
{{- end -}}

{{- define "server.env" -}}
{{ include "pg.env" . }}
- name: PREFECT_API_DATABASE_CONNECTION_URL
  value: "postgresql+asyncpg://$(PGUSER):$(PGPASSWORD)@$(PGHOST):$(PGPORT)/{{ .Values.app }}"
{{- end -}}

{{- define "worker.env" -}}
{{ include "pg.env" . }}
- name: PREFECT_TASKS_DEFAULT_NO_CACHE
  value: "true"
- name: PREFECT_API_URL
  value: "http://{{ .Values.app }}-server:{{ .Values.port }}/api"
- name: PG_CONNECTION_STRING
  value: "postgresql+psycopg2://$(PGUSER):$(PGPASSWORD)@$(PGHOST):$(PGPORT)"
{{- end -}}