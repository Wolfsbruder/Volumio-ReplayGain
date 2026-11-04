Volumio is a great audio streamer (probably the best for DIY), however, the devs refuse to support ReplayGain (even though mpd supports it).
They seem to feel that the user should be forced to listen to tracks jumping between different gain levels in their playback. or to use their 'Volume normalization' plugin which does actually affect the sound quality in a negative way and also gobbles system resources even on an RPI-5 because it analyzes and modifies the sound playback in real-time, as opposed to using a pre-generated replay gain setting from the files own metadata.
They seem to be rather vehement about this to the point that they hardcode a block to Volumio updates if files have been changed.

I do not agree with them about this. But it's their project and they make their own rules.

So, I wrote this script ages ago to just keep it simple s...

Now bear in mind this edit's core volumio files!!
I have tried to make certain it's as failsafe as possible.
If your volumio install has issues, and the devs see that core files have been modified they will not help you or support you.
So if you have issues (unrelated to replaygain) restore your settings (see further down the readme and use the -r or --restore flag) and then contact support :)

To enable actual replaygain you need to ssh into your volumio install and run this script from the command line with the -e or --enable flag then go to the playback options under settings in volumio and click save under mixertype (you could actually click any save in that section, but this is what I do).
mpd will restart and ReplayGain will stay functional between reboots and config changes.

Now when the Volumio devs roll out an update to Volumio, it will be blocked because a template was modified.

To be able to update without a doing a factory reset, ssh into your Volumio install and run this script from the command line with the -r or --restore flag then go to the playback options under setting in volume and click save under mixertype
(you could actually click any save in that section, but this is what I do).

Now you can do your update, and then go re-enable ReplayGain again.

Enjoy.
