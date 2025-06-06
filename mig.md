<p align="center">
  <img src="https://raw.githubusercontent.com/golang-migrate/migrate/master/assets/logo.svg" alt="Migrate Logo" width="150"/>
</p>

# 🔄 Migration Tool Setup & Usage SOP (Multi-Language Support)

| Author   | Created on | Version | Last updated by | Last edited on | Internal Reviewer | Reviewer L0 | Reviewer L1 | Reviewer L2 |
|----------|------------|---------|------------------|----------------|-------------------|-------------|-------------|-------------|
| Himanshu | 2025-04-16 | 1.0     | Himanshu         | 2025-04-16     | Komal Jaiswal     | Imran       | Shashi      | Mahesh Kumar |

## 📚 Table of Contents
- [📌 Overview](#-overview)
- [❓ What is a Database Migration Tool?](#-what-is-a-database-migration-tool)
- [💡 Why Use Migrate CLI?](#-why-use-migrate-cli)
- [🔧 Prerequisites](#-prerequisites)
- [🔧 Installation Steps](#-installation-steps)
- [🗂️ Directory Structure](#️-directory-structure)
- [⚙️ Create a New Migration](#-create-a-new-migration)
- [🚀 Run Migrations](#-run-migrations)
- [📋 Rollback Migrations](#-rollback-migrations)
- [🧼 Cleanup](#-cleanup)
- [✅ Best Practices](#-best-practices)
- [🧾 Conclusion](#-conclusion)
- [📞 Contact Information](#-contact-information)
- [📎 References](#-references)

## 📌 Overview
This SOP provides a universal guide to installing and using the migrate CLI tool for database schema changes in projects built with Go, Python, or other backend technologies. It is applicable across multiple repositories such as employee-api, salary-api, and attendance-api.

## ❓ What is a Database Migration Tool?
A database migration tool allows you to version control your database schema. Instead of applying changes manually, you define them in files, which migrate runs for you.

## 💡 Why Use Migrate CLI?
- Supports multiple databases (PostgreSQL, MySQL, SQLite)
- Easy to integrate into CI/CD
- Reversible migrations (up/down)
- Language-agnostic

## 🔧 Prerequisites

| **Category**               | **Requirement / Description**                              |
|----------------------------|------------------------------------------------------------|
| **Access to Servers**      | SSH or remote access to both the source and destination servers. |
| **Database Credentials**   | Required credentials for the database in use (e.g., username, password, and database name). |
| **Network Configuration**  | Ensure the servers can communicate with each other over the necessary ports (e.g., PostgreSQL: 5432, ScyllaDB: 9042). |
| **Permissions**            | Root or sudo privileges on both servers for installing tools and performing migrations. |
| **Backup Strategy**        | Ensure proper backup strategies are in place before performing any migration or schema changes. |
| **Required Tools**         | `migrate` CLI tool installed and accessible with the correct version. |
| **Supported Databases**    | Supported database engines (PostgreSQL, MySQL, SQLite, ScyllaDB) installed and configured. |
| **ScyllaDB Configuration** | Ensure ScyllaDB is configured and accessible if being used as the database. |

## 🔧 Installation Steps
```bash
# Go to home directory
cd ~

# Download migrate CLI binary
wget https://github.com/golang-migrate/migrate/releases/download/v4.15.2/migrate.linux-amd64.tar.gz

# Extract the binary
tar -xvf migrate.linux-amd64.tar.gz

# Move to a binary-accessible directory
sudo mv migrate /usr/local/bin/migrate

# Give execute permission
sudo chmod +x /usr/local/bin/migrate

# Verify installation
migrate -version
```

## 🗂️ Directory Structure
Ensure each repo has a migration folder with files like:
```
project-root/
├── migration/
│   ├── 001_init.up.sql
│   ├── 001_init.down.sql
```

## ⚙️ Create a New Migration
Use this command inside your project directory (replace name accordingly):
```bash
migrate create -ext sql -dir migration -seq create_users_table
```
This will generate:
```
migration/
├── 002_create_users_table.up.sql
├── 002_create_users_table.down.sql
```

## 🚀 Run Migrations
Make sure the database URL is correct.

**PostgreSQL Example:**
```bash
migrate -path migration -database "postgres://user:password@localhost:5432/dbname?sslmode=disable" up
```

**MySQL Example:**
```bash
migrate -path migration -database "mysql://user:password@tcp(localhost:3306)/dbname" up
```

**SQLite Example:**
```bash
migrate -path migration -database "sqlite3://db.sqlite" up
```

## 📋 Rollback Migrations
```bash
# Rollback last migration step
migrate -path migration -database <DB_URL> down 1
```

## 🧼 Cleanup
```bash
# Drop all migrations
migrate -path migration -database <DB_URL> drop
```

## ✅ Best Practices
- 🔒 Keep sensitive DB URLs in environment variables
- 🧪 Test on staging before production
- 🧾 Add descriptive names to migration files
- ✅ Validate migrations before pushing
- 🧹 Clean up unused files

## 🧾 Conclusion
Following this SOP ensures a consistent, safe, and scalable approach to handling database schema changes. It is language-agnostic, supports multiple repositories, and integrates seamlessly with development and deployment workflows.

## 📞 Contact Information

| Name             | Email Address                               |
|------------------|---------------------------------------------|
| Himanshu Parashar| himanshu.parashar.snaatak@mygurukulam.co    |

## 📎 References
- [Migrate CLI - Official Docs](https://github.com/golang-migrate/migrate)
- [PostgreSQL URL Format](https://www.postgresql.org/docs/current/libpq-connect.html#LIBPQ-CONNSTRING)
- [MySQL URL Format](https://github.com/go-sql-driver/mysql#dsn-data-source-name)
