
# alpine-docker (alpine-docker)

Installs docker and docker-compose on alpine

## Example Usage

```json
"features": {
    "ghcr.io/cirolosapio/devcontainers-features/alpine-docker": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| hostDockerGid | Docker group id on the host machine (retrieve with "getent group docker \| cut -d: -f3" | string | - |
| installDockerCompose | Install Docker Compose? | boolean | false |

## Customizations

### VS Code Extensions

- `ms-azuretools.vscode-docker`



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/cirolosapio/devcontainers-features/blob/main/src/alpine-docker/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
