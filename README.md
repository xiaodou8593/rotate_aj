# rotate_aj
 rotate animated java

## 前置数据包
要使用rot_aj，您首先需要安装小豆数学库2.0.1或以上版本

链接：https://github.com/xiaodou8593/math2.0/

手动运行数学库初始化：function math:_init

## 修改AJ数据包
以test数据包为例，首先打开aj数据包路径中的以下函数，进行相应修改：

1.打开`ajDP\data\zzz_test_internal\functions\summon\as_root.mcfunction`

最后面追加一行命令：`function rot_aj:_set`

------

2.打开`ajDP\data\zzz_test_internal\functions\tick_as_root.mcfunction`

第4行命令`execute at @s on passengers run tp @s ~ ~ ~ ~ ~`修改为：`function rot_aj:_pre`

最后面追加一行命令：`function rot_aj:_upd`

------

3.以test动画为例，打开`ajDP\data\zzz_test_internal\functions\animations\test\play_as_root.mcfunction`

最前面插入一行命令：`function rot_aj:_pre`

最后面追加一行命令：`function rot_aj:_upd`

------

4.以test动画为例，打开`ajDP\data\zzz_test_internal\functions\animations\test\stop_as_root.mcfunction`

最前面插入一行命令：`function rot_aj:_pre`

最后面追加一行命令：`function rot_aj:_upd`

## 对AJ动画进行旋转

### 实例1：用世界坐标指定旋转轴
```mcfunction
#func:example
#设置旋转的初始参数
#以AJ根实体为执行者，执行以下命令：
function math:qrot/_get
execute as @e[tag=math_marker,limit=1] run function func:example_next
function math:qrot/_store

#func:example_next
#指定当前姿态作为旋转的初始姿态
function math:qrot/pose/_xyzwto
#这里指定了绕z轴旋转
scoreboard players set qrot_u0 int 0
scoreboard players set qrot_u1 int 0
scoreboard players set qrot_u2 int 10000
function math:qrot/axis/_uvecto
#初始化旋转角度为0
scoreboard players set qrot_alpha int 0

#func:example_tick
#以AJ根实体为执行者，高频运行以下命令：
function math:qrot/_get
#倍率1w，由于四元数公式中的θ/2，这里指定的角速度是9度/tick
scoreboard players add qrot_alpha int 45000
execute as @e[tag=math_marker,limit=1] run function math:qrot/_xyzw
#扩展本地坐标系属性
function math:qrot/_ex-uvw
function math:qrot/_store
```

### 实例2：用局部坐标指定旋转轴
```mcfunction
#func:example
#设置旋转的初始参数
#以AJ根实体为执行者，执行以下命令：
function math:qrot/_get
execute as @e[tag=math_marker,limit=1] run function func:example_next
function math:qrot/_store

#func:example_next
function math:qrot/pose/_xyzwto
#这里指定了绕前轴旋转，也就是横滚
scoreboard players set u int 0
scoreboard players set v int 0
scoreboard players set w int 10000
function math:qrot/axis/_uvwto
scoreboard players set qrot_alpha int 0

#func:example_tick
#以AJ根实体为执行者，高频运行以下命令：
function math:qrot/_get
scoreboard players add qrot_alpha int 45000
execute as @e[tag=math_marker,limit=1] run function math:qrot/_xyzw
function math:qrot/_ex-uvw
function math:qrot/_store
```

### 实例3：用原版实体Rotation的偏航-俯仰模式指定姿态
```mcfunction
#func:example_tick
#以AJ根实体为执行者，高频运行以下命令：
function math:qrot/_get
execute at @s as @e[tag=math_marker,limit=1] run function math:qrot/facing/_2toxyzw
function math:qrot/_ex-uvw
function math:qrot/_store
```

### 实例4：改变姿态时拓展物体的本地坐标系属性，并在其它地方应用
```mcfunction
#func:example_tick
#以AJ根实体为执行者，高频运行以下命令：
function math:qrot/_get
scoreboard players add qrot_alpha int 45000
execute as @e[tag=math_marker,limit=1] run function math:qrot/_xyzw
#扩展函数，扩展局部坐标系属性
function math:qrot/_ex-uvw
function math:qrot/_store

#func:example_use
#这是一个使用局部坐标系模块的例子
#以AJ根实体为执行者，运行以下命令
function math:uvw/_get
#倍率1w，这里是获得前方5格的位置
scoreboard players set u int 0
scoreboard players set v int 0
scoreboard players set w int 50000
execute as @e[tag=math_marker,limit=1] run function math:uvw/_topos
#在前方5格的位置生成一块石头
execute at @e[tag=math_marker,limit=1] run setblock ~ ~ ~ stone
#另外需要注意的是，对根实体进行移动时，需要同步它的坐标到记分板{<@s,x>,<@s,y>,<@s,z>}
```