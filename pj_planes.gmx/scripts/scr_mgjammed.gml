var objid; 
  objid = argument0;
  with (objid){ 
    timeCurrentjammed = current_time; 
    if (timeCurrentjammed - timeInitjammed >= jammedintervalmg && ismgjammed) { 
      objid.ismgjammed = false;    
      timeInitjammed = timeCurrentjammed; // update the time to compare to
    }
   }
