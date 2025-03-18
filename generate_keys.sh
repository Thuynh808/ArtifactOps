#!/bin/bash

VAULT_PASS="password"  # set your password
POSTGRES_PW="password"  # set your password
DB_PASSWORD="password"  # set your password
ARTIFACTORY_ADMIN_USERNAME="admin"  # set admin usename
ARTIFACTORY_ADMIN_PW="password"  # set your password

# Generate master and join keys
MASTER_KEY=$(openssl rand -hex 32)
JOIN_KEY=$(openssl rand -hex 32)

echo "$VAULT_PASS" > ~/.vault_pass.txt
chmod 600 ~/.vault_pass.txt

# Output keys and admin password for vault creation
echo ""
echo "✅ Use the following for Ansible Vault file (vars/secret-vars.yml):"
echo "--------------------------------"
echo "postgres_password: $POSTGRES_PW"
echo "database_artifactory_password: $DB_PASSWORD"
echo "artifactory_username: $ARTIFACTORY_ADMIN_USERNAME"
echo "artifactory_admin_password: $ARTIFACTORY_ADMIN_PW"
echo "master_key: $MASTER_KEY"
echo "join_key: $JOIN_KEY"
echo "--------------------------------"
echo ""

