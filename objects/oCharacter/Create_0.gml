event_inherited();

//chatMsg = []; // набор фраз для разговора
//chatDist = 170; // расстояние активации возможности разговора
if (isMoving == 0)
{
    checkPlayerPeriod *= FPS; // период проверки, рядом ли игрок
    if (checkPlayerPeriod > 0) alarm[1] = checkPlayerPeriod + int64(id) % FPS;
}
hasChatted = false; // поговорили ли с ним

canChangeDir = true; // может ли менять направление
canChangeDirTime *= FPS; // время перед восстановления возможности смены направления
if (isMoving != 0)
{
    changeDirPeriod *= FPS; // период проверки смены направления
    if (changeDirPeriod > 0) alarm[2] = changeDirPeriod;
}

jumpDelay *= FPS; // задержка перед прыжком
if (jumpDelay > 0) alarm[3] = jumpDelay;

// диалоговое облако
chatCloud = instance_create_depth(bbox_right + 4, bbox_top, depth - 10, oDialogCloud,
    {msg : chatMsg});
// кнопка диалога
buttonE = instance_create_depth(x, bbox_top - 24, depth, oButton,
    {text : "E", visible : false});