/// @desc активация устройства
if (device)
{
    alarm[0] = colPlayerPeriod;
    activated = place_meeting(x, y, oPlayer);
    /*if (activated != prevActivated) // если до этого состояние было другое
        device.activated = activated; // меняем состояние устройства*/
    if (activated && !prevActivated) // если активирован, а был неактивирован
        device.activated = true; // активируем устройство
    prevActivated = activated;
}