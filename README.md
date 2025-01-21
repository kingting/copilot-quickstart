# **GitHub Copilot Quickstart for Ansible Collections**

Welcome to the quickstart guide for setting up a GitHub repository to leverage **GitHub Copilot** and accelerate your Ansible development. This guide provides a detailed workflow for creating, testing, and transitioning Ansible roles and playbooks into collections. The repository will help you prototype using Copilot and integrate your work into restricted corporate environments.

---

## **1. Repository Setup and Initial Configuration**

### **Create the GitHub Repository**
1. Go to [GitHub](https://github.com/) and create a new repository.
   - Repository name: `copilot-quickstart`
   - Description: "Quickstart guide for using GitHub Copilot to develop Ansible collections."
   - Initialize with a README file and optionally add a `.gitignore` for Python.

2. Clone the repository:
   ```bash
   git clone https://github.com/kingting/copilot-quickstart.git
   cd copilot-quickstart
   ```

---

## **2. Setting Up Python Virtual Environment**

To work with Ansible and related tools, it's best to use a Python virtual environment.

### **Setup Script**
Create a file called `setup.sh` with the following content:

```bash
#!/bin/bash

# Create a virtual environment
python3 -m venv .venv

# Activate the virtual environment
source .venv/bin/activate

# Upgrade pip
pip install --upgrade pip

# Install required packages
pip install ansible molecule ansible-lint

# Verify installation
ansible --version
molecule --version
```

### **Run the Setup Script**
Make the script executable and run it:

```bash
chmod +x setup.sh
./setup.sh
```

### **Activating the Virtual Environment**
After running the setup, activate the virtual environment whenever you work on this project:

```bash
source .venv/bin/activate
```

To deactivate the virtual environment, simply run:

```bash
deactivate
```

---

## **3. Setting Up the Project Structure**

Use the following steps to initialize your repository for Ansible collection development:

1. Create the Ansible collection structure:
   ```bash
   ansible-galaxy collection init kingting.quickstart
   ```

   This will create a structure like:
   ```
   kingting.quickstart/
   ├── docs/
   ├── galaxy.yml
   ├── plugins/
   │   ├── modules/
   │   └── filters/
   ├── README.md
   ├── roles/
   ├── playbooks/
   ├── tests/
   │   └── integration/
   └── files/
   ```

2. Push the initial structure to GitHub:
   ```bash
   git add .
   git commit -m "Initial Ansible collection structure"
   git push origin main
   ```

---

## **4. Using GitHub Codespaces and Copilot**

### **Launch Codespaces**

1. Navigate to your repository on GitHub.
2. Click the green `Code` button, then select `Codespaces > New Codespace`.
3. Codespaces will launch a browser-based VS Code environment.

### **Enable GitHub Copilot**

1. Ensure Copilot is enabled in your GitHub account.
2. Inside Codespaces, Copilot will automatically work as you type.

### **Writing with Copilot**

1. **Create a Role**:
   - Navigate to `roles/` and create a new role directory, e.g., `roles/my_role`.
   - Open `tasks/main.yml` and type:
     ```yaml
     # Install nginx
     ```
   - Copilot will suggest a task:
     ```yaml
     - name: Install nginx
       ansible.builtin.package:
         name: nginx
         state: present
     ```
   - Press **Tab** to accept the suggestion.

2. **Create a Playbook**:
   - Navigate to `playbooks/` and create `deploy.yml`.
   - Start typing:
     ```yaml
     - name: Deploy nginx
       hosts: all
       tasks:
         - name: Install nginx
     ```
   - Copilot will auto-suggest tasks to complete the playbook.

3. **Refactor to Collections**:
   - Start converting roles and playbooks into the collection structure by creating reusable components in `roles/`, `plugins/`, and `playbooks/` directories.

---

## **5. Testing Locally in Codespaces**

### **Build the Collection**
Run the following command to package your collection:
```bash
ansible-galaxy collection build
```

This creates a `.tar.gz` file in the `kingting.quickstart` directory.

### **Install the Collection Locally**
Install the built collection in Codespaces:
```bash
ansible-galaxy collection install kingting-quickstart-1.0.0.tar.gz
```

### **Test the Playbook**
Run the playbook using the installed collection:
```bash
ansible-playbook playbooks/deploy.yml -i localhost, -c local
```

---

## **6. Workflow for Corporate Environments**

### **Develop in GitHub**

1. Use the GitHub repository and Codespaces to develop Ansible collections and playbooks with Copilot.
2. Refactor roles and playbooks into collections following best practices.
3. Commit and push your changes to GitHub.

### **Transfer Code to Corporate Machines**

1. Copy the `roles/`, `playbooks/`, and other relevant code directly from GitHub to your corporate environment.
2. Ensure no sensitive information is included in Copilot suggestions or GitHub commits.
3. Test the code in your corporate environment.

---

## **7. Best Practices for Copilot Usage**

1. **Leverage AI Suggestions**:
   - Use Copilot for generating boilerplate code, tasks, and playbooks quickly.
   - Review all suggestions to ensure they align with corporate security policies.

2. **Refactor Code**:
   - Clean up AI-generated code to meet your organization's style guidelines and security practices.

3. **Document**:
   - Update `README.md` with usage instructions for each component (roles, playbooks, or modules).

4. **Avoid Sensitive Data**:
   - Ensure no sensitive data, passwords, or proprietary logic is part of Copilot inputs or outputs.

---

## **8. License**

MIT

---

This guide should enable you to set up, develop, and refine Ansible collections using GitHub Copilot effectively. Let me know if you need further assistance!

