#!/bin/bash


echo "Do you want to continue update and upgrade and vscode? (yes/no)"
read response

if [ "$response" == "yes" ]; then
    echo "Starting Installtion.."
   if [ -e /etc/os-release ]; then
    if grep -qi "debian" /etc/os-release; then
        echo "This is a Debian-based operating system."
        sudo apt update
        sudo apt upgrade
        cd /home/
        sudo mkdir download-file
        cd download-file
        #this will download the vscode package and next line will install and next line will install package from internet using high level package manager.
        sudo wget https://vscode.download.prss.microsoft.com/dbazure/download/stable/0ee08df0cf4527e40edc9aa28f4b5bd38bbff2b2/code_1.85.1-1702462158_amd64.deb
        sudo dpkg -i code_1.85.1-1702462158_amd64.deb
        sudo apt install -f

echo "Do you want to install Chrome & git Software Packages ? (yes/no)"
read response

if [ "$response" == "yes" ]; then
    echo "Installing"
    cd /home/
    cd download-file
    sudo wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    sudo apt install -f
    sudo apt update
    sudo apt upgrade
    sudo apt install git

    echo "Do you want to install AWS CLI? (yes/no)"
read response

if [ "$response" == "yes" ]; then
    echo "Installing AWS CLI"
    sudo apt install awscli
    # Add your commands or actions here
elif [ "$response" == "no" ]; then
    echo "Exiting..."
    # Add any cleanup or exit actions here
else
    echo "Invalid response. Please enter 'yes' or 'no'."
fi


    # Add your commands or actions here
elif [ "$response" == "no" ]; then
    echo "Exiting..."
    # Add any cleanup or exit actions here
else
    echo "Invalid response. Please enter 'yes' or 'no'."
fi

    elif grep -qi "red hat" /etc/os-release; then
        echo "This is a Red Hat-based operating system."
        sudo yum update
        sudo yum upgrade
    else
        echo "This is another type of operating system."
    fi
else
    echo "The /etc/os-release file doesn't exist. Unable to determine the operating system."
fi
    # Add your commands or actions here
elif [ "$response" == "no" ]; then
    echo "Exiting..."
    # Add any cleanup or exit actions here
else
    echo "Invalid response. Please enter 'yes' or 'no'."
fi
