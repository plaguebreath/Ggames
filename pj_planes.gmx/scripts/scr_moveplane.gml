var idplane;
idplane = argument0;

idplane.turnvalue = 0;
//idplane.facceleration = 0;

/// Local Variables
var right = keyboard_check(ord('D')); 
var left =  keyboard_check(ord('A')); 
var up = keyboard_check(ord('W'));    
var down = keyboard_check(ord('S'));  
var firemg = keyboard_check(vk_space);  
var firebomb = keyboard_check(vk_ralt);  
var test = keyboard_check(ord('O')) 

//idplane.sprite_index = sp_fokker;
//obj_plane.image_index = 0;
planemovement = 0;
//isfiremg = false;

/// Movement check
if (!idplane.isplanecrashed && !idplane.isplanestall){
if (keyboard_check(vk_anykey) || device_mouse_check_button(0, mb_left)){ 
   if (test) idplane.vspeed += 1;  
  if (right){ 
    if (idplane.facceleration < MAX_fvalue){
       if (idplane.facceleration > 0){
         idplane.facceleration += 0.0004 + abs(idplane.facceleration) * 0.025;
       }else{
         idplane.facceleration += 0.001 + abs(idplane.facceleration) * 0.05;
       }
       if (idplane.facceleration > MAX_fvalue) idplane.facceleration = MAX_fvalue;
    }
    //if (facceleration < MAX_facceleration){ facceleration += faccelerationstep; }else{facceleration = MAX_facceleration;}      
  }else if (left){
    //if (facceleration > 0){ facceleration -= faccelerationstep; }else{facceleration = 0;}
    if (idplane.facceleration > MIN_fvalue){
       if (idplane.facceleration > 0){
         idplane.facceleration -= 0.0030 + abs(idplane.facceleration) * 0.025;
       }else{
         idplane.facceleration -= 0.001 + abs(idplane.facceleration) * 0.0025;
       }
       if (idplane.facceleration < MIN_fvalue) idplane.facceleration = MIN_fvalue;
    }
  }
  
  // up or down on keyboard for change angle of airplane
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
       if (!idplane.isflipped){
          idplane.turnvalue = idplane.turnfactor;  
        }else{
          idplane.turnvalue = -1 * idplane.turnfactor;  
        }      
    }   
    //idplane.sprite_index = sp_fokkerup;
    planemovement = 1;
  }else if (down && !idplane.isplaneonrunway){ 
      if (!idplane.isflipped){
          idplane.turnvalue = -1 *idplane.turnfactor;  
        }else{
          idplane.turnvalue =  idplane.turnfactor;  
        }     
    //idplane.direction -= idplane.turnfactor ;
     //idplane.sprite_index = sp_fokkerdown;
     planemovement = -1;
   }
   
  if (firemg && !idplane.isplaneonrunway &&  idplane.bullets > 0) {    
    //if (!idplane.ismgjammed){    
      scr_mgfire(idplane);     
    //}      
  }
   
  if (firebomb && !idplane.isplaneonrunway && idplane.bombs > 0) {
    if (!idplane.isflipped && (idplane.direction <=90 || idplane.direction >270)) || (idplane.isflipped && (idplane.direction >90 && idplane.direction <=270)) {
      scr_bomb(idplane);
    }
  }
  
  if keyboard_check_pressed(ord('M')){
    //global.mouseenabled = !global.mouseenabled
  }
  
   if keyboard_check_pressed(vk_escape){
     game_end();
  }
}
 
// If enabled mouse use it to track the angle difference between plane and mouse and make it turn
if (global.mouseenabled){
  //if (global.mouseoldx <> mouse_x || global.mouseoldy <> mouse_y){
  //global.mouseoldx = mouse_x;
  //global.mouseoldy = mouse_y;
  currentAngle = idplane.direction;
  desiredAngle = point_direction(idplane.x,idplane.y,mouse_x,mouse_y);
  var dangle = angle_difference(currentAngle, desiredAngle);
  //show_debug_message(dd);
  var dmouse = 0; // no move
  
    if (dangle > 10 || dangle < -10) {
    if (dangle > 0) dmouse = -1; // turn down
    if (dangle < 0) dmouse = 1; // turn up
    if (dmouse == 1){
      up = true
      //turn up
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
    //idplane.sprite_index = sp_fokkerup;
    }else if (dmouse == -1){
      down = true;
      //turn down
      if (!idplane.isplaneonrunway){ 
        if (!idplane.isflipped){
          idplane.turnvalue = -1 *idplane.turnfactor;  
        }else{
          idplane.turnvalue =  idplane.turnfactor;  
        }     
        //idplane.direction -= idplane.turnfactor ;
        //idplane.sprite_index = sp_fokkerdown;
      }
    }
  }
}

//if ((!up && idplane.oldbuttonpressed != 3) && (!down && idplane.oldbuttonpressed != 4)) scr_fliponflight(idplane);
if (idplane.turnvalue == 0 && idplane.oldturnvalue == idplane.turnvalue){
scr_fliponflight(idplane,0); // l'aereo è stazionario controlla il flip
}else if (idplane.turnvalue != 0){
scr_fliponflight(idplane,1); // aggiorna il timer ma non controlare il flip
}
idplane.oldturnvalue = idplane.turnvalue;
}

if (idplane.ismgjammed) scr_mgjammed(idplane);

//}



