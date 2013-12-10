#!/bin/bash

__namespace__() {

    [[ ${MODIFY[@]} =~ backup ]] || {
        core::module::install_packs 'backup'
    }

    gem install backup

}; __namespace__