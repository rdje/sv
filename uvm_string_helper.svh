// Function: split_string
//
function automatic sa_t split_string(string s, string sep="");
  if (sep.len) begin
    byte  sepa[$];
    int   pos[$];
    
    foreach (sep[k]) begin
      sepa[k]=sep[k];
      
      `uvm_info("SPLIT_STRING", $sformatf("sep[%0d] = <%0d>", k, sep[k]), UVM_LOW)
    end
    
    foreach (s[k]) if (s[k] inside {sepa}) pos.push_back(k);
    foreach (pos[k]) begin
      `uvm_info("SPLIT_STRING", $sformatf("pos[%0d] = <%0d>", k, pos[k]), UVM_LOW)
      
      if (k) begin // k not first
        if (pos[k] - 1 > pos[k-1])
          split_string.push_back(s.substr(pos[k-1] + 1, pos[k] - 1));
        else
          split_string.push_back("");
      end
      else begin // k first
        if (pos[k] == 0)
          split_string.push_back("");
        else
          split_string.push_back(s.substr(0, pos[k] - 1));
      end
      
      if (k == pos.size - 1) begin // k last
        if (pos[k] == s.len - 1)
          split_string.push_back("");
        else
          split_string.push_back(s.substr(pos[k] + 1, s.len - 1));
      end
    end
    
    if (!pos.size) split_string.push_back(s);
    
    foreach (split_string[k]) `uvm_info("SPLIT_STRING", $sformatf("[%0d] = <%s>", k, split_string[k]), UVM_LOW)
  end
  else
    foreach (s[k]) split_string.push_back(s[k]);
    
endfunction : split_string

// Function: join_string
//
function automatic string join_string(sa_t sa, string sep="");
  foreach (sa[k]) join_string = {join_string, k ? sep : "", sa[k]};
endfunction : join_string
  