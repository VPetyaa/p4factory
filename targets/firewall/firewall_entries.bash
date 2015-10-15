python ../../cli/pd_cli.py -p firewall -i p4_pd_rpc.firewall -s $PWD/tests/pd_thrift:$PWD/../../testutils -m "add_entry block_protocols 1 _nop" -c localhost:22222
python ../../cli/pd_cli.py -p firewall -i p4_pd_rpc.firewall -s $PWD/tests/pd_thrift:$PWD/../../testutils -m "add_entry block_protocols 17 _nop" -c localhost:22222
python ../../cli/pd_cli.py -p firewall -i p4_pd_rpc.firewall -s $PWD/tests/pd_thrift:$PWD/../../testutils -m "add_entry block_dst_ports 8080 _nop" -c localhost:22222
