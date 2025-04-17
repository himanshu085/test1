
<p align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/2/24/Ansible_logo.svg" alt="Ansible Logo" width="250"/>
</p>

# 🤖 Ansible | Playbook | Standard Operating Procedure (SOP)

| Author       | Created on | Version | Last updated by | Last edited on | Internal Reviewer | Reviewer L0 | Reviewer L1 | Reviewer L2 |
|--------------|------------|---------|------------------|----------------|-------------------|-------------|-------------|-------------|
| Himanshu     | 2025-04-17 | 1.0     | Himanshu         | 2025-04-17     | Komal Jaiswal     | Imran       | Shashi      | Mahesh Kumar |

---

## 📖 Table of Contents

- [📌 Overview](#-overview)
- [🎯 Purpose of the Playbook](#-purpose-of-the-playbook)
- [🔧 Prerequisites](#-prerequisites)
- [📂 Folder & File Structure](#-folder--file-structure)
- [📝 Required Inputs](#-required-inputs)
- [🚀 Steps to Execute Playbook](#-steps-to-execute-playbook)
- [✅ Validation & Output Checks](#-validation--output-checks)
- [❗ Troubleshooting](#-troubleshooting)
- [✅ Best Practices](#-best-practices)
- [🧾 Conclusion](#-conclusion)
- [📞 Contact Information](#-contact-information)
- [🔗 References](#-references)

---

## 📌 Overview

This **SOP** provides guidelines for writing, executing, and validating **Ansible Playbooks**. An **Ansible Playbook** is an automation tool that enables system administrators to define a series of tasks to be executed across multiple Linux-based machines or remote servers. This document outlines the process to ensure effective and reliable automation while maintaining consistency across environments.

The SOP includes:
- Prerequisites required to run playbooks
- The folder and file structure for organizing Ansible files
- Step-by-step instructions for executing a playbook
- Validation checks to ensure successful execution
- Troubleshooting tips for common issues

---

## 🎯 Purpose of the Playbook

The Ansible playbook is designed to:

- Automate installation of software packages  
- Configure system files  
- Restart services post-deployment  
- Run idempotent tasks across multiple hosts

---

## 🔧 Prerequisites

| Item                       | Requirement / Description                          |
|----------------------------|-----------------------------------------------------|
| **OS**                     | Ubuntu 20.04 LTS or later                          |
| **Ansible Version**        | 2.10+ (use `ansible --version` to verify)          |
| **SSH Access**             | Passwordless SSH to target nodes                   |
| **Inventory File**         | Properly defined with target host IPs              |
| **Python**                 | Python 3.x must be installed on control & managed nodes |
| **Sudo Privileges**        | Required on all target hosts                       |
| **Internet Access**        | Optional (required if packages are installed)      |

---

## 📂 Folder & File Structure

```text
ansible-playbook/
├── inventory.ini
├── playbook.yml
├── group_vars/
│   └── all.yml
├── roles/
│   └── common/
│       ├── tasks/
│       │   └── main.yml
│       └── handlers/
│           └── main.yml
```

---

## 📝 Required Inputs

| Input Type         | Description                                     |
|--------------------|-------------------------------------------------|
| `inventory.ini`    | List of target hosts or groups                  |
| `playbook.yml`     | Main playbook containing roles or tasks         |
| `group_vars/all.yml` | Variables used across all hosts               |
| **Extra Vars (Optional)** | Passed using `--extra-vars "key=value"` |

---

## 🚀 Steps to Execute Playbook

1. Navigate to your playbook directory:
   ```bash
   cd ansible-playbook/
   ```

2. Run the playbook:
   ```bash
   ansible-playbook -i inventory.ini playbook.yml
   ```

3. Run with extra variables:
   ```bash
   ansible-playbook -i inventory.ini playbook.yml --extra-vars "env=dev"
   ```

---

## ✅ Validation & Output Checks

| Checkpoint             | Expected Result                                 |
|------------------------|--------------------------------------------------|
| Syntax Check           | No syntax errors (`ansible-playbook --syntax-check`) |
| Host Reachability      | All hosts reachable (`ansible all -m ping`)     |
| Task Completion        | Green/ok status for all steps                   |
| Service Status Check   | Use `ansible all -a "systemctl status <service>"` |
| Log File Review        | Logs saved using `--log-path=ansible.log`       |

---

## ❗ Troubleshooting

| Issue                        | Solution                                           |
|-----------------------------|----------------------------------------------------|
| SSH Authentication Failure  | Ensure key-based authentication is configured      |
| Module not found            | Ensure Python is installed on the remote host      |
| Permission Denied (Sudo)    | Add target user to sudoers or use `--become`       |
| Variable Not Defined        | Check `group_vars` or pass with `--extra-vars`     |
| Task Skipped Unexpectedly   | Verify `when` conditions in task definitions        |

---

## ✅ Best Practices

- Use `--check` mode to simulate changes before running  
- Keep roles modular and reusable  
- Secure secrets with Ansible Vault  
- Document all variables in `README.md` for clarity  
- Use `ansible-lint` to validate syntax and ensure best practices

---

## 🧾 Conclusion

This SOP ensures a structured and reliable way to automate system administration tasks using Ansible Playbooks. By following these steps and incorporating validation checks, you will:

- Ensure predictable, repeatable automation  
- Reduce manual intervention and errors  
- Maintain consistent configurations across environments  

Properly structured playbooks are key to efficient infrastructure as code practices.

---

## 📞 Contact Information

| Name               | Email Address                                  |
|--------------------|------------------------------------------------|
| Himanshu Parashar  | himanshu.parashar.snaatak@mygurukulam.co      |

---

## 🔗 References

- [Ansible Documentation](https://docs.ansible.com/)
- [Ansible Best Practices](https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html)
- [Ansible Galaxy Roles](https://galaxy.ansible.com/)
- [YAML Basics](https://yaml.org/)
