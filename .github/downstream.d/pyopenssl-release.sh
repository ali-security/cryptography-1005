#!/bin/bash -ex

case "${1}" in
    install)
        VERSION="23.2.0"
        git clone https://github.com/pyca/pyopenssl
        cd pyopenssl
        git checkout "$VERSION"
        pip install -e ".[test]"
        ;;
    run)
        cd pyopenssl
        pytest tests
        ;;
    *)
        exit 1
        ;;
esac
