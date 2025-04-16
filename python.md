
# 🐍 Python Virtual Environment - SOP

| Author       | Created on | Version | Last updated by | Last edited on | Internal Reviewer | Reviewer L0 | Reviewer L1 | Reviewer L2 |
|--------------|------------|---------|------------------|----------------|-------------------|-------------|-------------|-------------|
| Himanshu     | 2025-04-14 | 2.0     | Himanshu         | 2025-04-14     | Komal Jaiswal     | Imran       | Shashi      | Mahesh Kumar|

---

## 📌 Overview

This document outlines the Standard Operating Procedure (SOP) for creating and managing Python virtual environments. It covers creation, activation, package installation, freezing, deactivation, deletion, and troubleshooting common issues.

---

## 🧰 Tools & Commands Used

- `python3`
- `venv`
- `pip`

---

## 🛠️ Create a Virtual Environment

**Command:**
```bash
python3 -m venv myenv
```

> Creates a virtual environment named `myenv` in the current directory.

---

## 🚀 Activate the Virtual Environment

### On Linux/macOS:
```bash
source myenv/bin/activate
```

### On Windows (CMD):
```cmd
myenv\Scripts\activate.bat
```

### On Windows (PowerShell):
```powershell
myenv\Scripts\Activate.ps1
```

---

## 📦 Install Packages

**Command:**
```bash
pip install requests
```

> Installs the `requests` package inside the virtual environment.

---

## 📋 Freeze Installed Packages

**Command:**
```bash
pip freeze > requirements.txt
```

> Saves all installed packages and versions to `requirements.txt`.

---

## 📥 Install from requirements.txt

**Command:**
```bash
pip install -r requirements.txt
```

> Installs all packages listed in `requirements.txt`.

---

## ❌ Deactivate the Virtual Environment

**Command:**
```bash
deactivate
```

> Deactivates the currently active virtual environment.

---

## 🗑️ Delete the Virtual Environment

### On Linux/macOS:
```bash
rm -rf myenv
```

### On Windows:
```cmd
rmdir /s myenv
```

> Permanently deletes the `myenv` virtual environment folder.

---

## 🧯 Troubleshooting

### ❗ Activation Error (Permission Denied)
```bash
chmod +x myenv/bin/activate
```

> Grants executable permission to the activation script.

### 🔐 Permission Issues with pip
```bash
pip install --user requests
```

> Installs the package for the current user without requiring root.

---

## ✅ Best Practices

- Always use virtual environments for isolated project dependencies
- Use `requirements.txt` for reproducible environments
- Use separate environments per project
- Regularly update packages using:
```bash
pip list --outdated
```
- Avoid system-wide `pip install`

---

## 🔗 References

- [Python venv documentation](https://docs.python.org/3/library/venv.html)
- [pip documentation](https://pip.pypa.io/en/stable/)
- [Python Packaging Guide](https://packaging.python.org/)

---

## 📞 Contact Information

| Name              | Email Address                                   |
|-------------------|--------------------------------------------------|
| Himanshu Parashar | himanshu.parashar.snaatak@mygurukulam.co        |
