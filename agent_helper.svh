`ifndef AGENT_HELPER__SVH
`define AGENT_HELPER__SVH

base_agent  __agent_registry[$];

// Function: register_agent
//
function int unsigned register_agent(base_agent a);
  register_agent = __agent_registry.size;
  
  `uvm_info($sformatf("%m"), $sformatf("id: %0d, agent: %0h", id, register_agent), UVM_HIGH)
  
  __agent_registry.push_back(a);
endfunction : register_agent

// Function: get_agent
//
function base_agent get_agent(int unsigned id);
  if (id >= __agent_registry.size) `uvm_fatal($sformatf("%m"), $sformatf("Out of range access (id=%0d >= size=%0d) to the base_agent registry", id, __agent_registry.size))
  
  get_agent = __agent_registry[id];

  `uvm_info($sformatf("%m"), $sformatf("id: %0d, agent: %0h", id, get_agent), UVM_HIGH)
endfunction : get_agent

`endif // AGENT_HELPER__SVH