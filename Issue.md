<!-- author: Yan Jifu -->
<!-- content: the notes and tech document of FWV simulation-->
### 论文解决的问题
> In both layers, attitudes and positions are required by the formation geometry. A formation state estimation algorithm is designed to achieve the desired formation states from local neighborhoods. In FWVs, attitude angles are usually achieved from angular velocities, whose measurement error accumulates during integration and leads to divergence of the system.

layers 第一层是“领头者”，第二层是“跟随者”。这两层控制下的编队几何需要姿态信息和位置信息($\boldsymbol{q}_T, \boldsymbol{q}_R$)。这篇文章实际上实现了一个编队状态估计算法。这个算法旨在从局部的邻域得出期望的编队状态。  
FWV的姿态角通常都是通过角动量积分得到的，测量误差会累积，导致系统的误差。  
>  ...we explore the coupling property between the translational motion and the rotational motion of FWVs, and design a coupling-based estimation method for attitude angles. To compensate for the model uncertainty, the measurement error, and the estimation error, adaptive neural networks are developed together with the control algorithm. 

我们接下来要实现这个建模，一方面要学习FWV的相关**运动学和动力学**知识，另一方面要学会**欧拉-拉格朗日法**的模型建立。编队控制的状态估计利用了**神经网络**的相关知识。论文的特色更重要的在于发现了平动和转动的**耦合**特性。  

### 我们仿真平台框架：  
![gui](https://github.com/Yan-Jifu/gitnote-images/blob/master/images/gui.png?raw=true)  
我们需要把Drone type设置为fwv和集群的fwv  

### 论文的知识点：
1. 图论：拉普拉斯矩阵 -> 协同控制基础  
2. 一般飞行器的欧拉 - 拉格朗日动力学方程 -> 单个飞行器的动力学建模  
3. 李雅普诺夫稳定性 -> 非线性控制  
4. 实际上，为什么这么设计控制器和估计算法，是大规模参考了如下更基础、更详细的内容：["two-layer distributed formation-containment control of multiple Euler–Lagrange systems by output feedback"](https://www.sciencedirect.com/science/article/pii/S0925231220300771)，实际上在此基础上做出了不以 *output feedback* 而是 *inner loop* 的量，这更具有挑战性。  
