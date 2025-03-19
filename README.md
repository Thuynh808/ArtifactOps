# ArtifactOps: JFrog Automation


**Run the following on control node:**
```bash
cd
dnf install -y git ansible-core
git clone -b feature https://github.com/Thuynh808/ArtifactOps
cd ArtifactOps
ansible-galaxy collection install -r requirements.yaml -vv
```


**Run `base-setup.yaml` playbook:**
```bash
ansible-playbook base-setup.yaml -vv
```
  **This playbook will**:
  - task 1
  - task 2
  - task 3 

**Generate secrets for master key, join key, and admin password**:
```bash
./generate_keys.sh
```
  **This script will**:
  - Set Vault password stored in ~/.vault_pass.txt for auto-unlock
  - Set Artifactory admin password
  - Generate master and join keys with secure random 32-byte hex values
  - Output our secrets to copy/paste into our vault file

**Create encrypted Ansible vault file**:
```bash
ansible-vault create vars/secret-vars.yaml --vault-password-file ~/.vault_pass.txt
```
**Copy and Paste our secret values into our vault file**
```bash
postgres_password: "<password>"
database_artifactory_password: "<password>"
artifactory_admin_password: "<password>"
master_key: <master_key>
join_key: <join_key>
```

**Run `artifactory.yaml` playbook**:
```bash
ansible-playbook artifactory.yaml -vv
```
  **This playbook will**:
  - task 1
  - task 2
  - task 3
  - task 4

**Verify Execution**:
```bash
systemctl status postgresql-15.service --no-pager
sudo -i -u postgres psql
```
```bash
\l
\du
\q
```
```bash
systemctl status artifactory.service --no-pager
```

**Run `config.yaml` playbook**:
```bash
ansible-playbook config.yaml -vv
```
  **This playbook will**:
  - task 1
  - task 2
  - task 3
  - task 4

**Verify Execution**:
```bash
systemctl status artifactory --no-pager
tail /opt/jfrog/artifactory/var/log/artifactory-service.log
tail /opt/jfrog/artifactory/var/log/router-service.log 
tail /opt/jfrog/artifactory/var/log/metadata-service.log
ss -tlnp | grep 8082
```

**Navigate to `http://10.2.22.101:8082/ui/`**

**Sign in with default credentials**:
  - Username: admin
  - Password: password
<br><br>

> ⚠️ Note: Due to the limitations of JFrog Artifactory OSS, repository management via API and webhooks are not supported.

**Create repositories via web UI**

Since repositories must be created manually, follow these steps in the Artifactory Web UI:

  - **Go to "Repositories" → "New Local Repository"**
  - **Create these Docker repositories**:
    - docker-dev → Development images.
    - docker-prod → Production-ready images.
    - docker-quarantine → Images with vulnerabilities.


