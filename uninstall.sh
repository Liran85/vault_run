#!/usr/bin/env bash

set -e

if [[ $EUID -ne 0 ]]; then
   echo "This install must be run as root" 
   exit 1
fi

source "vars"

function removeServiceUser()
{
    deluser "${SUDO_USER}" "${SERVICE_USER}" 
    deluser "${SERVICE_USER}"
}

function main()
{
    sudo rm -rfv "${LIB_DIR}" 
    sudo rm -fv "$EXEC_FILE"
    removeServiceUser

}


# MAIN CALLER
main "$@"
