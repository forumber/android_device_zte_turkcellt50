add_lunch_combo cm_turkcellt50-userdebug

cd hardware/qcom/audio-caf/msm8974
if grep -q "acdb_send_audio_cal_t)dlsym(my_data->acdb_handle" hal/msm8974/platform.c
then
    git am ../../../../device/zte/turkcellt50/patches/0001-fix-audio.patch || git am --abort
    echo 'Audio fix for T50 is now applied';
else
    echo 'Audio fix for T50 is already applied';
fi
croot

cd build
if grep -q "block " core/Makefile
then
    git am ../device/zte/turkcellt50/patches/Disable-block-based-installation.patch || git am --abort
    echo 'Disabled block based flashing';
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
    echo 'CFQ option patch is now applied';
fi
croot

cd packages/apps/Settings
if grep -q "use_zram_summary" res/values/strings.xml
then
    echo 'ZRAM option patch is already applied';
else
    git am ../../../device/zte/turkcellt50/patches/0002-Add-an-option-for-activate-ZRAM.patch || git am --abort
    echo 'ZRAM option patch is now applied';
fi
croot
