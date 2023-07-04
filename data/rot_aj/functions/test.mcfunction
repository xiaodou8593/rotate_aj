#rot_aj:test
function math:qrot/_get
execute as @e[tag=math_marker,limit=1] run function rot_aj:test/dsp

scoreboard players add qrot_alpha int 15000
execute as @e[tag=math_marker,limit=1] run function math:qrot/_xyzw
function math:qrot/_ex-uvw
function math:qrot/_store