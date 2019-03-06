# CNAB docs bundle
*how to use this bundle*

## Prerequisites
- Get [`docker`](https://www.docker.com/products/docker-desktop)
- Get [`docker-app`](https://github.com/docker/app/releases)
- Get [`porter`](https://porter.sh/install/)
- Create a `docker-app` context:

```
### Bash
$ docker-app context create cnab --description "CNAB context" --default-stack-orchestrator=swarm --docker-host=unix:///var/run/docker.sock

### Powershell
PS> docker-app context create cnab --description "CNAB context" --default-stack-orchestrator=swarm
```

> For powershell context, we do not set a `docker-host` value as it will take by default the named pipe

> **IMPORTANT**: if running `Docker for Windows`, you need to be in "Linux containers mode"

## Server bundle
This bundle can be used with `docker-app` directly.
The content needed is all located in the single file `cnabdocs.dockerapp`.


In order to install it, follow the following steps (same for both `bash` and `powershell`):

```
# Check that the file renders correctly (specially if changed values)
$> docker-app render

version: "3.6"
services:
server:
    image: aerth/markdownd
    ports:
    - mode: ingress
    target: 8080
    published: 8000
    protocol: tcp
    volumes:
    - type: volume
    source: web
    target: /opt
volumes:
web:
    name: content

# Install the bundle inside the context created in the prerequisites
$> docker-app install cnabdocs.dockerapp --name cnabdocs --target-context=cnab

Creating network cnabdocs_default
Creating service cnabdocs_server

# Check that the application has been installed correctly
$> docker-app status cnabdocs --target-context=cnab

ID                  NAME                    MODE                REPLICAS            IMAGE                    PORTS
tmq91ods5p2m        cnabdocs-Linux_server   replicated          1/1                 aerth/markdownd:latest   *:8000->8080/tcp

# Open a browser to http://localhost:8000
```

## Cleaning resources
The bundle and the volume created can be uninstalled/removed as follow:

```
# Uninstall the bundle
$> docker-app uninstall cnabdocs --target-context=cnab

Removing service cnabdocs_server
Removing network cnabdocs_default

# Remove the volume named "content"
$> docker volume rm content
```