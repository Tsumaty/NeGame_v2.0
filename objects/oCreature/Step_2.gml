/// @desc дыхание
scalex = animcurve_channel_evaluate(breathe, breathePos) / 20.0;
scaley = scalex + image_yscale;
scalex += abs(image_xscale);
if (horsp < platfHorsp || (!isLookingRight && horsp == platfHorsp))
    scalex *= -1;

breathePos = (breathePos + breatheSpeed) % 1.0;