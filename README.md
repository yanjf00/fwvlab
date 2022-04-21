# fwvlab
### 如何进行开发？
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
