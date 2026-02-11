#!/bin/bash
while true; do
    pactl set-source-volume "rnnoise_source" 100%
    pactl set-source-volume "alsa_input.usb-0c76_USB_PnP_Audio_Device-00.mono-fallback" 100%
    sleep 5
done
