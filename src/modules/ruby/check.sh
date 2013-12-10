#!/bin/bash

__namespace__() {

    MODULES_STATE['ruby']='INSTALLED'

    core::module::check_packs 'ruby'
    if [[ $PACKS_INSTALLED = false ]]; then
        MODULES_STATE['ruby']='NOT_INSTALLED'
        return
    fi

    core::module::check_pack_status_by_dpkg 'ruby'

    if [[ $PACK_INSTALLED = false ]]; then
        MODULES_STATE['ruby']='NOT_INSTALLED'
        return
    fi
    
}; __namespace__
