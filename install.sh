#!/usr/bin/env bash


APP_NAME="vault_run"
APP_FULL_PATH="/opt/$APP_NAME/"
domain="vault_runner"


# uninstall application

function install_app() {
    echo "::$APP_NAME:: target intalition dir: $APP_FULL_PATH"
    sudo mkdir -p $APP_FULL_PATH
    sudo cp -R vault_run_install/* $APP_FULL_PATH
}

function check_path() {
    echo $PATH | grep $APP_FULL_PATH 1>/dev/null
    retVal=$?
    if [ $retVal -ne 0 ]; then
        echo "::$APP_NAME:: warning:applicatin $APP_NAME cannot be found in PATH"
        echo "::$APP_NAME:: to add $APP_NAME into PATH add the following line into .bashrc:"
        echo "export PATH=$APP_FULL_PATH:\$PATH"
    fi
    
}

function createAppStructure()
{
    local lib=/usr/lib/${domain}/
    local installerlog=/var/log/${domain}/installerlog
    local applog=/var/log/${domain}/applog
    local userdata=$HOME/.${domain}/backups
    local execfile=/usr/local/bin/${domain}
    sudo mkdir -p $lib
    sudo chown  root:$USER $lib
    sudo chmod g+rw $lib
    sudo mkdir -p $installerlog
    sudo chown  root:$USER $installerlog
    sudo chmod  g+rw $installerlog
    sudo mkdir -p $applog
    sudo chown  root:$USER $applog
    sudo chmod  g+rw $applog
    mkdir -p $userdata
    sudo mkdir -p $execfile
    sudo cp -p $APP_FULL_PATH/vault_runner.sh $execfile
}


function main() {
    echo "=== INSTALLER ==="
    install_app
    check_path
    createAppStructure
    #echo "::$APP_NAME:: installation completed sucessfully"
    createAppStructure
}

# MAIN CALLER
main "$@"
