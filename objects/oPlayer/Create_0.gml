event_inherited();
defJumpForce = jumpForce; // стандартная сила прыжка
increasedJumpForce = 2 * defJumpForce; // увеличенная сила прыжка
increasedJumpsNum = 0; // оставшееся кол-во усиленных прыжков
isChatting = false;
chatChar = noone; // персонаж, с которым разговаривает
deathsNumLevelJumpTrain = 0; // количество смертей на уровне обучения прыжкам
depth -= 2;

enum EndChatEvents
{
    CanBounce,
    IncreaseJumpForce
}

endChatChar = noone; // когда заканчивает разговор с этим персонажем,
endChatEvent = pointer_null; // происходит это событие

// функция обновления начальных переменных
updateStartVars = function()
{
    hpstart = hp;
    xstart = x;
    ystart = y;
    horspstart = horsp;
    verspstart = versp;
    rightstart = isLookingRight;
    increasedJumpsNumstart = increasedJumpsNum;
}
updateStartVars();

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

// функция перевода переменных в начальное состояние
initVars = function()
{
    hp = hpstart;
    x = xstart;
    y = ystart;
    horsp = horspstart;
    versp = verspstart;
    isLookingRight = rightstart;
    increasedJumpsNum = increasedJumpsNumstart;
    chatChar = noone;
}
/*
// иницализируем переменные
initVars = function()
{
    hp = playerHp;
    x = playerX;
    y = playerY;
    horsp = playerHorsp / FPS;
    versp = playerVersp / FPS;
    isLookingRight = playerRight;
    canBounce = playerCanBounce;
    isChatting = false;
    chatChar = noone; // персонаж, с которым разговаривает
    endChatChar = noone; // когда заканчивает разговор с этим персонажем,
    endChatEvent = ""; // происходит это событие
    increasedJumpsNum = playerIncreasedJumpsNum; // оставшееся кол-во усиленных прыжков
    jumpForce = (increasedJumpsNum > 0) ? increasedJumpForce : defJumpForce;
    
    // устанавливаем границы и скорость наблюдения за игроком
    var mainCamera = view_get_camera(0);
    camera_set_view_border(mainCamera, camera_get_view_width(mainCamera) / 2 * 0.97,
                           camera_get_view_height(mainCamera) / 2 * 0.95);
    camera_set_view_speed(mainCamera, 360 / FPS, 600 / FPS);
}
initVars();
*/