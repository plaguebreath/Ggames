var objid;
var oldlandingstate;

  objid = argument0;
 
  with (objid){
    oldlandingstate =isplanelanded;
    if (speed > 0.5 && !isplaneonrunway){
      isplanelanded = false;
    }else{
    timeCurrentlanded = current_time; 
    if (timeCurrentlanded - timeInitlanded >= timeonrunway && isplaneonrunway)  {
      if (speed <= 0.5) {      
        isplanelanded = true; 
        if (oldlandingstate <> isplanelanded){
         isreloading = true;      
         scr_planesetonrunway(id);                    
        }       
      }else{
         isplanelanded = false;
      }
         timeInitlanded = timeCurrentlanded; // update the time to compare to
      }  
     }
    }

