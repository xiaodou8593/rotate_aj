#rot_aj:_upd
function math:qrot/_get
execute as @e[tag=math_marker,limit=1] run function math:qrot/_store
execute on passengers run function rot_aj:check_bones