#!/bin/bash

source /etc/os-release
case $ID in
    debian)
        return debian
        ;;
    ubuntu)
        return ubuntu
        ;;
    devuan)
        return devuan
        ;;
    centos)
        return centos
        ;;
    fedora)
        return fedora
        ;;
    rhel)
        return rhel
        ;;

    *)
        exit 1
        ;;
esac