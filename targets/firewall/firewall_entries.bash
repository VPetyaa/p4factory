# ALLOW TCP AND GIVE BAN FOR UDP 

python ../../cli/pd_cli.py -p firewall -i p4_pd_rpc.firewall -s $PWD/tests/pd_thrift:$PWD/../../testutils -m "add_entry block_protocols 6 _nop" -c localhost:22222
python ../../cli/pd_cli.py -p firewall -i p4_pd_rpc.firewall -s $PWD/tests/pd_thrift:$PWD/../../testutils -m "add_entry block_protocols 17 ban" -c localhost:22222

# BAN 8080 PORTS AND DROP 8081

python ../../cli/pd_cli.py -p firewall -i p4_pd_rpc.firewall -s $PWD/tests/pd_thrift:$PWD/../../testutils -m "add_entry block_dst_ports 8080 ban" -c localhost:22222
python ../../cli/pd_cli.py -p firewall -i p4_pd_rpc.firewall -s $PWD/tests/pd_thrift:$PWD/../../testutils -m "add_entry block_dst_ports 8081 _drop" -c localhost:22222
