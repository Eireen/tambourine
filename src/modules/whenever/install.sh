#!/bin/bash

__namespace__() {

    [[ ${MODIFY[@]} =~ whenever ]] || {
        core::module::install_packs 'whenever'
    }

    gem install whenever

}; __namespace__