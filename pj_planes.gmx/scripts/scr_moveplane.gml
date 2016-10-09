var idplane;
idplane = argument0;

/// Local Variables
right = keyboard_check(ord('D'));
left =  keyboard_check(ord('A'));
up = keyboard_check(ord('W'));
down = keyboard_check(ord('S'));
firemg = keyboard_check(vk_space);
firebomb = keyboard_check(vk_enter);

//idplane.sprite_index = sp_fokker;
//obj_plane.image_index = 0;

/// Movement check
if keyboard_check(vk_anykey) && !idplane.isplanecrashed && !idplane.isreloading && !idplane.isplanestall
{   
  if (right){ 
    if (idplane.isplaneonrunway){
      if (idplane.speed == 0){
        idplane.enginestarted = true;
      }
      if (idplane.speed < 1) {
        fvalue = idplane.facceleration/10 ;
        //motion_add(idplane.direction, );
      }else{ 
        //motion_add(idplane.direction, idplane.facceleration/2);
        fvalue = idplane.facceleration/2 ;
      }        
    }else{
      fvalue = idplane.facceleration/2 ;
      
      //if (idplane.speed + idplane.facceleration/2 < idplane.speedplanemax){ 
      //  motion_add(idplane.direction, idplane.facceleration/2);
      //}else{
      // idplane.speed = idplane.speedplanemax;
      //}
    }
  }else if (left){
    //if (!idplane.isplanelanding){ 
    if (idplane.speed < 1) {
       if (idplane.speed - idplane.facceleration/5  > 0){
         fvalue = -1 * idplane.facceleration/5 ;
       }
    }else{
    //if (idplane.speed - (idplane.facceleration /2)  > 0) 
      fvalue = -1 * idplane.facceleration /2 ;
    }
   // if (idplane.isplaneonrunway){ 
   //   if (idplane.speed < idplane.takeoffspeed && idplane.speed - idplane.facceleration /2  > 0) fvalue = -1 * idplane.facceleration /2 ;
   // }else{
   //   if (idplane.speed > 2) fvalue = -1 * idplane.facceleration /2 ;
      //if (idplane.speed > 1) motion_add(idplane.direction, -1 * (idplane.facceleration))
      //if (idplane.speed -1 * idplane.facceleration / 2 > 2){ 
      //  motion_add(idplane.direction,  -1 * idplane.facceleration / 2)
      //}else{
      //  idplane.speed = 2;
      //}
   // }
    //}
  }
  
  if (up){ 
    if (idplane.isplaneonrunway){    
      if (idplane.speed >= idplane.takeoffspeed)
      {
        //idplane.direction += idplane.turnfactor;
       idplane.turnvalue = idplane.turnfactor;    
        //idplane.isplaneonrunway = false;            
      } 
    }else{
      //idplane.direction += idplane.turnfactor ; 
       if (!isflipped){
          idplane.turnvalue = idplane.turnfactor;  
        }else{
          idplane.turnvalue = -1 * idplane.turnfactor;  
        }      
    }   
    idplane.sprite_index = sp_fokkerup;
  }else if (down && !idplane.isplaneonrunway){ 
      if (!isflipped){
          idplane.turnvalue = -1 *idplane.turnfactor;  
        }else{
          idplane.turnvalue =  idplane.turnfactor;  
        }     
    //idplane.direction -= idplane.turnfactor ;
     idplane.sprite_index = sp_fokkerdown;
  }
  
  if (firemg && !idplane.isplaneonrunway && idplane.bullets > 0) {
    scr_mgfire(idplane);   
  }
  
  if (firebomb && !idplane.isplaneonrunway && idplane.bombs > 0) {
    scr_bomb(idplane);
  }
}


