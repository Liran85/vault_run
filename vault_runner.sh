#!/usr/bin/env bash

VAULT_NAME=liran_vault
VAULT_KEYS=vaultKeys
declare VaultFile="/home/liran/git/vault_run/vault_users/$VAULT_NAME.txt"
declare keyFile="/home/liran/git/vault_run/vault_users/$VAULT_KEYS.txt"
TARGET_USER=~liran
export LIB_D_PATH="/home/liran/git/vault_run/vault_run_install/lib"
for source_file in "$LIB_D_PATH"/*; do source "${source_file}"; done
#source "$TARGET_USER/git/vault_run/vault_run_install/lib"

_logfile="syslog.txt"

function showHelp() {
  echo "this script is a simple bash script for creating an encrypted key-value database with a keyfile"
  echo ""
  echo "Commands:"
  echo "  help                     Show this information that you're already reading..."
  echo "  init                     Initialize a new Vault and generate a Keyfile for it"
  echo "  addData                 Remove Vault"
 

}

function main() {
 
  case "${1-help}" in
    init)
    createVault
    sealVault
    ;;
    addData)
    unsealVault
    ;;
    
    help | \? | *)
    showHelp
    exit 1
    ;;
  esac
}
# MAIN CALLER
main "$@"
