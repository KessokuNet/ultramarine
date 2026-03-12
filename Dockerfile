FROM ghcr.io/ultramarine-linux/plasma-bootc:43
LABEL org.opencontainers.image.source=https://github.com/KessokuNet/ultramarine
RUN --mount=type=cache,target=/var/cache \
    dnf do -y --action=install \
        waydroid \
        waydroid-helper \
        libadwaita \
        python3-aiofiles \
        python3-httpx \
        vte291-gtk4 \
        chezmoi \
        zoxide \
        starship \
        && dnf clean all

RUN sed -i~ -E 's/=.\$\(command -v (nft|ip6?tables-legacy).*/=/g' /usr/lib/waydroid/data/scripts/waydroid-net.sh
