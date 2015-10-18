/*
Copyright 2015-present VPetyaa

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

#include "includes/simple_router.p4"
#define NUM_OF_NODES 2

header_type local_metadata_t {
    fields {
        bad_guy : 1;
        index : NUM_OF_NODES;
    }
}

metadata local_metadata_t local_metadata;

register bad_guy{
    width : 1;
    instance_count : NUM_OF_NODES; 
}

action set_index(index){
    modify_field(local_metadata.index, index);
    register_read(local_metadata.bad_guy, bad_guy, index);
}

action ban(){
    modify_field(local_metadata.bad_guy, 1);
    register_write(bad_guy, local_metadata.bad_guy, local_metadata.index);
    _drop();
}

action release_ban(){
    modify_field(local_metadata.bad_guy, 0);
    register_write(bad_guy, local_metadata.bad_guy, local_metadata.index);
}

action _nop(){
}

table block_dst_ports{
     reads{
         tcp.dstPort : exact;
     }actions{
         _nop;
         _drop;
         ban;
     }
}

table block_protocols{
     reads{
         ipv4.protocol : exact;
     }actions{
         _nop;
         ban;
         _drop;
     }
}

table get_index{
    reads{
        ipv4.srcAddr : exact;
    }actions{
        set_index;
        _nop;
    }
}

table bad_guy_check{
    reads{
        local_metadata.bad_guy : exact;
    }actions{
        _nop;
        _drop;
    }
}

table release_bans{
    reads{
        local_metadata.bad_guy : exact;
    }
    actions{
        release_ban;
    }
}

control ingress {
    apply(get_index);
    apply(bad_guy_check){
        miss{
            apply(ipv4_lpm);
            apply(forward);
            apply(block_protocols);
            apply(block_dst_ports);
        }
    }
}

control egress {
    apply(send_frame);
}


