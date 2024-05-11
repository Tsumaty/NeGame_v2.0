// облако
draw_sprite_ext(sprite_index, -1, x, y, scalex, scaley, 0, c_white, image_alpha);
// надпись
if (msgVisible)
{
    var msgx = (isLookingRight) ? bbox_left + (bbox_right - bbox_left) / 2 : 
        bbox_left - (bbox_right - bbox_left) / 2 + 32;
    var msgy = bbox_top + (bbox_bottom - bbox_top) / 2;
    draw_set_font(fChat);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_black);
    draw_text_transformed(msgx, msgy, msg[msgNumber/* % array_length(msg)*/], msgScalex, msgScaley, 0);
}