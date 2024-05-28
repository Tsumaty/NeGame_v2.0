image_speed = 0;
with (activator)
{
    if (id == inst_activ_level2) unlocked = level2Open;
    other.image_index = (unlocked) ? 1 : 0;
}