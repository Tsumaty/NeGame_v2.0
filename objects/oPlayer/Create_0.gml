increasedJumpsNum = 0;
event_inherited();
initVars();
defJumpForce = jumpForce; // стандартная сила прыжка
increasedJumpForce = 2 * defJumpForce; // увеличенная сила прыжка
increasedJumpsNumstart = increasedJumpsNum;
isChatting = false;
chatMsgSet =
[
    ["Действительно,\nпочему я молчу?", "Правда и сказать-то\nмне нечего"]
];
deathsNumLevelJumpTrain = 0; // количество смертей на уровне обучения прыжкам
depth -= 5;

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
var spriteCenterX = getCenterX();
var spriteCenterY = getCenterY();
spriteCenter = instance_create_depth(spriteCenterX, spriteCenterY, depth, oBlank);
spriteCenter.persistent = true;

initCamera();

isTakingDamage = false; // получает ли урон
blinkingPeriod *= FPS; // период мерцания при получении урона

playerStartX = x;
playerStartY = y;
playerStartHp = hp;