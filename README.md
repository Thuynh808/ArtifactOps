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

