if (horsp == platfHorsp)
{
    sprite_index = spriteStop;
    image_speed = spriteStopSpeed;
}
else
{
    sprite_index = spriteMove;
    image_speed = abs(horsp - platfHorsp) * spriteMoveSpeed;
}
draw_sprite_ext(sprite_index, -1, x, y, scalex, scaley, 0, image_blend, image_alpha);
if (hp < maxHp)
    draw_healthbar(x - 32, bbox_top - 24, x + 31, bbox_top - 12, hp / maxHp * 100.0, c_black, c_red, c_green, 0, true, true);