#!/usr/bin/env bash


function main()
{
    echo "=== UNINSTALLER ==="
    sudo rm -r /opt/vault_run 
    echo "::$APP_NAME:: uninstall has completed sucessfully"
}

# MAIN CALLER
main "$@"
