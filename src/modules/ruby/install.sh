#!/bin/bash

__namespace__() {

    [[ ${MODIFY[@]} =~ ruby ]] || {
        core::module::install_packs 'ruby'
    }

    local workdir="/tmp/ruby_install"

    if [[ -d $workdir ]]; then
        rm -rf $workdir
    fi
    mkdir $workdir && cd $workdir

    # Ruby

    wget http://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p353.tar.gz
    tar -xzf ruby-*.tar.gz
    rm -f ruby-*.tar.gz
    cd ruby-*

    ./configure && make && checkinstall \
        --pkgname=ruby-pack \
        --pkgversion=2.0.0-p353 \
        --install=yes \
        --type=debian \
        --fstrans=no \
        --provides=ruby \
        --nodoc \
        --default \
        make install

    cd ..

    # RubyGems

    wget http://production.cf.rubygems.org/rubygems/rubygems-2.1.7.tgz
    tar -xzf rubygems-*.tgz
    rm -f rubygems-*.tgz
    cd rubygems-*

    ruby setup.rb

}; __namespace__