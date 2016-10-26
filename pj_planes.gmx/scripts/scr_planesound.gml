 var idplane;
 var typeofsound;
 
 idplane = argument0;
 typeofsound = argument1;

 //enginesound = 0
 //mgsound = 1
 //explosion = 2
 
if (global.audiosfx ==1){
 with (idplane){ 
   // setta posizione emettitore suono giocatore come la sua posizione
   audio_emitter_position(em_player, x, y, 0); 
   audio_listener_position(x,y,0);
   audio_set_master_gain(0, global.soundvolume);
 
   if (global.soundvolume > 0){
     if (!isplanecrashed){
          
       switch (typeofsound){
         case 0:
           if (enginestarted){
             if !audio_is_playing(snd_enginestart){               
               audio_play_sound_on(em_player, snd_enginestart, false, 1);                                 
             }   
             enginestarted = false;  
           }
       
           if (!isplanestall){
             if audio_is_playing(snd_engine0) audio_stop_sound(snd_engine0);
             if (speed > 0){
               if !audio_is_playing(snd_enginestart){  
                 if !audio_is_playing(snd_engine1) audio_play_sound_on(em_player,snd_engine1,true,2);
                 //audio_resume_sound(snd_engine1);        
                 //audio_sound_gain(snd_engine1,0.1,0.2); 
                 //audio_sound_gain(snd_engine1,0.5,0);
                 audio_sound_pitch(snd_engine1, (p_propeller.rotationspeed + 4) * 10 / 110);
                 //if (idplane.planefuel > 0){      
                 //  audio_sound_pitch(snd_engine1, (speed + 5) * 10 / 110);
                 //}else{
                 //  audio_sound_pitch(snd_engine1, (speed + 1) * 10 / 110);
                // }
               }
             }else{ 
               //audio_sound_gain(snd_engine1,0,0);  
               //audio_pause_sound(snd_engine1);
               audio_stop_sound(snd_engine1);  
             } 
       
           //if (isplanecrashed){
           //  //audio_pause_sound(snd_engine1);
           //   audio_stop_sound(snd_engine1);    
           // }    
           }else{
             // on stall
             audio_stop_sound(snd_engine1);  
             if !audio_is_playing(snd_engine0) audio_play_sound_on(em_player,snd_engine0,true,2);
           }  
           break;   
       
         case 1:
           if !audio_is_playing(snd_mg){
             //  audio_play_sound(snd_mg,0,false);
             if (!ismgjammed){
               audio_play_sound_on(em_player, snd_mg, false, 1);
             }else{
               audio_play_sound_on(em_player, snd_jam, false, 1);
             }
           }
           break; 
       
    //case 2:
    //   if audio_is_playing(snd_engine1)  audio_stop_sound(snd_engine1);
    //   if (soundexplosionplayed == 0){
    //     audio_play_sound_on(em_player, snd_expplane, false, 1); 
    //     soundexplosionplayed  =1;
    //   }     
    //   break;     
     }
   }else{
     // Play sound plane crashed
     if audio_is_playing(snd_engine1)  audio_stop_sound(snd_engine1);
     if (soundexplosionplayed == 0){
       audio_play_sound_on(em_player, snd_expplane, false, 1); 
       soundexplosionplayed  =1;
     }
    }     
   } 
 }
}
