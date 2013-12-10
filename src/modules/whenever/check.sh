#!/bin/bash

__namespace__() {

    MODULES_STATE['whenever']='INSTALLED'

    core::module::check_packs 'whenever'
    if [[ $PACKS_INSTALLED = false ]]; then
        MODULES_STATE['whenever']='NOT_INSTALLED'
        return
    fi

    gem help >& /dev/null || {
        MODULES_STATE['whenever']='NOT_INSTALLED'
        return
    }

    gem list | grep 'whenever' >& /dev/null || {
        MODULES_STATE['whenever']='NOT_INSTALLED'
        return
    }

    
}; __namespace__
