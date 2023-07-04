#rot_aj:_set
execute as @e[tag=math_marker,limit=1] run function rot_aj:base
function math:qrot/_store
execute on passengers run function rot_aj:set_bones_pre
tp @s ~ ~ ~ 0.0 0.0