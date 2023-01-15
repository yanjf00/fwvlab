# fwvlab
## 如何进行开发？
目前我们共同开发的项目在远端的仓库为<https://github.com/Yan-Jifu/fwvlab.git>，里面有两个分支，master & develop。  
请开发者在开发自己的部分时，基于develop分支进行。用法是：
```
git clone https://github.com/Yan-Jifu/fwvlab.git
git checkout develop
# 如果 xx 要进行对应功能开发，请继续
git checkout -b feature-xx develop
# 经过一系列本地的add以及commit之后
git checkout develop
git pull origin develop  # 上述两个步骤验证远端的develop分支是否有更新
git checkout feature-xx
git rebase develop  # 上述两个步骤验证合并时是否有冲突
git checkout develop
git merge --no-ff feature-xx
git push origin develop
```

1. 如果遇到远端develop分支更新，则注意可能会有合并上的冲突，这时候应当消除冲突。特别是两个branch操作1个文件时。这时应当进行编辑，把冲突部分删去再重新提交。

## 使用说明
安装不低于2021b的matlab版本，需配套Simulink、simscape、simscape multibody和control system toolbox。

### 个体的镇定和轨迹跟踪
直接运行`fwv_modified.slx`即可。
### 群体的轨迹跟踪
直接运行`swarm.m`即可。

## 实时贡献

- 2022-6-15：Defly Book chapter 5: Introduction to Fixed and Flapping
Wing Aerodynamics --> COMPLETE
- 2022-7-2~2022-7-19：基于论文的刚体模型和空气动力学搭建完毕（暂时没有变压心和rotation torque, damping torque，只给了quasi-state 的力），给予50Hz的正弦信号在stroke joint上。扑翼飞起来了（无重力下）而且歪斜、不稳定。
- 2022-7-20~2022-7-26：更改了部分机械参数设计（质量、翅膀厚度等），更改了关节参数和部分空气动力学修正（压心时变、Mrd加入、坐标系和一些坐标正负号修正），最终可以垂直起飞。
- 2022-7-28~2022-7-31：控制器加入，位置镇定。
- 2022-8-1~2022-8-8：X方向镇定出现大问题，不如滑翔（类似蝴蝶）
- 2022-8-9~2022-8-25：全姿态+镇定完成，轨迹规划初见成效。
- 2022-8-26~2022-9-20：加了周期平均策略，实现了俯仰控制的稳定性。
- 2020-9-21~2022-10-10：加入编队控制算法。
- 2023-1-1~2023-1-15：加入朝向控制、修改机型和旋转关节劲度系数。

## 开发日志
- v0.1：生成了简单的 FWV的躯干和前缘框架，通过 freecad 搭建了躯干的模型，导入到simscape中，加上关节和框架以及 tf 变换。成功建出了一个骨架模型。
- v0.2：在空气动力学未知的情况（即没有加翅膀）下，首先让其以较小的高度平稳落在起降平台上。针对 simscape multibody 穿模的问题，使用了 Simscape Multibody Contact Forces Library，简化为下落角点单独形成的球体与平面碰撞问题，将ode45更改为刚性问题更简单的 ode15s，大大减少了运行时间。
- v0.3：弃用了 Simscape Multibody Contact Forces Library，利用焊接关节的mode特性，起始位置让 FWV 固连在基坐标系上，然后当上升力超过本身重力之后，焊接关节解锁； FWV坠落至地面后仿真结束。
- v0.4：推翻以上焊接关节，优化排布，passive rotation: 让空气力施加在翅膀上带动翅膀的旋转；以及达到最大旋转角/最小旋转角后整体的抬升。但好像实现不佳。
- v0.5：(1m, 1m, 1m)成功镇定版本，没有问题。