/// @desc мерцание спрайта
alarm[1] = blinkingPeriod;
if (image_blend == startColor)
{
    image_alpha = 1;
    image_blend = c_red;
}
else
{
    image_alpha = 0.5;
    image_blend = startColor;
}