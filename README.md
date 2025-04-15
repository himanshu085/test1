
# 🖥️ Ubuntu OS - Software Management SOP

| Author       | Created on | Version | Last updated by | Last edited on | Internal Reviewer | Reviewer L0 | Reviewer L1 | Reviewer L2 |
|--------------|------------|---------|------------------|----------------|-------------------|-------------|-------------|-------------|
| Himanshu     | 2025-04-14 | 1.0     | Himanshu         | 2025-04-14     | Komal Jaiswal     | Imran       | Shashi      | Mahesh kumar |

---

## 📌 Overview

This document outlines the standard procedure for managing software on Ubuntu OS using the `apt` package manager. It covers installing, updating, and removing software packages efficiently and securely.

---

## 🧰 Tools & Commands Used

- `apt` – Advanced Package Tool (primary command-line package manager for Ubuntu)
- `dpkg` – Debian package manager backend used to query package status

---

## 🔐 Prerequisites

- Ubuntu 20.04 or later (LTS recommended)
- User must have `sudo` privileges
- Stable internet connection for accessing repositories

---

## 🔄 Update System

### 🟢 Update Package List
```bash
**sudo apt update**
```

---

### 🟡 Upgrade Installed Packages
```bash
**sudo apt upgrade**
```

---

### 🔴 Full Upgrade (with dependency resolution)
```bash
**sudo apt full-upgrade**
```

---

## ➕ Install Software

### ✅ Basic Installation
```bash
**sudo apt install <package-name>**
```

### 🚀 Auto-confirm Installation
```bash
**sudo apt install -y <package-name>**
```

---

## ➖ Remove Software

### 🗑️ Remove (keep config)
```bash
**sudo apt remove <package-name>**
```

### 🔥 Purge (remove config too)
```bash
**sudo apt purge <package-name>**
```

### 🧹 Auto-remove Unused Dependencies
```bash
**sudo apt autoremove**
```

---

## 🧼 Clean Package Cache

### 🧽 Remove downloaded .deb files
```bash
**sudo apt clean**
```

### 🗃️ Remove outdated package lists
```bash
**sudo apt autoclean**
```

---

## 🔍 Search & Inspect Packages

### 🔎 Search for Packages
```bash
**apt search <package-name>**
```

### 📦 Show Package Info
```bash
**apt show <package-name>**
```

---

## 📋 List Installed Packages

### 📃 All Installed Packages
```bash
**dpkg -l**
```

### 🔍 Filter Installed Package
```bash
**dpkg -l | grep <package-name>**
```

## ➕ Install Software using Snap

Snap is a universal package manager developed by Canonical.

### 🔧 Install a Snap Package
```bash
**sudo snap install <package-name>**
```

**Example:**
```bash
**sudo snap install postman**
```

### 📝 Install with Classic Confinement
```bash
**sudo snap install <package-name> --classic**
```

---

## 🔄 Update Snap Packages
```bash
**sudo snap refresh**
```

---

## ➖ Remove Snap Packages
```bash
**sudo snap remove <package-name>**
```

---

## 📋 List Installed Snaps
```bash
**snap list**
```

---

## ➕ Install Software using Flatpak

Flatpak is a cross-distribution package manager often used with desktop apps.

### 🔧 Install Flatpak Support
```bash
**sudo apt install flatpak**
```

```bash
**flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo**
```

---

### 🔧 Install a Flatpak App
```bash
**flatpak install flathub <package-name>**
```

**Example:**
```bash
**flatpak install flathub com.spotify.Client**
```

---

### 🔄 Update Flatpak Apps
```bash
**flatpak update**
```

---

### ➖ Remove Flatpak Apps
```bash
**flatpak uninstall <package-name>**
```

---

### 📋 List Installed Flatpak Apps
```bash
**flatpak list**
```

---

## ✅ Best Practices for APT

- Always run `sudo apt update` before installing new software
- Schedule `apt upgrade` or `full-upgrade` periodically
- Use `purge` instead of `remove` when clearing old configs
- Run `autoremove` and `clean` monthly to free up space

---

## ✅ Best Practices for Snap

- Use `--classic` flag only for trusted apps needing full system access
- Run `sudo snap refresh` weekly to ensure apps are updated
- Use `snap list` to audit installed applications periodically

---

## ✅ Best Practices for Flatpak

- Always enable Flathub repository for a wide range of apps
- Regularly run `flatpak update` to keep apps secure
- Uninstall apps you no longer use with `flatpak uninstall`


## 📞 Contact Information

| Name              | Email Address                                   |
|-------------------|--------------------------------------------------|
| Himanshu Parashar | himanshu.parashar.snaatak@mygurukulam.co        |

---

## 🔗 References

- [APT - Ubuntu Manpage](https://manpages.ubuntu.com/manpages/jammy/en/man8/apt.8.html)
- [dpkg - Debian Package Manager](https://manpages.ubuntu.com/manpages/jammy/en/man1/dpkg.1.html)
- [Snapcraft Documentation](https://snapcraft.io/docs)
- [Flatpak Documentation](https://docs.flatpak.org/en/latest/)
- [Debian Wiki: APT](https://wiki.debian.org/Teams/Apt)
- [Flatpak on Flathub](https://flathub.org/)
- [Snap Package List](https://snapcraft.io/store)
  
