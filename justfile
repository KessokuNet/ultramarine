image_tag := "ghcr.io/kessokunet/ultramarine:latest"
build:
    docker build -t {{image_tag}} .

push:
    docker push {{image_tag}}

bush: build push
    