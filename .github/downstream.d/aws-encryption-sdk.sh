#!/bin/bash -ex

case "${1}" in
    install)
        git clone https://github.com/awslabs/aws-encryption-sdk-python
        cd aws-encryption-sdk-python
        git checkout 232653188558379bceeb884b3f74b56b07560f62
        git rev-parse HEAD
        pip install -e .
        pip install -r test/upstream-requirements-py37.txt
        ;;
    run)
        cd aws-encryption-sdk-python
        pytest -m local test/
        ;;
    *)
        exit 1
        ;;
esac
