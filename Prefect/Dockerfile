FROM prefecthq/prefect:3.6.10-python3.14-kubernetes

ARG pyproject_url="https://raw.githubusercontent.com/SeshuTarapatla/Insta-Automate/refs/heads/prefect/pyproject.toml"

RUN apt-get update \
    && apt-get install -y --no-install-recommends curl \
    && rm -rf /var/lib/apt/lists/*

RUN cd /tmp \
    && curl -O ${pyproject_url} \
    && uv pip compile pyproject.toml -o requirements.txt \
    && uv pip install -r requirements.txt --system --no-cache \
    && rm -rfv /tmp/*

# docker build -t prefect-image Prefect