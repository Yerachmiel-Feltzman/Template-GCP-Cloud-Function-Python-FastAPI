import logging

from fastapi import FastAPI

config.set_log_level_from_env(force=False)
logger = logging.getLogger(__name__)

default_project_id = os.environ.get("GCP_PROJECT", "{{ cookiecutter.gcp_project }}")
default_region = os.environ.get("GCP_REGION", "{{ cookiecutter.gcp_region }}")

app = FastAPI()


@app.get("/")
def root():
    return "That's the root page of this API."
