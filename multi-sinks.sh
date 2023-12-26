#!/bin/sh

# Adapted from https://bbs.archlinux.org/viewtopic.php?id=261484

pactl load-module module-null-sink media.class=Audio/Sink sink_name=Simultaneous channel_map=stereo
pw-link Simultaneous:monitor_FL alsa_output.pci-0000_00_03.0.hdmi-stereo:playback_FL
pw-link Simultaneous:monitor_FL alsa_output.pci-0000_00_1b.0.analog-stereo:playback_FL
pw-link Simultaneous:monitor_FR alsa_output.pci-0000_00_03.0.hdmi-stereo:playback_FR
pw-link Simultaneous:monitor_FR alsa_output.pci-0000_00_1b.0.analog-stereo:playback_FR

