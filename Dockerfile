FROM ghcr.io/ultramarine-linux/plasma-bootc:43

RUN --mount=type=cache,target=/var/cache \
    dnf do -y --action=install \
        waydroid \
        chezmoi \
        zoxide \
        starship \
        && dnf clean all
