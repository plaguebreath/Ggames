  var objid;
  
  objid = argument0;
 
  with (objid){ 
    timeCurrentmg = current_time; 
    if (timeCurrentmg - timeInitmg >= fireintervalmg) { 
     
         with (instance_create(objid.x+lengthdir_x(offsetlenmg,objid.direction),objid.y+lengthdir_y(offsetlenmg,objid.direction) -5, obj_bullet)) { 
        
        direction = objid.direction;
        image_angle =  direction;
        speed = bulletspeed;
        objid.bullets -= 1;  
        
        // Process sounds of engine
        scr_planesound(objid,1);   
        //if !audio_is_playing(snd_mg){
        //  audio_play_sound(snd_mg,0,false);
        //}
        
          
      }
     
    timeInitmg = timeCurrentmg; // update the time to compare to
    }
   }
 
