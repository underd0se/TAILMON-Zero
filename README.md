# TAILMON ZER0 v0.1.0
Asus-Merlin Tailscale Installer, Configurator and Monitor (Swapless Edition)

---

**Original Project:** This is a fork of the amazing [TAILMON](https://github.com/ViktorJp/TAILMON) project originally created by ViktorJp. All credit for the core implementation and terminal UI goes to the original author. 

### Why TAILMON ZER0?
TAILMON ZER0 was created to explicitly support Asuswrt-Merlin routers running **without swap space** (e.g. strict 512MB RAM limits) which natively causes Go-based `tailscaled` binaries to crash with `Segmentation fault` on startup. 

**Key Changes from Upstream:**
- **Dynamic Swapless Overcommit Bypass:** Safely tracks and conditionally injects `vm.overcommit_memory=0` during boot for swapless routers, natively integrated into Tailmon's `saveconfig()` to guarantee restoration upon uninstall.
- **Zero NVRAM Footprint:** Complete removal of deprecated/messy NVRAM variable storage for memory management tracking.
- **Aggressive Memory Tuning:** Hardcoded `GOMEMLIMIT=20MiB`, `GOGC=20`, and `GOMAXPROCS=1` via explicit native `export` declarations inside the `S06tailscaled` init script.

---

### Installation
To install TAILMON ZER0 via SSH on your Asuswrt-Merlin router, simply run:
```sh
curl --silent --retry 3 "https://raw.githubusercontent.com/underd0se/TAILMON-Zero/main/tailmon-zero.sh" -o "/jffs/scripts/tailmon-zero.sh" && chmod 755 "/jffs/scripts/tailmon-zero.sh" && sh /jffs/scripts/tailmon-zero.sh
```

> **Note on Migration:** TAILMON and TAILMON ZER0 cannot run alongside each other. If you already have the original TAILMON installed, the setup process will automatically detect it and prompt you to cleanly remove it before proceeding. All necessary memory management adaptations will then be applied for you.

### Uninstallation
If you ever choose to completely uninstall TAILMON ZER0, all modified router memory management settings (such as overcommit bypass rules) will be cleanly reverted back to their original system defaults.

*(For support and discussion regarding the original upstream project, visit the [SNBForums Thread](https://www.snbforums.com/threads/tailmon-v1-3-4-2026-jul-12-wireguard-based-tailscale-installer-configurator-and-monitor-available-in-amtm.97556/)).*
