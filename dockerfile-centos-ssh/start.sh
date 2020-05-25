#!/bin/bash

if [[ -n "${1}" ]]; then
    SSH_USERS=${1}
fi

__create_user() {
    # Create a user to SSH into as
    IFS=',' read -r -a array <<< "${SSH_USERS}"
    for element in "${array[@]}"
    do
        USER=$(echo "$element" | cut -d'|' -f 1)
        PASS=$(echo "$element" | cut -d'|' -f 2)
        useradd ${USER} -G wheel
        echo -e "${PASS}\n${PASS}" | (passwd --stdin ${USER})
        echo "User created: ${USER}"
    done
}

# Call all functions
__create_user