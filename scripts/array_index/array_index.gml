function array_index(arr, element)
{
    for (var i = 0; i < array_length(arr); ++i)
    {
        if (arr[i] == element) return i;
    }
    return -1;
}