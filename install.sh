#!/usr/bin/env bash


# direct include (source)
#source "/home/liran/bashcodes/vault_run/lib/installer"
export RUNNER_PATH=$1

function installApp()
{
    local app_location="/home/liran/bashcodes/"
    cd $app_location
    zip -r vault_run.zip vault_run
    # Set permission
    sudo chmod 765 "/opt/temp/"
    #zip -b "/opt/temp/" vault_run.zip
    # Copy Zip file to tmp libarary
    sudo cp -p vault_run.zip /opt/temp/
    if [[ -z $RUNNER_PATH ]]; then
        RUNNER_PATH="$HOME/bashcodes"
        echo "Directory option not set, installing into $RUNNER_PATH/vault_run"
        sudo cp -p "/opt/temp/"vault_run.zip "$RUNNER_PATH/"
        unzip -q vault_run.zip "$RUNNER_PATH/vault_run"
        #unzip -q vault_run.zip
    else
        echo "Installing into $RUNNER_PATH"
        sudo cp -p "/opt/temp/"vault_run.zip "$RUNNER_PATH/"
        echo "unzipp the file"
        #unzip -q opt/ vault_run.zip
        cd $RUNNER_PATH
        sudo unzip -q vault_run.zip
    fi
}


function createTreeLibrary() {
# True if path not typed
    if [[ -z $RUNNER_PATH ]]; then
        RUNNER_PATH="$HOME/bashcodes/vault_run"
        echo "Directory option not set, installing into $RUNNER_PATH/vault_run"
        unzip -q vault_run.zip "$RUNNER_PATH/vault_run"

    else
        echo "Installing into $RUNNER_PATH/vault_run"
        unzip unzip -q vault_run.zip "$RUNNER_PATH/vault_run"
    fi

    mkdir -p $RUNNER_PATH/vault_run/{lib/{installer,file_handler},vault_runner}
    

# Extract a ZIP File to a Different Directory
#unzip unzip -q vault_run.zip
}

function parseArguments() {
    local get_opt=$2
    case $get_opt in
        --install) install_app
        ;;
        --uninstall) uninstall_app
        ;;
        *) echo exit 1
        ;;
    esac
    
}
function main() {
    #select path
    #echo "\nWhich location do you want to install application? \n"
    #read pathLocation
    installApp
}

# MAIN CALLER
main "$@"
