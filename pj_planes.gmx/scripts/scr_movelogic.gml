var idplane;
var oldspeed;
var olddirection;

idplane = argument0;
olddirection = idplane.direction;

if !(idplane.isplanecrashed){
    idplane.direction += idplane.turnvalue;
    //if (idplane.speed  + idplane.fvalue) < speedplanemax - 0.1 {
      motion_add(idplane.direction  , idplane.fvalue);
    //}else{
    //  idplane.speed = speedplanemax;
    //}
    
    if (idplane.isplaneonrunway){
      // take care of the take of of plane     
      if (idplane.turnvalue == 0 ) idplane.vspeed = 0;    
    }else{
      idplane.vspeed += idplane.gravityplane - (idplane.speed * 2.1/100); 
    }  
       
    if (idplane.speed > speedplanemax)  idplane.speed = speedplanemax;
        
}else{
  idplane.speed = 0;
}


