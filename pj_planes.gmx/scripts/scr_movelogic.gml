var idplane;
var olddirection;

idplane = argument0;
olddirection = idplane.direction;

if (!idplane.isplanecrashed){
    idplane.direction += idplane.turnvalue;
     //if (idplane.speed  + idplane.fvalue) < speedplanemax - 0.1 {
      if (idplane.planefuel <= 0) idplane.fvalue = -0.04;
      if (idplane.speed + idplane.fvalue > 0){
        motion_add(idplane.direction  , idplane.fvalue);
        idplane.isreloading = false;
      }else{
        idplane.speed = 0;
      }
    //}else{
    //  idplane.speed = speedplanemax;
    //}
 
    if (idplane.isplaneonrunway){
      // take care of the take of of plane     
      if (idplane.turnvalue == 0 ){ 
        idplane.vspeed = 0;
        //idplane.speed = 0;
      }    
    }else{
       if (idplane.planefuel > 0){
         idplane.vspeed += idplane.gravityplane - (idplane.speed * 2.05/100); 
       }else{
         idplane.vspeed += idplane.gravityplane -0.02 ;
       }
    }  
   
   if (idplane.speed > speedplanemax)  idplane.speed = speedplanemax;   
}else{
  idplane.speed = 0;
}

var fueltodecrease = (idplane.speed)/100;
if (idplane.speed > 0){
  if (idplane.planefuel - fueltodecrease > 0){
     idplane.planefuel -= fueltodecrease;
   }else{
     idplane.planefuel = 0;
   }    
}



