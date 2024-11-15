```bash
sudo nano /etc/apt/preferences.d/99-no-upgrade
---
Package: *
Pin: release a=jammy
Pin-Priority: 1001
```

```bash
sudo nano /etc/update-manager/release-upgrades

Prompt=never
```
