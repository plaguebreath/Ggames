 var idplane;
 var typeofsound;
 
 idplane = argument0;
 typeofsound = argument1;

 //enginesound = 0
 //mgsound = 1
 //bombsound = 2
 //explosion = 3
 
 with (idplane){ 
   // setta posizione emettitore suono giocatore come la sua posizione
   audio_emitter_position(em_player, x, y, 0); 
   audio_listener_position(x,y,0);
   audio_set_master_gain(0, global.soundvolume);
 
   if (global.soundvolume > 0){
   switch (typeofsound){
     case 0:
       if (idplane.enginestarted){
         if !audio_is_playing(snd_enginestart){
           audio_play_sound_on(em_player, snd_enginestart, false, 1);               
           //audio_pause_sound(snd_engine1);       
           idplane.enginestarted = false; 
         }   
       }
       
       if (!isplanestall){
         if audio_is_playing(snd_engine0) audio_stop_sound(snd_engine0);
         if (idplane.speed > 0){
           if !audio_is_playing(snd_enginestart){  
             if !audio_is_playing(snd_engine1) audio_play_sound_on(em_player,snd_engine1,true,1);
             //audio_resume_sound(snd_engine1);        
             //audio_sound_gain(snd_engine1,0.1,0.2); 
             //audio_sound_gain(snd_engine1,0.5,0);      
             audio_sound_pitch(snd_engine1, (idplane.speed + 5) * 10 / 110); 
             //audio_sound_pitch(snd_engine1, 1); 
           }
         }else{ 
           //audio_sound_gain(snd_engine1,0,0);  
           //audio_pause_sound(snd_engine1);
           audio_stop_sound(snd_engine1);  
         } 
       
         if (idplane.isplanecrashed){
           //audio_pause_sound(snd_engine1);
           audio_stop_sound(snd_engine1);    
         }
       
       }else{
         // on stall
         audio_stop_sound(snd_engine1);  
         if !audio_is_playing(snd_engine0) audio_play_sound_on(em_player,snd_engine0,true,1);
       }  
       break;   
       
     case 1:
       if !audio_is_playing(snd_mg){
        //  audio_play_sound(snd_mg,0,false);
          audio_play_sound_on(em_player, snd_mg, false, 1);
       }
       break; 
       
    case 3:
       if audio_is_playing(snd_engine1)  audio_stop_sound(snd_engine1);
       if (soundexplosionplayed == 0){
         audio_play_sound_on(em_player, snd_expplane, false, 1); 
         soundexplosionplayed  =1;
       }     
       break;     
     }
   } 
 }
