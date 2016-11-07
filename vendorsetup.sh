add_lunch_combo cm_turkcellt50-userdebug

cd hardware/qcom/audio-caf/msm8974
if grep -q "acdb_send_audio_cal_t)dlsym(my_data->acdb_handle" hal/msm8974/platform.c
then
    git am ../../../../device/zte/turkcellt50/audio/0001-fix-audio.patch || git am --abort
    echo 'Audio fix for T50 is now applied';
else
    echo 'Audio fix for T50 is already applied';
fi
croot
