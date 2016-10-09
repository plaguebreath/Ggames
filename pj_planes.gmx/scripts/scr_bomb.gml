 var objid;
  
  objid = argument0;
 
  with (objid){ 
    timeCurrentbomb = current_time; 
    if (timeCurrentbomb - timeInitbomb >= fireintervalbomb) { 
      //with (instance_create(x+lengthdir_x(offsetlenbomb,direction),y+lengthdir_y(offsetlenbomb,direction) , obj_bomb)) {         
      with (instance_create(objid.x+lengthdir_x(objid.offsetlenbomb,objid.direction),objid.y+lengthdir_y(objid.offsetlenbomb,objid.direction) +25 , obj_bomb)) {
        direction = objid.direction;
        image_angle =  direction;       
        speed = objid.speed; 
        objid.bombs -= 1;   
      }     
    timeInitbomb = timeCurrentbomb; // update the time to compare to
    }
  }
