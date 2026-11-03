Volumio is a great audio streamer (probably the best for DIY), however, the devs refuse to support
ReplayGain (even though mpd supports it).
They seem to feel that the user should be forced to listen to tracks 
jumping between different gain levels in thier playback. or to use thier 'Volume normalization' plugin
which does actually affect the sound quality in a negative way and also gobbles system resources even on an RPI-5.
They seem to be rather vehement about this to the point that they 
hardcode a block to Volumio updates if files have been changed.

I do not agree with them about this.

So, I wrote this script.

Now bear in mind this edit's core volumio files!!
I have tried to make certain it's as failsafe as possible.

To enable actual replaygain you need to ssh into your volumio install
and run this script from the command line with the -e or --enable flag
then go to the playback options under setting in volume and click save under mixertype
(you could actually click any save in that section, but this is what I do).
mpd will restart and ReplayGain will stay functional between reboots and config changes.

Now when the Volumio devs roll out an update to Volumio, it will be blocked because a template was modified.

To be able to update without a doing a factory reset, ssh into your Volumio install
and run this script from the command line with the -r or --restore flag
then go to the playback options under setting in volume and click save under mixertype
(you could actually click any save in that section, but this is what I do).

Now you can do your update, and then go re-enable ReplayGain again.

Enjoy.
