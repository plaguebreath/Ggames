  var idplane;
  if !(argument0 == 0){
    idplane  = argument0;
  
    with (idplane)
    {
     instance_destroy();
    }
  }   
  
  global.playerinstance = instance_create(-1, -1, obj_playerplane);  
