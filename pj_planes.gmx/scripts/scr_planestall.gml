var objid;
  objid = argument0;
 
  with (objid){ 
    //oldstallstate = isplanestall;  
    timeCurrentstall = current_time; 
    if (timeCurrentstall - timeInitstall >= timeforstall) { 
        isplanestall = false;     
        timeInitstall = timeCurrentstall; // update the time to compare to
    }
  }   

 
