#!/bin/bash

__namespace__() {

    MODULES_STATE['backup']='INSTALLED'

    core::module::check_packs 'backup'
    if [[ $PACKS_INSTALLED = false ]]; then
        MODULES_STATE['backup']='NOT_INSTALLED'
        return
    fi

    gem help >& /dev/null || {
        MODULES_STATE['backup']='NOT_INSTALLED'
        return
    }

    gem list | grep 'backup' >& /dev/null || {
        MODULES_STATE['backup']='NOT_INSTALLED'
        return
    }
    
}; __namespace__
