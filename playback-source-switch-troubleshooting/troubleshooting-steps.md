### Reinstalling Alsa and getting rid of timidity-daemon
`sudo apt-get install --reinstall alsa-base pulseaudio`  
`sudo alsa force-reload`  
`sudo apt purge timidity-daemon`  

### Auto-setting output and mic based on Jack events
`sudo apt install alsa-tools-gui`  
`sudo hdajackretask`  
##### Change the following flags after enabling parser hints checkbox, then "Apply Now" and "Install Boot Override"
- jack_detect = yes
- trigger_sense = yes
- primary_hp = yes
- multi_io = yes
- add_hp_mic = yes
