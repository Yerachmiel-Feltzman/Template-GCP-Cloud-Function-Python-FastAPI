import os

from {{ cookiecutter.package_slug }} import config


def main():
    import uvicorn

    server_port = int(os.environ.get("PORT", 8000))
    # NOTE: Note that the application instance itself can be passed instead of the app import string.
    # That's what we are d
    # However, this style only works if you are not using multiprocessing (workers=NUM)
    # or reloading (reload=True), so we recommend using the import string style.
    uvicorn.run("{{ cookiecutter.package_slug }}.app", host="0.0.0.0", port=server_port, log_level="info")


if __name__ == "__main__":
    config.set_log_level_from_env(force=False)
    main()
