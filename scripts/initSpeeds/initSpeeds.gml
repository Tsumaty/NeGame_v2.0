/// @desc функция инициализации скоростей (не исп-ся)
function initSpeeds(sp)
{
    accelRate = sp / 5; // скорость ускорения
    liftSpeed = sp * 1.3; // скорость подъёма
    liftMaxHeight = (bbox_bottom - bbox_top) / 14 + 4;
    decelRate = sp / 8; // скорость замедления
}