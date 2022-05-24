# Graphml-To-Mininet

本项目是一个自动将.graphml格式的网络拓扑图转化为Mininet可运行拓扑脚本的程序，生成的拓扑代码风格与Mininet的可视化工具Miniedit的自动导出选项相同。

本代码参考自：

https://github.com/uniba-ktr/assessing-mininet/blob/master/parser/GraphML-Topo-to-Mininet-Network-Generator.py

考虑版权保护问题，本代码中保留了所有原作者的注释，新增修改部分的注释。

## 使用方法

### 基本用法

采用topology zoo的数据集：http://www.topology-zoo.org/dataset.html

点击：Download current dataset as a zip archive

或使用本项目中的备用数据集

解压可得graphml格式的拓扑图，用于转换，以便在Mininet中仿真

如下显示了本程序的两种用法：

#### 仅单次操作有效

python GraphML-to-Mininet.py -参数 参数值

#### 批量操作

./gen_topo.sh

此操作会将当前文件夹下所有的.graphml格式文件全转换为Mininet拓扑，并存放在当前目录的/mini-topologies下。
该脚本生成的拓扑默认开启STP协议，可删除gen_topo.sh中的“--stp”选项，以生成不启用STP协议的拓扑。

#### 参数输入（仅对单次操作有效）

-f，--file：输入文件的名称，包含后缀的.graphml，必须输入该参数

-o，--output：输出文件的名称，如不输入，则自动命名为“输入文件名” + “-Mininet-Topo.py”

-b，--bw，--bandwidth：当部分拓扑的链路未提供带宽数据时，使用默认带宽，如不输入，默认为128Mbps

-c，--controller：控制器的IP地址，如不输入，默认为127.0.0.1

-p，--port：控制器与Mininet连接的端口号，如不输入，默认为6633

-s，--stp：该选项无附带参数，用于在OpenvSwitch上启用生成树协议（STP）以解决环路问题，运行带STP的Mininet拓扑时，拓扑代码将提示需要额外时间以让控制器学习生成树

## 改进效果

目前本代码能直接通过（生成）topology zoo中的所有261个拓扑，而本代码所参考的项目（上方链接）存在一些bug，经测试仅能通过198个拓扑。

## 主要改进（相对于参考项目）

1、修复了拓扑节点重名、名称不存在或名字为None的情况，若解析完节点名后发现存在以上三种情况，则所有节点均改用标准命名（s1，s2，s3......）。

2、修复了极少数情况下节点名称不符合python命名规则或与python关键字相同的情况，此时所有节点均改用标准命名。

3、修复了拓扑节点可能存在的经纬度缺失问题，缺失的经纬度将等于该拓扑中所有信息完整节点经纬度的平均值；若所有节点经纬度均缺失，则链路的延迟在0ms到5ms中随机。

4、修复了无法读取链路带宽的问题，本项目支持读取并设置.graphml拓扑中的带宽信息，若链路节点的带宽为一个范围，则带宽被设为范围最大值和最小值的平均数。

5、修改了代码的样式，现在生成的拓扑脚本与Miniedit导出的风格一致。

## 项目更新

2022-05-11：增加了对于拓扑环路的STP协议支持

# Graphml-To-Mininet (EN)

This program converts the .graphml format topology to Mininet executable python topology scripts, mainly referd to:

https://github.com/uniba-ktr/assessing-mininet/blob/master/parser/GraphML-Topo-to-Mininet-Network-Generator.py

Reference code for this project is at the above URL. In this project, all of the code annotation from the original author is reserved.

## Usage

### Basic

Use topology zoo dataset: http://www.topology-zoo.org/dataset.html

Check: Download current dataset as a zip archive

Or: Use the alternate dataset in this program

Unzip to obtain the topology in .graphml format, then use this program to convert it to Mininet topology scripts.

Here shows two ways to use this program.

#### Single Operation

python GraphML-to-Mininet.py -argument value

#### Multiple Operations

./gen_topo.sh

This will convert all .graphml files in the same folder to Mininet topologies. They will be put in the /mini-topologies folder under the current directory.
The generated topologies by this shell script will support STP by default. To generate STP-disabled topologies, you can modify and Remove the "--stp" option in  the script "gen_topo.sh".

#### Arguments (Only for single operation)

-f, --file: Input file name including ".graphml". This argument is required.

-o, --output: Output file name, if not exist, the output file will be named as "{$Input_File_Name}" + "-Mininet-Topo.py"

-b, --bw, --bandwidth: Use this to set the bandwidth if some of the link bandwidth data is missing in .graphml, default 128Mbps.

-c, --controller: Remote SDN controller IP address, default 127.0.0.1.

-p, --port: The port number for controller to communicate with Mininet, default 6633.

-s, --stp: Enable Spanning Tree Protocol (STP) to OpenvSwitch for loops. When running topologire, the STP enabled scripts will inform that the controller needs extra time to generate spanning trees. No following arguments is required for this option.

## Performance Improvements

This code can convert and generate all 261 topologies in topology zoo dataset correctly, while the referd program (In the above link) has some bugs, and it is tested to only generate 198/261 topologies successfully.

## Main Improvements

1. Repair the error names of the nodes, includiing redundant names, non-exist names and "None" names. If there is such a situation, then use standard node names instead (s1，s2，s3......).

2. Repair a few situations when node names do not meet the python naming rules or has the same name as a python keyword, then use standard node names instead.

3. Repair the problem of latitude and longitude data missing. The missing latitude and longitude will be set as the average of all the other node latitude and longitude data in the same topology. If all of the latitude and longitude is missing, then the link delay ranges from 0ms to 5ms randomly.

4. Support the bandwidth setting from original topology data. If a link bandwidth ranges in an interval, then the bandwidth is the average of the mininum and the maxinum of the interval.

5. Improved the code style to be consistant with the Mininet - Miniedit - export L2 scripts option.

## Project Updates

2022-05-11: Update spanning tree protocol supports for topology loops.
