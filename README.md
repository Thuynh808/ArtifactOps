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
