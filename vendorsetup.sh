add_lunch_combo cm_turkcellt50-userdebug

cd build
if grep -q "block " core/Makefile
then
    git am ../device/zte/turkcellt50/patches/Disable-block-based-installation.patch || git am --abort
else
    echo 'Block based flashing is already disabled';
fi
croot

cd packages/apps/Settings
if grep -q "CFQ" res/values/strings.xml
then
    echo 'CFQ option patch is already applied';
else
    git am ../../../device/zte/turkcellt50/patches/0001-Add-option-to-use-CFQ-I-O.patch || git am --abort
fi
croot

cd packages/apps/Settings
if grep -q "use_zram_summary" res/values/strings.xml
then
    echo 'ZRAM option patch is already applied';
else
    git am ../../../device/zte/turkcellt50/patches/0002-Add-an-option-for-activate-ZRAM.patch || git am --abort
fi
croot

cd packages/apps/SoundRecorder
if grep -q "mRequestedType = AUDIO_WAVE_2CH_LPCM" src/com/android/soundrecorder/SoundRecorder.java
then
    echo 'Sound Recorder patch is already applied';
else
    git am ../../../device/zte/turkcellt50/patches/0001-Force-to-use-WAV.patch || git am --abort
fi
croot
