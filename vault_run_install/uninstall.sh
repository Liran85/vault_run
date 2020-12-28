#!/usr/bin/env bash


function main()
{
    echo "=== UNINSTALLER ==="
    sudo rm -r /opt/vault_run 
    echo "::$APP_NAME:: sucessfully removed from /opt/vault_run"
    sudo rm -r /usr/lib/vault_runner
    echo "::$APP_NAME:: sucessfully removed from /usr/lib/vault_runner"
    sudo rm -r /var/log/vault_runner/installerlog
    echo "::$APP_NAME:: sucessfully removed from /var/log/vault_runner/installerlog"
    sudo rm -r /var/log/vault_runner/applog
    echo "::$APP_NAME:: sucessfully removed from /var/log/vault_runner/applog"
    sudo rm -r userdata=$HOME/.vault_runner/backups
    echo "::$APP_NAME:: sucessfully removed from /var/log/vault_runner/applog"
    
}
/var/log/${domain}/installer
log = /var/log/${domain}/app
user_data = $HOME/.${domain}/backup

# MAIN CALLER
main "$@"
