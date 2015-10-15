#!/bin/bash

python ../../cli/pd_cli.py -p firewall -i p4_pd_rpc.firewall -s $PWD/tests/pd_thrift:$PWD/../../testutils -m "$1" -c localhost:22222
