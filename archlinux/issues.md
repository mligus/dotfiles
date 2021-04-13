# Know issues

## Black screen after waking up from sleep (suspend) on ODYSSEY mini PC

Diagnose:

```
# journalctl -p 3 -xb
# journalctl -b | grep -iE '.*(power|suspend).*'
# lspci
# lsmod | grep i915
# dmesg | grep -i -e i915 -e drm -e vga
# systool -vm snd_hda_intel
```

Example error:
```
Nov 29 23:01:12 yuvi-pc kernel: snd_hda_codec_hdmi hdaudioC0D2: Monitor plugged-in, Failed to power up codec ret=[-13]
```

Solution:
```
# vim systool -vm snd_hda_intel
options snd_hda_codec_hdmi enable_silent_stream=N
```

Links:
  * https://discuss.getsol.us/d/6077-black-screen-after-screen-gets-automatically-locked/10
  * https://bbs.archlinux.org/viewtopic.php?id=261225
  * https://wiki.archlinux.org/index.php/Kernel_mode_setting#Early_KMS_start
  * https://wiki.archlinux.org/index.php/Power_management/Suspend_and_hibernate
