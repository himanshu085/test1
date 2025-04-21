# **POC for Frontend Application Deployment**
## Metadata
| **Author** | **Created on** | **Version** | **Last updated by**|**Last Edited On**|**Level** |**Reviewer** |
|------------|---------------------------|-------------|----------------|-----|-------------|-------------|
| Ramratan Yadav|     10-02-2025         | v3          | Ramratan Yadav   |21-02-2025    |  L1 | Abhishek Vishwakarma |
| Ramratan Yadav|                       | V2          | Ramratan Yadav   |19-02-2025    |  L0 |Tarun Singh |
| Ramratan Yadav|                       | v1          | Ramratan Yadav   |13-02-2025    |  Internal Reviewer | Komal Jaiswal |
---         
## Table of Contents
1. [Purpose](#Purpose)
2. [Installation of Software Dependencies](#Step-1-Installation-of-Software-Dependencies)
3. [Clone the Git Repository](#Step-2-Clone-the-Git-Repository)
4. [Application Deployment](#Step-3-Application-Deployment)
---
## **Purpose**
This document outlines the step-by-step process for deploying a Node.js-based frontend application, utilizing the necessary dependencies, and ensuring the application is up and running.
The purpose of this application deployment process is to set up the environment for the frontend application, handle the necessary dependencies, and ensure that it is fully operational.
---
## **Step-by-Step Installation of Frontend Application**
### Step 1: **Installation of Software Dependencies**
### **[Build Dependencies guide...](https://github.com/snaatak-Zero-Downtime-Crew/Documentation/blob/Ramratan-SCRUM-10/Common/Software/Node.js/Installation/README.md)**
Ensure **git** is installed to clone the repository:
```bash
sudo apt install git
```
### Step 2: **Clone the Git Repository**
Now, clone the frontend application from the GitHub repository:
```bash
git clone git@github.com:snaatak-Zero-Downtime-Crew/frontend.git
cd frontend/
```
#### **Build the Application**
Use **make** to build the application (you may use a `Makefile` if defined, otherwise directly use the `npm` build script):
```bash
make build
```
| **Step**            | **Command**                                  | **Description** |
|---------------------|--------------------------------------------|----------------|
| Clone Repository   | `git clone <repo-url>`                      | Clone the frontend repo |
| Navigate to Folder | `cd frontend/`                              | Move into the project directory |
| Build Application  | `make build`                                | Build the application using Makefile |
![frontend4](https://github.com/user-attachments/assets/898c1a1e-7dee-45d9-80ad-1175cee13562)
### Step 3: **Application Deployment**
#### **Start the Application**
Now, start the application using **npm**:
```bash
npm start
```
| **Command**   | **Description**                          |
|--------------|----------------------------------------|
| `npm start`  | Starts the frontend application server |
![frontend5](https://github.com/user-attachments/assets/777c8c12-18fe-46f8-833e-f6b4b73aee77)
This command will launch the Node.js server, which will now be serving the frontend of your application.
---
## **Ensure the Application Is Running**
Once the application is up and running, you can verify that it is accessible by opening your browser and navigating to:
```
http://localhost:3000
```
If the frontend is displayed correctly, the application is up and running.
![frontend](https://github.com/user-attachments/assets/6d7a46a7-5eed-460b-a014-6dbdfd260a3f)
---
### Contact Information
| **Name** | **Email address**            |
|-----------|-------------------------------|
| Ramratan  | ram.yadav@mygurukulam.co      |
### References
| Link                                                                                                           | Description                                               |
|---------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------|
| [Frontend Application](https://github.com/OT-MICROSERVICES/frontend) | Document format followed from this link.                 |
