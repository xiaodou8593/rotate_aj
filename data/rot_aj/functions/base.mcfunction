#rot_aj:base
function math:qrot/facing/_2toxyzw
function math:qrot/_ex-uvw
tp @s ~ ~ ~
execute store result score x int run data get entity @s Pos[0] 10000
execute store result score y int run data get entity @s Pos[1] 10000
execute store result score z int run data get entity @s Pos[2] 10000