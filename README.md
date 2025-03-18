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
**Copy and Paste our secret vaules into our vault file**
<br><br>

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
\l
\du
\q
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

**Sign in and set new password**:
  - Username: admin
  - Password: password

