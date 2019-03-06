# WSL CNAB docs
*how to use this bundle*

This bundle allows you to create rapidly a WSL custom distro.

You can use it as follow:
1. Export the environment variables

```
### Bash
export DISTRO_IMAGE=alpine
export DISTRO_NAME=wslalpine
export DISTRO_PATH=/github/${DISTRO_NAME}
export DISTRO_SOURCE=/github/${DISTRO_NAME}.tar
export PORTER_DEP=/github/cnabwslbuilder/porter.yaml
export DOCKER_SOURCE=docker
export DOCKER-APP_SOURCE=docker-app
export WSL_SOURCE=wsl.exe

### Powershell
$Env:DISTRO_IMAGE=alpine
$Env:DISTRO_NAME=wslalpine
$Env:DISTRO_PATH=/github/${DISTRO_NAME}
$Env:DISTRO_SOURCE=/github/${DISTRO_NAME}.tar
$Env:PORTER_DEP=/github/cnabwslbuilder/porter.yaml
$Env:DOCKER_SOURCE=docker.exe
$Env:DOCKER-APP_SOURCE=docker-app.exe
$Env:WSL_SOURCE=wsl.exe
```

2. Install the WSL custom distro with the `porter` command

```
porter run --action install --file ./porter.yaml
```

3. Launch the newly created WSL distro

```
wsl.exe -d wslalpine
```