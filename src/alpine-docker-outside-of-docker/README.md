### **IMPORTANT NOTE**
- **Ids used to publish this Feature in the past - 'alpine-docker'**

# alpine-docker-outside-of-docker (alpine-docker-outside-of-docker)

Re-use the host docker socket, adding the Docker CLI to alpine container

## Example Usage

```json
"features": {
    "ghcr.io/cirolosapio/devcontainers-features/alpine-docker-outside-of-docker:0": {
        "hostDockerGid": 1001
    }
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| hostDockerGid | Docker group id on the host machine (retrieve with "getent group docker \| cut -d: -f3") | string | 1001 |
| installDockerCompose | Install Docker Compose? | boolean | false |

## Customizations

### VS Code Extensions

- `ms-azuretools.vscode-docker`



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/cirolosapio/devcontainers-features/blob/main/src/alpine-docker-outside-of-docker/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
