image_speed = 0;

//
// облако
//
activated = false; // активировано ли
//isLookingRight = true; // повёрнуто вправо
// масштаб
scalex = 0;
scaley = 0;
// анимация появления
animCurve = animcurve_get_channel(pingPong, 0);
animPos = 0; // позиция
//animDefaultSpeed = animSpeed; // стандартная скорость
playAnim = 0; // 0 - не проигрывать, 1 - проигрывать вперёд, -1 - задом наперёд
//playAnimForwards = true; // проигрывать вперёд

//
// реплики
//
//msg = [];
msgNumber = 0; // номер
// координаты
//msgx = bbox_left + (bbox_right - bbox_left) / 2;
//msgy = bbox_top + (bbox_bottom - bbox_top) / 2;
//alarm[1] = 2; // таймер проверки на смену x-позиции
// масштаб
msgScalex = 0;
msgScaley = 0;
// анимация
msgAnimCurve = animcurve_get_channel(pingPong, 0);
msgAnimPos = 0; // позиция
playMsgAnim = 0; // 0 - не проигрывать, 1 - проигрывать вперёд, -1 - задом наперёд
//playMsgAnimForwards = true; // проигрывать вперёд
msgVisible = false; // видимость сообщения
msgTimer = -1; // таймер включения сообщения

//
// звуки разговора
//
//chatName = "sndChat";
var sndNums = initSound(chatName);
chatNum = sndNums[0];
chatMaxNum = sndNums[1];