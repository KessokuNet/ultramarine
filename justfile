image_tag := "ghcr.io/kessokunet/ultramarine:latest"
build:
    sudo podman build -t {{image_tag}} .

push:
    sudo podman push {{image_tag}}

bush: build push
    