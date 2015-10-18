# BY DEFAULT DROP ALL PACKETS FROM ANY PROTOCOL AND ALLOW ALL PORTS

python ../../cli/pd_cli.py -p firewall -i p4_pd_rpc.firewall -s $PWD/tests/pd_thrift:$PWD/../../testutils -m "set_default_action block_protocols _drop" -c localhost:22222
python ../../cli/pd_cli.py -p firewall -i p4_pd_rpc.firewall -s $PWD/tests/pd_thrift:$PWD/../../testutils -m "set_default_action block_dst_ports _nop" -c localhost:22222
