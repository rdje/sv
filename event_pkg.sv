package event_pkg;
import uvm_pkg::*;
import env_pkg::*;

// Function: get_event
//
function automatic uvm_event get_event(string e, string pool, string env_type, int unsigned env_id);
  get_event = get_env(env_type, env_id).get_pool(pool).get(e);
  
  `uvm_info($sformatf("%m"), $sformatf("event: %s, pool: %s, env_type: %s, env_id: %0d", e, pool, env_type, env_id), UVM_HIGH)
endfunction : get_event

endpackage : event_pkg