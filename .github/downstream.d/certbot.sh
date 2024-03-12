#!/bin/bash -ex

case "${1}" in
    install)
        git clone --depth=1 https://github.com/certbot/certbot
        cd certbot
        git checkout 23090198bf132704f1c860d5b6b623a2fcb593f8
        git rev-parse HEAD
        tools/pip_install_editable.py ./acme[test]
        tools/pip_install_editable.py ./certbot[test]
        ;;
    run)
        cd certbot
        # Ignore some warnings for now since they're now automatically promoted
        # to errors. We can probably remove this when acme gets split into
        # its own repo
        pytest -Wignore certbot/tests
        pytest acme
        ;;
    *)
        exit 1
        ;;
esac
