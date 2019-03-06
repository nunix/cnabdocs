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