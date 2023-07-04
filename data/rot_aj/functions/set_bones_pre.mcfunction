#rot_aj:set_bones_pre
data modify storage math:io cmp set from entity @s transformation
execute store result score @s qrot_x run data get storage math:io cmp.left_rotation[0] 10000
execute store result score @s qrot_y run data get storage math:io cmp.left_rotation[1] 10000
execute store result score @s qrot_z run data get storage math:io cmp.left_rotation[2] 10000
execute store result score @s qrot_w run data get storage math:io cmp.left_rotation[3] 10000
execute store result score @s x run data get storage math:io cmp.translation[0] 10000
execute store result score @s y run data get storage math:io cmp.translation[1] 10000
execute store result score @s z run data get storage math:io cmp.translation[2] 10000