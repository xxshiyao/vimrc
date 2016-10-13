#VIM配置文件+插件完全安装方法
**注：要求python2.6以上、VIM7.4及以上**
```
mv ~/.vim ~/.vim_old
pip install flake8
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
git clone https://github.com/xxshiyao/vimrc.git ~/
cp ~/vimrc/.vimrc ~/
vim
:BundleInstall
```
#相关插件和快捷键
##不同窗口区域间移动
上：**ctrl + j**  
下：**ctrl + k**  
左：**ctrl + h**  
右：**ctrl + l**  
可以将光标跳转到不同的区域，想切换到其他标签页，则先跳转到MiniBufExplorer区域，然后按Tab键选择跳转的标签页，按回车即可  
##函数和类列表 ------ taglist.vim
打开/关闭：**,tl**  
##文件列表 ------ nerdtree.vim  
打开：**F2**  
关闭：在列表中按 **q**  
##快速打开/查找 ------ ctrlp.vim
打开最近的文件：**,f**  
打开当前目录及以下级别的文件：**,p**  
查找定位当前文件的函数：**,fu**  
##全屏快速跳转 ------ easymotion.vim  
按**ff**然后输入想跳转位置的字符  
##高亮标记 ------ mark.vim
标记/取消标记：**,hl**  
取消所有标记（将光标移动到未标记的单词上使用）：**,hh**  
##一键切换.h和.cpp ------ a.vim
快捷键：**F12** 
##函数实现/定义自动跳转 ------ ctags.vim
第一次使用先在工程目录下执行**ctags -R** 创建tags文件（只创建一次即可，如果更新了头文件或者函数需要再次执行创建tags文件）  
然后打开VIM将光标移动到函数名上按 **Ctrl + ]**  
如果想跳转回来按 **Ctrl + o**  
如果想再跳转回去按 **Ctrl + t**  
##快速注释 ------ the-nerd-commenter.vim
快捷键：**,,**  
可以选中多行按 **,,** 注释多行，在注释上执行**,,**则为取消注释  
##快速保存
快捷键：**Alt + s**  
##快速保存并退出
快捷键：**Alt + q** 
##函数/文件说明 ------ doxygentoolkit.vim
函数说明：**F11**  
文件说明：**F10**  
##在当前目录下模糊查询字符串 ------ grep.vim
快捷键：**F3**  
##python语法检查 ------ vim-flake8.vim
快捷键：**F7** 
