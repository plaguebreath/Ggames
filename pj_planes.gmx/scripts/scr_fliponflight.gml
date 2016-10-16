var objid;
var firsttimeloop;

  objid = argument0;
  firsttimeloop = argument1;
 
  with (objid){
    timeCurrentflip = current_time; 
    
    if (firsttimeloop <> 1){
    if ((timeCurrentflip - timeInitflip >= timeforflip) && !isplaneonrunway)  {
    show_debug_message("lauch flip")  
         // Take care of the flip of image based on the direction         
         show_debug_message("flipping")
 if (direction >= 90 && direction <= 270){
   image_yscale = -1 * standardallignsprite;
   isflipped = true;
 }else{
   image_yscale = standardallignsprite;
   isflipped = false;
 }
 
         timeInitflip = timeCurrentflip; // update the time to compare to
        }        
     }else{
     timeInitflip = current_time; 
     }
 }
 
