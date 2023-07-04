#rot_aj:set_bones
execute store result score @s qrot_x run data get entity @s transformation.left_rotation[0] 10000
execute store result score @s qrot_y run data get entity @s transformation.left_rotation[1] 10000
execute store result score @s qrot_z run data get entity @s transformation.left_rotation[2] 10000
execute store result score @s qrot_w run data get entity @s transformation.left_rotation[3] 10000
execute store result score @s x run data get entity @s transformation.translation[0] 10000
execute store result score @s y run data get entity @s transformation.translation[1] 10000
execute store result score @s z run data get entity @s transformation.translation[2] 10000