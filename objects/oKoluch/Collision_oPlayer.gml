if (bbox_top < other.yprevious)
{
    with (other)
    {
        if (!isTakingDamage)
        {
            hp -= other.damage;
            deathNum = playSound(deathName, deathNum, deathMaxNum);
            if (hp <= 0.0)
            {
                killPlayer();
            }
            isTakingDamage = true;
            image_blend = c_red;
            alarm[1] = blinkingPeriod;
            alarm[2] = other.damageDuration;
        }
    }
}
else
{
    hp -= other.damage;
    if (hp <= 0.0)
    {
        if (array_index(killedKoluchs, id) == -1)
            array_push(killedKoluchs, id);
        instance_destroy();
    }
    with (other)
    {
        versp = -jumpForce;
        bounceNum = playSound(bounceName, bounceNum, bounceMaxNum);
    }
}