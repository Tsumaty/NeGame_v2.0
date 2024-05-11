/// @desc функция перевода числа из одного диапазона в другой
function mapValue(val, curLower, curUpper, desLower, desUpper)
{
    return (((val - curLower) / (curUpper - curLower)) * (desUpper - desLower)) + desLower;
}