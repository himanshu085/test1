<p align="center">
  <img src="https://your-host.com/migration-logo.png" alt="Migration Logo" width="200"/>
</p>

# 🔄 Migration SOP - Step-by-Step Guide (Old ➡️ New Server)

| Author   | Created on | Version | Last updated by | Last edited on | Internal Reviewer | Reviewer L0 | Reviewer L1 | Reviewer L2 |
|----------|------------|---------|------------------|----------------|-------------------|-------------|-------------|-------------|
| Himanshu | 2025-04-16 | 1.1     | Himanshu         | 2025-04-16     | Komal Jaiswal     | Imran       | Shashi      | Mahesh Kumar |

---

## 📚 Table of Contents

- [📌 Overview](#-overview)
- [❓ What is Migration?](#-what-is-migration)
- [💡 Why is Migration Important?](#-why-is-migration-important)
- [⚙️ Step-by-Step Setup on Old Server](#️-step-by-step-setup-on-old-server)
- [🚚 Step-by-Step Migration to New Server](#-step-by-step-migration-to-new-server)
- [✅ Post-Migration Checks](#-post-migration-checks)
- [✅ Best Practices](#-best-practices)
- [📎 References](#-references)
- [📞 Contact Information](#-contact-information)

---

## 📌 Overview

This SOP covers full setup on the old server followed by the migration steps to a new server. Includes setup, backup, transfer, and restore process with working commands.

---

## ❓ What is Migration?

Migration is the process of moving data, code, and infrastructure from one server (source) to another (destination), usually for upgrades, scaling, or restructuring.

---

## 💡 Why is Migration Important?

- Modernizes infrastructure  
- Improves security and performance  
- Reduces technical debt  
- Enables cloud or container adoption

---

## ⚙️ Step-by-Step Setup on Old Server

🟦 1. Update & Install Dependencies
```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y python3-venv mysql-server nginx
```

🟦 2. Clone or Setup App
```bash
git clone https://github.com/example/my-app.git
cd my-app
```

🟦 3. Setup Python Virtual Environment
```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
deactivate
```

🟦 4. Setup MySQL & Sample Data
```bash
sudo systemctl start mysql
mysql -u root -p -e "CREATE DATABASE mydatabase;"
mysql -u root -p mydatabase < sample-data.sql
```

🟦 5. Configure & Start App (example: Flask)
```bash
nano .env  # set environment variables
flask run --host=0.0.0.0 --port=8000
```

---

## 🚚 Step-by-Step Migration to New Server

🟩 1. Backup Codebase & Database on Old Server
```bash
tar -czvf myapp-backup.tar.gz my-app
mysqldump -u root -p mydatabase > mydb-backup.sql
```

🟩 2. Transfer to New Server
```bash
scp myapp-backup.tar.gz ubuntu@NEW_SERVER_IP:~/
scp mydb-backup.sql ubuntu@NEW_SERVER_IP:~/
```

🟩 3. SSH into New Server
```bash
ssh ubuntu@NEW_SERVER_IP
```

🟩 4. Install Required Packages
```bash
sudo apt update && sudo apt install -y python3-venv mysql-server nginx
```

🟩 5. Extract Codebase & Setup App
```bash
tar -xzvf myapp-backup.tar.gz
sudo mv my-app /var/www/
cd /var/www/my-app
```

🟩 6. Restore Database
```bash
sudo systemctl start mysql
mysql -u root -p -e "CREATE DATABASE mydatabase;"
mysql -u root -p mydatabase < ~/mydb-backup.sql
```

🟩 7. Setup Python Environment
```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
deactivate
```

🟩 8. Start the App (example: Flask)
```bash
flask run --host=0.0.0.0 --port=8000
```

---

## ✅ Post-Migration Checks

- App accessible at: `http://<new_server_ip>:8000`
- DB restored successfully:
```bash
mysql -u root -p -e "SHOW TABLES IN mydatabase;"
```
- Check logs: `journalctl -u nginx` or app logs

---

## ✅ Best Practices

- 🧪 Test migration on staging first  
- 🔐 Use passwordless SSH keys  
- 🗂️ Maintain .env separately, don’t share over SCP  
- ♻️ Remove backup files after successful setup  

---

## 📎 References

- [MySQL Dump & Restore](https://dev.mysql.com/doc/refman/8.0/en/mysqldump.html)
- [Ubuntu venv Guide](https://docs.python.org/3/library/venv.html)
- [Gunicorn + Flask + Nginx](https://docs.gunicorn.org/en/stable/deploy.html)

---

## 📞 Contact Information

| Name              | Email Address                                   |
|-------------------|--------------------------------------------------|
| Himanshu Parashar | himanshu.parashar.snaatak@mygurukulam.co        |
