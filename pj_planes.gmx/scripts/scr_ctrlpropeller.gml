var objplane;
  
  objplane = argument0;
 
  with (objplane){ 
    if (planefuel > 0){
      p_propeller.rotationspeed = speed;
    } else{
      if (p_propeller.rotationspeed -0.5 >1){
        p_propeller.rotationspeed -= 0.5;
      }else{
        p_propeller.rotationspeed = 1;
      }
    }
    p_propeller.x = x;
    p_propeller.y = y;
    p_propeller.direction = direction;
    p_propeller.image_angle = direction;
    p_propeller.speed = speed;
    p_propeller.vspeed = vspeed;
  }
