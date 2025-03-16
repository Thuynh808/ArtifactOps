#!/bin/bash

VAULT_PASS="password"
ADMIN_PASS="password"

# Generate master and join keys
MASTER_KEY=$(openssl rand -hex 32)
JOIN_KEY=$(openssl rand -hex 32)

echo "$VAULT_PASS" > ~/.vault_pass.txt
chmod 600 ~/.vault_pass.txt

# Output keys and admin password for vault creation
echo ""
echo "✅ Use the following for Ansible Vault file (secret-vars.yml):"
echo "--------------------------------"
echo "artifactory_admin_password: $ADMIN_PASS"
echo "artifactory_master_key: $MASTER_KEY"
echo "artifactory_join_key: $JOIN_KEY"
echo "--------------------------------"
echo ""
