image_speed = 0;
activated = false; // активировано ли
// масштаб
scalex = 0;
scaley = 0;
// анимация появления
animCurve = animcurve_get_channel(pingPong, 0); // аним. кривая
animPos = 0; // позиция кривой
//animSpeed = 1.2 / FPS; // скорость
//animDefaultSpeed = animSpeed; // стандартная скорость
playAnim = false; // нужно ли проигрывать
//playAnimForwards = true; // проигрывать вперёд
//text = ""; // текст