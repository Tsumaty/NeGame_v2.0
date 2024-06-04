// получаем спрайты
var spriteName = "s" + name; // название спрайта
var spriteNameStop = spriteName + "Stop"; // название спрайта неподвижности
var spriteNameMove = spriteName + "Move"; // название спрайта передвижения
// спрайт неподвижности
spriteStop = sprite_index;
var sprite = asset_get_index(spriteNameStop);
if (sprite != -1) spriteStop = sprite;
spriteStopSpeed = spriteStopSpeed * breatheSpeed / FPS; // скорость
// спрайт передвижения
spriteMove = sprite_index;
sprite = asset_get_index(spriteNameMove);
if (sprite != -1) spriteMove = sprite;
spriteMoveSpeed /= FPS; // скорость

isLookingRight = bool(sign(image_xscale)); // смотрит ли вправо
maxsp /= FPS; // максимальная скорость
accelRate *= maxsp; // скорость ускорения
liftSpeed *= maxsp; // скорость подъёма на препятствия
liftMaxSpeed = liftSpeed;
// максимальная высота, на которую можно забраться, не прыгая
liftMaxHeight = liftMaxHeight * (bbox_bottom - bbox_top) + 2;
decelRate *= maxsp;
//initSpeeds(maxsp); // другие скорости, зависящие от максимальной
//horsp = 0; // текущая скорость по горизонтали
//versp = 0; // текущая скорость по вертикали
moveRight = false; // идёт ли вправо
moveLeft = false; // идёт ли влево
doJump = false; // находится ли в состоянии прыжка
jumpForce /= FPS; // сила прыжка
jumped = false; // прыгнул

stand = noone; // опора, на которой можно стоять;
// platf = noone; // платформа, на которую можно запрыгнуть снизу через неё
// onPlatform = false; // стоит ли на платформе
onMovingPlatform = false; // стоит ли на движущейся платформе
platfHorsp = 0; // гориз. ск-ть платформы
platfVersp = 0; // верт. ск-ть платформы

// масштаб существа
scalex = image_xscale;
scaley = image_yscale;

// дыхание
breathe = animcurve_get_channel(inOutBezier, 0); // аним. кривая
breathePos = 0; // позиция кривой
breatheSpeed /= FPS; // скорость

// звуки приземления
var sndNums = initSound(groundName); // массив из двух чисел:
groundNum = sndNums[0]; // случайный номер
groundMaxNum = sndNums[1]; // максимальный номер

// звуки отскока
sndNums = initSound(bounceName);
bounceNum = sndNums[0];
bounceMaxNum = sndNums[1];

startColor = image_blend; // начальный цвет
startAlpha = image_alpha; // начальная прозрачность

// задаём начальные переменные
updateStartVars();