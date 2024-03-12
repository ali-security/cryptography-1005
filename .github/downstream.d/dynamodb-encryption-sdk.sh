#!/bin/bash -ex

case "${1}" in
    install)
        git clone --depth=1 https://github.com/awslabs/aws-dynamodb-encryption-python
        cd aws-dynamodb-encryption-python
        git checkout de31c5e4339bfdc0e237b4b53fb6e4958bed972f
        git rev-parse HEAD
        pip install -e .
        pip install -r test/upstream-requirements-py37.txt
        ;;
    run)
        cd aws-dynamodb-encryption-python
        pytest test/ -m "local and not slow and not veryslow and not nope"
        ;;
    *)
        exit 1
        ;;
esac
