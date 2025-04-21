
<p align="center">
  <img src="https://assets.ubuntu.com/v1/29985a98-ubuntu-logo32.png" alt="Ubuntu Logo" width="200"/>
</p>

# Ubuntu OS - Software Management SOP

| Author       | Created on | Version | Last updated by | Last edited on | Internal Reviewer | Reviewer L0 | Reviewer L1 | Reviewer L2 |
|--------------|------------|---------|------------------|----------------|-------------------|-------------|-------------|-------------|
| Himanshu     | 2025-04-14 | 1.0     | Himanshu         | 2025-04-14     | Komal Jaiswal     | Imran       | Shashi      | Mahesh kumar |

---

## Table of Contents

- [Overview](#overview)
- [What is Software Management?](#what-is-software-management)
- [Why Software Management?](#why-software-management)
- [Tools & Commands Used](#tools--commands-used)
- [Prerequisites](#prerequisites)
- [Update System](#update-system)
- [Install Software](#install-software)
- [Remove Software](#remove-software)
- [Clean Package Cache](#clean-package-cache)
- [Search & Inspect Packages](#search--inspect-packages)
- [List Installed Packages](#list-installed-packages)
- [Install Software using Snap](#install-software-using-snap)
- [Update Snap Packages](#update-snap-packages)
- [Remove Snap Packages](#remove-snap-packages)
- [List Installed Snaps](#list-installed-snaps)
- [Install Software using Flatpak](#install-software-using-flatpak)
- [Best Practices for APT](#best-practices-for-apt)
- [Best Practices for Snap](#best-practices-for-snap)
- [Best Practices for Flatpak](#best-practices-for-flatpak)
- [Conclusion](#conclusion)
- [Contact Information](#contact-information)
- [References](#references)

---

## Overview

This document outlines the standard procedure for managing software on Ubuntu OS using the `apt` package manager. It covers installing, updating, and removing software packages efficiently and securely.

---

## What is Software Management?

Software management refers to the process of installing, updating, configuring, and removing software on a computer system using tools like package managers (APT, Snap, Flatpak). It ensures systems are up to date, secure, and stable.

---

## Why Software Management?

- Ensures your system has the necessary tools and applications
- Keeps software updated for security and bug fixes
- Helps maintain system performance and free up space
- Reduces manual errors with automation of software tasks

---

## Tools & Commands Used

- `apt` – Advanced Package Tool (primary command-line package manager for Ubuntu)
- `dpkg` – Debian package manager backend used to query package status

---

## Prerequisites

| Category               | Item                        | Requirement / Description                                 |
|------------------------|-----------------------------|------------------------------------------------------------|
| **Operating System**   | Ubuntu Version              | Ubuntu 20.04 LTS or later (LTS recommended)                |
| **User Permissions**   | Privileges                  | User must have `sudo` (administrator) rights               |
| **Network**            | Internet Access             | Required to access official repositories and mirrors       |
| **System Tools**       | Terminal                    | Access to command-line terminal (`bash`, `gnome-terminal`) |
| **Disk Space**         | Minimum Free Space          | ~500MB recommended for updates and software installs       |
| **Connectivity Tools** | Package Repository Access   | Access to `archive.ubuntu.com`, `security.ubuntu.com`      |
| **Package Managers**   | APT Installed               | Pre-installed by default on Ubuntu                         |
|                        | Snap Installed (optional)   | Needed for Snap package management                         |
|                        | Flatpak Installed (optional)| Needed for Flatpak support (installable via APT)           |

---

## Update System

### Update Package List
```bash
sudo apt update
```

### Upgrade Installed Packages
```bash
sudo apt upgrade
```

### Full Upgrade (with dependency resolution)
```bash
sudo apt full-upgrade
```

---

## Install Software

### Basic Installation
```bash
sudo apt install <package-name>
```

### Auto-confirm Installation
```bash
sudo apt install -y <package-name>
```

---

## Remove Software

### Remove (keep config)
```bash
sudo apt remove <package-name>
```

### Purge (remove config too)
```bash
sudo apt purge <package-name>
```

### Auto-remove Unused Dependencies
```bash
sudo apt autoremove
```

---

## Clean Package Cache

### Remove downloaded .deb files
```bash
sudo apt clean
```

### Remove outdated package lists
```bash
sudo apt autoclean
```

---

## Search & Inspect Packages

### Search for Packages
```bash
apt search <package-name>
```

### Show Package Info
```bash
apt show <package-name>
```

---

## List Installed Packages

### All Installed Packages
```bash
dpkg -l
```

### Filter Installed Package
```bash
dpkg -l | grep <package-name>
```

---

## Install Software using Snap

Snap is a universal package manager developed by Canonical.

### Install a Snap Package
```bash
sudo snap install <package-name>
```

**Example:**
```bash
sudo snap install postman
```

### Install with Classic Confinement
```bash
sudo snap install <package-name> --classic
```

---

## Update Snap Packages
```bash
sudo snap refresh
```

---

## Remove Snap Packages
```bash
sudo snap remove <package-name>
```

---

## List Installed Snaps
```bash
snap list
```

---

## Install Software using Flatpak

Flatpak is a cross-distribution package manager often used with desktop apps.

### Install Flatpak Support
```bash
sudo apt install flatpak
```

```bash
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

### Install a Flatpak App
```bash
sudo flatpak install flathub <package-name>
```

**Example:**
```bash
sudo flatpak install flathub com.spotify.Client
```

### Update Flatpak Apps
```bash
sudo flatpak update
```

### Remove Flatpak Apps
```bash
sudo flatpak uninstall <package-name>
```

### List Installed Flatpak Apps
```bash
sudo flatpak list
```

---

## Best Practices for APT

- Always run `sudo apt update` before installing new software
- Schedule `apt upgrade` or `full-upgrade` periodically
- Use `purge` instead of `remove` when clearing old configs
- Run `autoremove` and `clean` monthly to free up space

---

## Best Practices for Snap

- Use `--classic` flag only for trusted apps needing full system access
- Run `sudo snap refresh` weekly to ensure apps are updated
- Use `snap list` to audit installed applications periodically

---

## Best Practices for Flatpak

- Always enable Flathub repository for a wide range of apps
- Regularly run `flatpak update` to keep apps secure
- Uninstall apps you no longer use with `flatpak uninstall`

---

## Contact Information

| Name              | Email Address                                   |
|-------------------|--------------------------------------------------|
| Himanshu Parashar | himanshu.parashar.snaatak@mygurukulam.co        |

---

## References

| Topic                     | Link                                                                 | Description                                                     |
|---------------------------|----------------------------------------------------------------------|-----------------------------------------------------------------|
| APT - Ubuntu Manpage      | [APT - Ubuntu Manpage](https://manpages.ubuntu.com/manpages/jammy/en/man8/apt.8.html) | Official manual for the `apt` package manager on Ubuntu.        |
| dpkg - Debian Package Manager | [dpkg - Debian Package Manager](https://manpages.ubuntu.com/manpages/jammy/en/man1/dpkg.1.html) | Documentation for the `dpkg` tool used for package management. |
| Snapcraft Documentation   | [Snapcraft Documentation](https://snapcraft.io/docs)                | Official guide for managing Snap packages on Ubuntu.            |
| Flatpak Documentation     | [Flatpak Documentation](https://docs.flatpak.org/en/latest/)        | Guide for using Flatpak to manage applications across Linux distros. |
| Debian Wiki: APT          | [Debian Wiki: APT](https://wiki.debian.org/Teams/Apt)               | Wiki page with extensive information about `APT` and its tools.|
| Flatpak on Flathub        | [Flatpak on Flathub](https://flathub.org/)                          | The central hub for Flatpak applications.                       |
| Snap Package List         | [Snap Package List](https://snapcraft.io/store)                     | A list of available Snap packages for installation.             |

