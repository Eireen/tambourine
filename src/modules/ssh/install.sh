#!/bin/bash

__namespace__() {

    [[ ${MODIFY[@]} =~ ssh ]] || {
        core::module::install_packs 'ssh'
    }

    local conf_file='/etc/ssh/sshd_config'

    # Смена порта
    if [[ ${!SSH_OPTS[@]} =~ p|(port) ]]; then
        local port=${SSH_OPTS[$BASH_REMATCH]}
        sed -e "/^Port\s\+[0-9]\+/ s/[0-9]\+/$port/" -i $conf_file
    fi

    # Запрет прямого доступа по SSH для root
    # Warning: должен существовать хотя бы один еще пользователь на сервере, под которым можно будет зайти на последний.
    if [[ ${!SSH_OPTS[@]} =~ f|forbid-root ]]; then
        local param='PermitRootLogin'
        if [[ ${SSH_OPTS[$BASH_REMATCH]} != no ]]; then
            sed -e "s/^#\?\s*$param\s\+[yesno]\{2,3\}/$param no/" -i $conf_file
        else
            sed -e "s/^\s*$param\s\+[yesno]\{2,3\}/#$param no/" -i $conf_file
        fi
    fi

    /etc/init.d/ssh restart

}; __namespace__