#!/usr/bin/env bash


APP_NAME="vault_run"
APP_FULL_PATH="/opt/$APP_NAME/"
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

function main() {
    echo "=== INSTALLER ==="
    install_app
    check_path
    echo "::$APP_NAME:: installation completed sucessfully"
}

# MAIN CALLER
main "$@"
