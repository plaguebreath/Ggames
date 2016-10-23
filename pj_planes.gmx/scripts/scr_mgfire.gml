  var objid;
  
  objid = argument0;
 
  with (objid){  
    timeCurrentmg = current_time; 
    if (timeCurrentmg - timeInitmg >= fireintervalmg ) {        
        if (!ismgjammed){
        with (instance_create(objid.x+lengthdir_x(offsetlenmg,objid.direction),objid.y+lengthdir_y(offsetlenmg,objid.direction) -5, obj_bullet)) { 
        direction = objid.direction;
        image_angle =  direction;
        speed = bulletspeed;
        objid.bullets -= 1; 
        objid.isfiremg = true; 
        }      
      }
     
        // Process sounds of engine
        //show_debug_message("plane sound");
        scr_planesound(objid,1);   
        //if !audio_is_playing(snd_mg){
        //  audio_play_sound(snd_mg,0,false);
        //}
                      
     timeInitmg = timeCurrentmg; // update the time to compare to
    
     
      var nrandom = random(10);
      if (nrandom >= 9.4) ismgjammed = true;     
    }
   }
 
