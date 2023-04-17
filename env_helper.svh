`ifndef ENV_HELPER__SVH
`define ENV_HELPER__SVH

base_env __env_registry[string][$];

// Function: register_env
//
function automatic int unsigned register_env (base_env e);
  register_env = __env_registry[e.get_type_name].size;
  
  `uvm_info($sformatf("%m"), $sformatf("type: %s, id: %0d, env: %0h", e.get_type_name, register_env, e), UVM_HIGH)

  __env_registry[e.get_type_name].push_back(e);
endfunction : register_env

// Function: get_env
//
function automatic base_env get_env (string env_type, int unsigned id);
  if (id >= __env_registry[env_type].size) `uvm_fatal($sformatf("%m"), $sformatf("Out of range access (type=%s, id=%0d >= size=%0d) to the base_env registry", env_type, id, __env_registry[env_type].size))
  
  get_env = __env_registry[env_type][id];
  
  `uvm_info($sformatf("%m"), $sformatf("type: %s, id: %0d, env: %0h", env_type, id, get_env), UVM_HIGH)
endfunction : get_env

`endif // ENV_HELPER__SVH