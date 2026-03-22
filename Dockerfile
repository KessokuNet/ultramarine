
ARG BASE_FLAVOR
FROM ghcr.io/ultramarine-linux/plasma-bootc:43${BASE_FLAVOR}
LABEL org.opencontainers.image.source=https://github.com/KessokuNet/ultramarine

# craft DNF transaction
RUN dnf copr enable -y lizardbyte/beta
RUN --mount=type=cache,target=/var/cache \
    dnf do -y --action=install \
    waydroid \
    waydroid-helper \
    libadwaita \
    python3-aiofiles \
    python3-httpx \
    vte291-gtk4 \
    fakeroot \
    chezmoi \
    zoxide \
    deno \
    bun-bin \
    eza \
    sheldon \
    rclone \
    just \
    tailscale \
    gh \
    Sunshine \
    ceph-common \
    starship

# RUN setcap cap_sys_admin+p /usr/bin/sunshine

RUN sed -i~ -E 's/=.\$\(command -v (nft|ip6?tables-legacy).*/=/g' /usr/lib/waydroid/data/scripts/waydroid-net.sh
RUN sed -i -E 's/^(VARIANT_ID=)\"?plasma\"?$/\1plasma-kessokunet/' /usr/lib/os-release
RUN sed -i -E 's/Plasma Edition/KessokuNet/g' /usr/lib/os-release

RUN echo ntsync | sudo tee /usr/lib/modules-load.d/ntsync.conf