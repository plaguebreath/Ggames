  var idplane;
  if !(argument0 == 0){
    idplane  = argument0;
  
    with (idplane)
    {
     instance_destroy();
    }
  }   
  idplane = instance_create(x, y, obj_playerplane);

