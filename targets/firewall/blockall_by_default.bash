python ../../cli/pd_cli.py -p firewall -i p4_pd_rpc.firewall -s $PWD/tests/pd_thrift:$PWD/../../testutils -m "set_default_action block_protocols _drop" -c localhost:22222
python ../../cli/pd_cli.py -p firewall -i p4_pd_rpc.firewall -s $PWD/tests/pd_thrift:$PWD/../../testutils -m "set_default_action block_dst_ports _drop" -c localhost:22222

#python ../../cli/pd_cli.py -p firewall -i p4_pd_rpc.firewall -s $PWD/tests/pd_thrift:$PWD/../../testutils -m "add_entry block_protocols 1 _drop" -c localhost:22222
#python ../../cli/pd_cli.py -p firewall -i p4_pd_rpc.firewall -s $PWD/tests/pd_thrift:$PWD/../../testutils -m "add_entry block_dst_ports 8080 _drop" -c localhost:22222
