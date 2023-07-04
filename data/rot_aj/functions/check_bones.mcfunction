#rot_aj:check_bones
data modify storage math:io cmp set from entity @s transformation
execute unless data storage math:io cmp{left_rotation:[0.0f,0.0f,0.0f,0.0f]} run function rot_aj:set_bones

scoreboard players operation qrot_x int = @s qrot_x
scoreboard players operation qrot_y int = @s qrot_y
scoreboard players operation qrot_z int = @s qrot_z
scoreboard players operation qrot_w int = @s qrot_w
execute as @e[tag=math_marker,limit=1] run function math:qrot/_mult
execute store result storage math:io cmp.left_rotation[0] float 0.0001 run scoreboard players get qrot_x int
execute store result storage math:io cmp.left_rotation[1] float 0.0001 run scoreboard players get qrot_y int
execute store result storage math:io cmp.left_rotation[2] float 0.0001 run scoreboard players get qrot_z int
execute store result storage math:io cmp.left_rotation[3] float 0.0001 run scoreboard players get qrot_w int
scoreboard players operation u int = @s x
scoreboard players operation v int = @s y
scoreboard players operation w int = @s z
function math:uvw/_tofvec
execute store result storage math:io cmp.translation[0] float 0.0001 run scoreboard players get 3vec_x int
execute store result storage math:io cmp.translation[1] float 0.0001 run scoreboard players get 3vec_y int
execute store result storage math:io cmp.translation[2] float 0.0001 run scoreboard players get 3vec_z int

data modify entity @s interpolation_duration set value 1
data modify entity @s transformation set from storage math:io cmp
execute store success score temp int run data modify storage math:io cmp set from storage math:io stemp[0]
execute if score temp int matches 1 run data modify entity @s start_interpolation set value 0

data remove storage math:io stemp[0]