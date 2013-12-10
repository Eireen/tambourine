#!/bin/bash

__namespace__() {

    core::module::purge_packs 'backup'

    gem -v >& /dev/null || {
        return
    }

    gem uninstall backup

}; __namespace__