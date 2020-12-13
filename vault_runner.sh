#!/usr/bin/env bash

VAULT_NAME=liran_vault
VAULT_KEYS=vaultKeys
declare -A arr
declare VaultFile="/home/liran/git/vault_run/vault_users/$VAULT_NAME.txt"
declare keyFile="/home/liran/git/vault_run/vault_users/$VAULT_KEYS.txt"
declare VAULT_VERSION=1
TARGET_USER=~liran
source "$TARGET_USER/git/vault_run/vault_run_install/lib/installer"

_logfile="syslog.txt"

function showHelp() {
  echo "this script is a simple bash script for creating an encrypted key-value database with a keyfile"
  echo ""
  echo "Commands:"
  echo "  help                     Show this information that you're already reading..."
  echo "  init                     Initialize a new Vault and generate a Keyfile for it"
  echo "  delete                   Remove Vault"
 

}

function main() {
 
  case "${1-help}" in
    init)
    # if [ -f $VaultFile ]; then
    #   >&2 echo "Vault '$vaultFile' already exists"
    #   exit 1
    # fi
    #genKey
    createVault
    #set_encryption
    #encrypt
    echo "Created vault $VAULT_NAME,with keyfile $VAULT_KEYS"
    ;;
    help | \? | *)
    showHelp
    exit 1
    ;;
  esac
}
# MAIN CALLER
main "$@"
