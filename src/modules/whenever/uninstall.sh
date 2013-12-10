#!/bin/bash

__namespace__() {

    core::module::purge_packs 'whenever'

    gem -v >& /dev/null || {
        return
    }

    gem uninstall whenever

}; __namespace__