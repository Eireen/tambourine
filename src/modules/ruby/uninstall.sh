#!/bin/bash

__namespace__() {

    dpkg -r ruby

    core::module::purge_packs 'ruby'

}; __namespace__