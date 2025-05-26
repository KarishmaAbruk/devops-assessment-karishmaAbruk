Here is the setup instruction in **Markdown (`.md`) format** for Jenkins and Terraform on Ubuntu:

---

````markdown
# Jenkins and Terraform Setup on Ubuntu

This guide provides step-by-step instructions to install and configure **Jenkins** and **Terraform** on an **Ubuntu** system.

## 🧰 Prerequisites

- Ubuntu 20.04 or later
- Sudo privileges
- Internet access

---

## Step 1: Install Required Dependencies

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y git curl unzip apt-transport-https ca-certificates gnupg lsb-release software-properties-common
````

---

## Step 2: Install Terraform

1. Add HashiCorp GPG key and repo:

```bash
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
  sudo tee /etc/apt/sources.list.d/hashicorp.list
```

2. Install Terraform:

```bash
sudo apt update
sudo apt install terraform -y
terraform -version
```

---

## Step 3: Install Jenkins

1. Add Jenkins key and repository:

```bash
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | \
  sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | \
  sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
```

2. Install Jenkins and Java:

```bash
sudo apt update
sudo apt install openjdk-17-jdk jenkins -y
```

3. Start and enable Jenkins:

```bash
sudo systemctl start jenkins
sudo systemctl enable jenkins
```

4. Verify Jenkins is running:

```bash
sudo systemctl status jenkins
```

---

## Step 4: Access Jenkins Web Interface

1. Open Jenkins in your browser:

```
http://<your-server-ip>:8080
```

2. Unlock Jenkins using:

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

3. Follow setup wizard:

   * Install Suggested Plugins
   * Create Admin User
   * Save Jenkins URL and finish setup

---

## Step 5: Install Jenkins Plugins

Go to: `Manage Jenkins > Plugins > Available`

Install the following:

* Pipeline
* Git
* GitHub
* Terraform (optional)
* Credentials Binding
* AnsiColor

---

## Step 6: Add AWS Credentials

1. Go to: `Manage Jenkins > Credentials > (global) > Add Credentials`

2. Add:

   * Kind: Secret Text or Username/Password
   * ID: `aws-access-key-id` and `aws-secret-access-key`

3. In your `Jenkinsfile`, reference like:

```groovy
environment {
  AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
  AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
}
```

---

## Step 7: Test a Jenkins + Terraform Pipeline

1. Create a new Pipeline Job in Jenkins
2. Use your GitHub repo URL with Pipeline script from SCM 
3. enable GitHub hook trigger for GITScm polling in trigger
4. configer webhook in git
5. Trigger a build to validate

---
```

---

## ✅ Done!

You now have Jenkins and Terraform set up on Ubuntu and ready to run infrastructure automation pipelines!

