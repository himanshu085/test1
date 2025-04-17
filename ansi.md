
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
- [🔧 NGINX Installation Example (Static vs. Dynamic Inventory)](#-nginx-installation-example-static-vs-dynamic-inventory)
- [✅ Validation & Output Checks](#-validation--output-checks)
- [❗ Troubleshooting](#-troubleshooting)
- [✅ Best Practices](#-best-practices)
- [🧾 Conclusion](#-conclusion)
- [📞 Contact Information](#-contact-information)
- [🔗 References](#-references)

---

## 📌 Overview

This **SOP** provides guidelines for writing, executing, and validating **Ansible Playbooks**. An **Ansible Playbook** is an automation tool that enables system administrators to define a series of tasks to be executed across multiple Linux-based machines or remote servers...

## 🔧 NGINX Installation Example (Static vs. Dynamic Inventory)

### 🗂️ Static Inventory Example

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

### 🌐 Dynamic Inventory Example (AWS EC2 with aws_ec2 plugin)

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

💡 **Pro Tips**
- Use `--limit` to target specific hosts in dynamic inventory
- Combine dynamic inventory with tags to apply roles cleanly in cloud environments

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
