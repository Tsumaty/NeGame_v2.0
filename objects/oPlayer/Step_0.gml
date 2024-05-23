/// @desc управление

// обновление позиции центра
spriteCenter.x = getCenterX();
spriteCenter.y = getCenterY();

if (!isChatting)
{
    var dPressed = (keyboard_check(BTN_D) || keyboard_check(vk_right)); // кл. вправо
    var aPressed = (keyboard_check(BTN_A) || keyboard_check(vk_left)); // кл. влево
    var wPressed = (keyboard_check_pressed(BTN_W) || keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_space)); // кл. вверх
    
    if (dPressed)
    {
        moveRight = true;
        if (!aPressed)
            isLookingRight = true;
    }
    if (aPressed)
    {
        moveLeft = true;
        if (!dPressed)
            isLookingRight = false;
    }
    if (wPressed)
    {
        doJump = true;
        alarm[0] = FPS / 3; // буфер прыжка
    }
}

event_inherited();

// проверяем, действительно ли произошёл прыжок
if (jumped)// && isSilent(jumpName))
{
    // с вер-ю 2/9 воспроизводится звук
    var rand = random(9);
    if (rand >= 7)
        jumpNum = playSound(jumpName, jumpNum, jumpMaxNum);
    
    if (jumpForce != defJumpForce) // если сила прыжка была изменена
    {
        // уменьшаем кол-во оставшихся усиленных прыжков
        if (--increasedJumpsNum <= 0) // и если оно достигает 0
        {
            jumpForce = defJumpForce; // сбрасываем силу прыжка
        }
    }
}