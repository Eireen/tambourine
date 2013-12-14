#!/bin/bash

__namespace__() {

    dpkg -r ruby-pack

    core::module::purge_packs 'ruby'

}; __namespace__