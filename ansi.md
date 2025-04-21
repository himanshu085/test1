<p align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/2/24/Ansible_logo.svg" alt="Ansible Logo" width="250"/>
</p>

# Ansible | Playbook | Standard Operating Procedure (SOP)

| **Author** | **Created on** | **Version** | **Last updated by** | **Last Edited On** | **Level**          | **Reviewer**    |
|------------|----------------|-------------|---------------------|--------------------|--------------------|-----------------|
| Himanshu   | 2025-04-14     | 1.0         | Himanshu            | 2025-04-14         | Internal Reviewer  | Komal Jaiswal   |
| Himanshu   | 2025-04-14     | 1.1         | Himanshu            | 2025-04-21         | L0                 | Imran           |
| Himanshu   | 2025-04-14     | 1.1         | Himanshu            | 2025-04-21         | L1                 | Shashi          |
| Himanshu   | 2025-04-14     | 1.1         | Himanshu            | 2025-04-21         | L2                 | Mahesh Kumar    |

---

## Table of Contents

- [Overview](#overview)
- [Purpose of the Playbook](#purpose-of-the-playbook)
- [Prerequisites](#prerequisites)
- [Folder & File Structure](#folder--file-structure)
- [Required Inputs](#required-inputs)
- [Steps to Execute Playbook](#steps-to-execute-playbook)
- [NGINX Installation Example (Static vs. Dynamic Inventory)](#nginx-installation-example-static-vs-dynamic-inventory)
- [Validation & Output Checks](#validation--output-checks)
- [Troubleshooting](#troubleshooting)
- [Best Practices](#best-practices)
- [Contact Information](#contact-information)
- [References](#references)

---

## Overview

This **SOP** provides guidelines for writing, executing, and validating **Ansible Playbooks**. An **Ansible Playbook** is an automation tool that enables system administrators to define a series of tasks to be executed across multiple Linux-based machines or remote servers. This document outlines the process to ensure effective and reliable automation while maintaining consistency across environments.

The SOP includes:
- Prerequisites required to run playbooks
- The folder and file structure for organizing Ansible files
- Step-by-step instructions for executing a playbook
- Validation checks to ensure successful execution
- Troubleshooting tips for common issues

---

## Purpose of the Playbook

The Ansible playbook is designed to:

- Automate installation of software packages  
- Configure system files  
- Restart services post-deployment  
- Run idempotent tasks across multiple hosts

---

## Prerequisites

| Item                       | Requirement / Description                          |
|----------------------------|-----------------------------------------------------|
| **OS**                     | Ubuntu 20.04 LTS or later                          |
| **Ansible Version**        | 2.10+ (use `ansible --version` to verify)          |
| **SSH Access**             | Passwordless SSH to target nodes                   |
| **Inventory File**         | Properly defined with target host IPs              |
| **Python**                 | Python 3.x must be installed on master             |
| **Sudo Privileges**        | Required on all target hosts                       |
| **Network**                | Internet access for downloading Ansible packages   |

---

## Folder & File Structure

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

## Required Inputs

| Input Type         | Description                                     |
|--------------------|-------------------------------------------------|
| `inventory.ini`    | List of target hosts or groups                  |
| `playbook.yml`     | Main playbook containing roles or tasks         |
| `group_vars/all.yml` | Variables used across all hosts               |
| **Extra Vars (Optional)** | Passed using `--extra-vars "key=value"` |

---

## Steps to Execute Playbook

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

## NGINX Installation Example (Static vs. Dynamic Inventory)

### Static Inventory Example

**`inventory.ini`**
```ini
[webservers]
192.168.1.100 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_rsa
```

**`nginx-playbook.yml`**
```yaml
- name: Install and start NGINX
  hosts: webservers
  become: true
  tasks:
    - name: Install NGINX
      apt:
        name: nginx
        state: present
        update_cache: yes

    - name: Ensure NGINX is running
      service:
        name: nginx
        state: started
        enabled: true
```

**Run the playbook**
```bash
ansible-playbook -i inventory.ini nginx-playbook.yml
```

---

### Dynamic Inventory Example (AWS EC2 with aws_ec2 plugin)

**`inventory_aws.yml`**
```yaml
plugin: aws_ec2
regions:
  - us-east-1
filters:
  tag:Role: webserver
hostnames:
  - private-ip-address
keyed_groups:
  - key: tags.Name
    prefix: tag
```

**Enable AWS plugin:**
- Ensure you have Boto3 & botocore installed
- AWS credentials set up (`~/.aws/credentials` or ENV variables)

**Run playbook with dynamic inventory**
```bash
ansible-playbook -i inventory_aws.yml nginx-playbook.yml
```

**Pro Tips**
- Use `--limit` to target specific hosts in dynamic inventory
- Combine dynamic inventory with tags to apply roles cleanly in cloud environments

---

## Validation & Output Checks

| Checkpoint             | Expected Result                                 |
|------------------------|--------------------------------------------------|
| Syntax Check           | No syntax errors (`ansible-playbook --syntax-check`) |
| Host Reachability      | All hosts reachable (`ansible all -m ping`)     |
| Task Completion        | Green/ok status for all steps                   |
| Service Status Check   | Use `ansible all -a "systemctl status <service>"` |
| Log File Review        | Logs saved using `--log-path=ansible.log`       |

---

## Troubleshooting

| Issue                        | Solution                                           |
|-----------------------------|----------------------------------------------------|
| SSH Authentication Failure  | Ensure key-based authentication is configured      |
| Module not found            | Ensure Python is installed on the remote host      |
| Permission Denied (Sudo)    | Add target user to sudoers or use `--become`       |
| Variable Not Defined        | Check `group_vars` or pass with `--extra-vars`     |
| Task Skipped Unexpectedly   | Verify `when` conditions in task definitions        |

---

## Best Practices

- Use `--check` mode to simulate changes before running  
- Keep roles modular and reusable  
- Secure secrets with Ansible Vault  
- Document all variables in `README.md` for clarity  
- Use `ansible-lint` to validate syntax and ensure best practices

---

## Contact Information

| Name               | Email Address                                  |
|--------------------|------------------------------------------------|
| Himanshu Parashar  | himanshu.parashar.snaatak@mygurukulam.co      |

---

## References

| Topic                      | Link                                                                 | Description                                                                      |
|----------------------------|----------------------------------------------------------------------|----------------------------------------------------------------------------------|
| Ansible Documentation      | [Ansible Documentation](https://docs.ansible.com/)                   | Official documentation for Ansible usage and modules.                           |
| Ansible Best Practices     | [Ansible Best Practices](https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html) | Guidelines to write clean and efficient playbooks.                              |
| Ansible Galaxy Roles       | [Ansible Galaxy Roles](https://galaxy.ansible.com/)                  | Public repository of community-contributed roles.                               |
| YAML Basics                | [YAML Basics](https://yaml.org/)                                     | Official site explaining YAML syntax and usage.                                 |
