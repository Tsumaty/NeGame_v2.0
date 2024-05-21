event_inherited();
defJumpForce = jumpForce; // стандартная сила прыжка
increasedJumpForce = 2 * defJumpForce; // увеличенная сила прыжка
increasedJumpsNum = 0; // оставшееся кол-во усиленных прыжков
increasedJumpsNumstart = increasedJumpsNum;
isChatting = false;
deathsNumLevelJumpTrain = 0; // количество смертей на уровне обучения прыжкам
depth -= 5;

chatChar = noone; // с кем сейчас разговаривает
endChatChar = noone; // когда заканчивает разговор с этим персонажем,
endChatEvent = pointer_null; // происходит это событие

// звуки шагов
var sndNums = initSound(stompName);
stompNum = sndNums[0]; // случайный номер
stompMaxNum = sndNums[1]; // макс. номер

// звуки прыжка
sndNums = initSound(jumpName);
jumpNum = sndNums[0];
jumpMaxNum = sndNums[1];

// звуки смерти
sndNums = initSound(deathName);
deathNum = sndNums[0];
deathMaxNum = sndNums[1];

// пустой объект по центру для следования камеры
spriteCenter = instance_create_depth(getCenterX(), getCenterY(), depth, oBlank);
spriteCenter.persistent = true;

// функция инициализации камеры
initCamera = function()
{
    // устанавливаем границы и скорость наблюдения за игроком
    var mainCamera = view_get_camera(0);
    camera_set_view_border(mainCamera, camera_get_view_width(mainCamera) / 2 * 0.97,
                           camera_get_view_height(mainCamera) / 2 * 0.95);
    camera_set_view_speed(mainCamera, 600 / FPS, 600 / FPS);
    view_enabled = true;
    view_visible[0] = true;
    camera_set_view_target(mainCamera, spriteCenter);
}
initCamera();

isTakingDamage = false; // получает ли урон
blinkingPeriod *= FPS; // период мерцания при получении урона