
# alpnie-docker (alpnie-docker)

Installs docker and docker-compose on aplpine

## Example Usage

```json
"features": {
    "ghcr.io/cirolosapio/devcontainers-features/alpine-docker:0": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| installDockerCompose | Install Docker Compose? | boolean | true |

## Docker Compose

By default this feature installs also Docker Compose. You can disable this by setting `installDockerCompose` to `false`.

---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/cirolosapio/devcontainers-features/blob/main/src/php/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
