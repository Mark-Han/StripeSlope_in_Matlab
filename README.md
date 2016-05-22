# Calculation of Slope of Stripes within Image Files, Using Matlab 2014b

`Many thanks to my friends who help me write the original code`

>
This program is intended to calculate the slope of stripes within a true-color gif image file, frame by frame.

The stripes are, IDEALLY, straight and parallel to each other, so we only have to pick out one stripe, and then measure it, that's it. But in fact, stripes  in our images are corrugate(rippled), but still parallel. 

You can also use three or more stripes to obtain an averaged value, however, It's unnecessary. `Note`  if you want to use more stripes, Do not attempt to increase the lines for average, 3 lines are sufficient, and in a certain condition, lines can not be formed completely, in  that case, the corresponding slope is 0, therefore, an averaged value is not desired.

