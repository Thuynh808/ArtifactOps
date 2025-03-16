# ArtifactOps: JFrog Automation


**Run the following on control node:**
```bash
cd
dnf install -y git ansible-core
git clone -b feature https://github.com/Thuynh808/ArtifactOps
cd ArtifactOps
ansible-galaxy collection install -r requirements.yaml -vv
```
