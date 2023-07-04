#rot_aj:test/axis
function math:qrot/_get
execute as @e[tag=math_marker,limit=1] run function math:qrot/pose/_xyzwto
execute as @e[tag=math_marker,limit=1] run function math:qrot/axis/_facingto
scoreboard players set @s qrot_alpha 0
function math:qrot/_store