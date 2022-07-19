<!-- author: Yan Jifu -->
<!-- content: the notes and tech document of FWV simulation-->
# 论文：2019ICVR
仿真平台的FWV由一个躯干，两个前缘框架和两个翅膀构成。 前缘通过行程关节与躯干相连，机翼通过旋转关节与前缘相连。  
我们重点关注  
1. 坐标系构建与变换；  
2. 速度的表达和变换；
3. 动力学建模；
4. 如何积分；
5. 如何在ODE物理引擎下实现

## 动力学建模
首先分析论文用到的 FWMAV 类：【核心】  
关于每个翅膀的参数如下所示：
| Symbols | Meanings | Interpretation|
|----|----|----|
|$k$|index of wing| left(0) or right(1)|
|$R_w$|wing_length|
|$\bar{c}$|mean_chord|
|$\hat{r}_3^3$|r33|
|$\hat{r}_2^2$|r22|
|$\hat{r}_1^1$|r11|
|$\hat{r}_0^0$|r00|
|$\hat{z}_{cp}^2$|z_cp2|
|$\hat{z}_{cp}^1$|z_cp1|
|$\hat{z}_{cp}^0$|z_cp0|
|$\hat{z}_{rd}$|z_rd|
||left_shoulder_width|
||stroke_plane_offset|

# 问题
F_N 实际上已经每时每刻都有竖直向上的分量，而且没有设置重力。
但是竖直方向的加速度有正有负，在攻角达到最大值、最小值的时候施加力，
整体应当共同上升才对啊。