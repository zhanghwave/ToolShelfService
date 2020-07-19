工作区：
就是你在电脑上看到的目录，比如目录下testgit里的文件(.git隐藏目录版本库除外)。或者以后需要再新建的目录文件等等都属于工作区范畴。
版本库(Repository)：
工作区有一个隐藏目录.git,这个不属于工作区，这是版本库。其中版本库里面存了很多东西，其中最重要的就是stage(暂存区)，还有Git为我们自动创建了第一个分支master,以及指向master的一个指针HEAD。

我们前面说过使用Git提交文件到版本库有两步：
第一步：是使用 git add 把文件添加进去，实际上就是把文件添加到暂存区。
第二步：使用git commit提交更改，实际上就是把暂存区的所有内容提交到当前分支上。

git配置：
git config --global user.name "zhanghwave";
git config --global iser.email "2446734662@qq.com"

查看配置：
git config --global --list   
git config --global -l

查看帮助：
git --help
git help [command]

生成ssh.key:
ssh-keygen -t rsa -C "2446734662@qq.com"

提交代码：
git clone [url] ==> vi [file] ==> git add [file] / git add .  ==> git commit -m "first commit"  ==> git push 

查看所有分支：
git branch -a

查看当前分支：
git branch

创建并切换分支：
git checkout -b dev

切换分支：
git checkout [branch name]

commit前查看状态：
git status

查看commit记录：
git log  / git log –pretty=oneline

向前回退：
git reset --hard head^
git reset --hard head^^
git reset --hard head~100

恢复回退前的某一次commit：
git reset --hard [commit 版本号]

查找commit版本号：
git reflog

修改了文件 但没有add 发现改错了，恢复之前的(在工作区做的修改全部撤销)：
git checkout -- [file]

提交代码到远程：
      第一次: git push -u origin master     由于远程库是空的，我们第一次推送master分支时，加上了–u参数，Git不但会把本地的master分支内容推送的远程新的master分支，还会把本地的master分支和远程的master分支关联起来，在以后的推送或者拉取时就可以简化命令。

本地的分支和远程分支建立联系:
git push --set-upstream origin master
git 记住用户密码 只针对本仓库：
git config  credential.helper store

合并dev到master分支：
git checkout master
git merge dev

删除分支：
git branch -d dev
git push origin --delete dev

查看远程库信息：
git remote -v

冲突分析：
A B同时下载代码 
1. A删除文件test7并提交代码，B执行git pull， B代码里没有了test7，其他相同。
2. A增加文件test7并提交代码，B执执行git add test8 和 git pull， B代码里有test7 test8
3. B添加test8 修改test5，加一行内容，git push, A git pull ,A代码里有test8，test5增加了内容
4. A修改test5 减去一行内容，修改另一行内容，git push ，B git pull 和A的test5 相同

pull冲突：
强制先放弃本地修改后更新，再pull：
git fetch --all
git reset --hard origin/dev
git pull

代码覆盖问题：
先存；再pull；然后合并本地修改的内容和远程pull下来的内容，解决冲突，决定到底需要哪些内容；最后重新走提交流程。
git stash
git pull
git stash pop
git add .
git commit -m "resolve conflict"
git push
