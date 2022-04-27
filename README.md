# Graphml-To-Mininet

本项目是一个自动将.graphml格式的网络拓扑图转化为Mininet可运行拓扑脚本的程序，生成的拓扑代码风格与Mininet的可视化工具Miniedit的自动导出选项相同。

本代码参考自：

https://github.com/uniba-ktr/assessing-mininet/blob/master/parser/GraphML-Topo-to-Mininet-Network-Generator.py

考虑版权保护问题，本代码中保留了所有原作者的注释，新增修改部分的注释。

## 使用方法

### 基本用法

#### 仅单次操作有效

python GraphML-to-Mininet.py -参数 参数值

#### 批量操作

./gentopo.sh

此操作会将当前文件夹下所有的.graphml格式文件全转换为Mininet拓扑，并存放在当前目录的/mini-topologies下。

### 参数输入（仅对单次操作有效）

-f，-file：           输入文件的名称，包含后缀的.graphml，必须输入该参数

-o，-output：         输出文件的名称，如不输入，则自动命名为“输入文件名” + “-Mininet-Topo.py”

-b，-bw，-bandwidth   当部分拓扑的链路未提供带宽数据时，使用默认带宽，如不输入，默认为128Mbps

-c，-controller       控制器的IP地址，如不输入，默认为127.0.0.1

-p，-port             控制器与Mininet连接的端口号，如不输入，默认为6633

Reference:

https://github.com/uniba-ktr/assessing-mininet/blob/master/parser/GraphML-Topo-to-Mininet-Network-Generator.py

Reference code for this project is at the above URL. In this project, all of the code annotation from the original author is reserved.
