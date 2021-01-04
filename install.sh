#!/usr/bin/env bash

set -e

if [[ $EUID -ne 0 ]]; then
    echo "This install must be run as root"
    exit 1
fi

source "vars"

function createServiceUser() {
    useradd -M "${SERVICE_USER}"
    usermod -L "${SERVICE_USER}"
}

function createAppStructure() {

    echo "create dirs"
    mkdir -p "${LIB_DIR}" "${LOG_DIR}" "${USER_DATA}" "${BACKUP_DIR}"

    # copy the exec file in order to set permissions
    echo "set exec"
    cp ./vault_runner /usr/local/bin/

    echo "set permissions"
    chmod g+r $LIB_DIR
    chmod g+rw $LOG_DIR
    chmod g+x $EXEC_FILE

    chown "${SERVICE_USER}":"${SERVICE_USER}" $LIB_DIR
    chown "${SERVICE_USER}":"${SERVICE_USER}" $LOG_DIR
    chown "${SERVICE_USER}":"${SERVICE_USER}" $EXEC_FILE

}

function addUserPermission() {
    usermod -a -G "${SERVICE_USER}" "${SUDO_USER}"
}

function setup() {
    echo "install libs"
    cp -r lib/* $LIB_DIR
    cp -r vars $LIB_DIR

}

function preSetup() {
    createServiceUser
    addUserPermission
    createAppStructure
}

function main() {
    echo "=== INSTALLER ==="
    preSetup
    setup
}

# MAIN CALLER
main "$@"
