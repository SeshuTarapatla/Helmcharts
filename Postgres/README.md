# Postgres Helmchart
Deploy get your own postgres pod running that can host a local database.  

## Config
1. Data is stored in %USERPROFILE% directory.
2. Above directory is replaced with its `/mnt/` alias w.r.t WSL [windows subsystem for linux].
3. Modify the above if you want to store pg-data somewhere else.
4. Password field in present in `values.yaml`.
5. Modify it accordingly before installing the helmchart.

## Setup
Please read the [config](#config) section properly before proceeding:
```sh
helm upgrade --install <release name> <helmchart_path>

# Example
helm upgrade --install postgres .\Postgres\helmchart
```