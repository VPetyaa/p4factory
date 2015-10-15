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

#include "simple_router.p4"

action _nop(){
}

table block_dst_ports{
     reads{
         tcp.dstPort : exact;
     }actions{
         _nop;
         _drop;
     }
}

table block_protocols{
     reads{
         ipv4.protocol : exact;
     }actions{
         _nop;
         _drop;
     }
}

control ingress {
    apply(ipv4_lpm);
    apply(forward);
}

control egress {
    apply(block_protocols);
    apply(block_dst_ports);
    apply(send_frame);
}


