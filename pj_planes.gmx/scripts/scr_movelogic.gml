var idplane;
var olddirection;

idplane = argument0;
olddirection = idplane.direction;

if (!idplane.isplanecrashed){
    //Logic check for speed  
    if (idplane.isplaneonrunway){    
      //if (idplane.speed < 1 && idplane.facceleration > 0) {
      //  idplane.fvalue += idplane.facceleration / 5000;
      //}else if (idplane.speed >= 1){ 
      //  idplane.fvalue += (idplane.facceleration / 5000) + idplane.speed/5000;
      //}else{
      //  idplane.fvalue = -0.04;
      //}
      if (idplane.speed ==0 && facceleration > 0){
        idplane.enginestarted = true;      
      }            
      // take care of the take of of plane     
      if (idplane.turnvalue == 0 ){ 
        idplane.vspeed = 0;
        //idplane.speed = 0;
      }    
    }else{    
       if (idplane.planefuel > 0){
         //idplane.fvalue += facceleration/100
         //idplane.fvalue += -idplane.speed/5000 + (idplane.facceleration / 300) ;              
         idplane.vspeed += idplane.gravityplane - (idplane.speed * 2.01/100); 
         //idplane.vspeed += idplane.gravityplane - ((idplane.speed/10) -0.002)/100 ; 
         //idplane.vspeed += idplane.gravityplane - (( idplane.facceleration - MAX_fvalue ) / 10)- 0.2; 
       }else{
         //idplane.fvalue = -0.04;
         idplane.facceleration = 0;
         idplane.vspeed += idplane.gravityplane + 0.02 ;        
       }
    }  
    idplane.fvalue = idplane.facceleration -0.004;
    idplane.direction += idplane.turnvalue;
     //if (idplane.speed  + idplane.fvalue) < speedplanemax - 0.1 {
      //if (idplane.fvalue > MAX_fvalue) idplane.fvalue = MAX_fvalue;
      //if (idplane.fvalue < -0.04) idplane.fvalue = -0.04;
      if (idplane.speed + idplane.fvalue > 0){
        motion_add(idplane.direction  , idplane.fvalue);
        idplane.isreloading = false;
      }else{
        idplane.speed = 0;
      }
  
   if (idplane.speed > speedplanemax)  idplane.speed = speedplanemax;   
}else{
  idplane.speed = 0;
}

var fueltodecrease = (idplane.speed)/1000;
//if (idplane.speed > 0){
  if (idplane.planefuel - fueltodecrease > 0){
     idplane.planefuel -= fueltodecrease;
   }else{
     idplane.planefuel = 0;
   }    
//}



