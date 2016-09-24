# XcodePluginUpgradeCompatible-LFL


#一:2016年9.9更新,对应Xcode8.X系列下使用Alcatraz加载插件

								前言:
安装Xcode8后，打开Finder 再拷贝一份，重新命名Xcode***（随便），这样电脑二个版本共存.
一个没去掉签名的，专门上线打包(防止去除签名可能导致上线打包失败...)
一个专门敲代码即可.


###1.1 [辅助工具下载地址](https://github.com/steakknife/unsign)

###1.2  
```
git clone https://github.com/steakknife/unsign.git
cd unsign
make    
最关键就是下载后,终端执行make命令
 
```
###1.3 使用unsign为xcode移除签名

```
./unsign /Applications/Xcode.app/Contents/MacOS/Xcode

```
会在/Applications/Xcode.app/Contents/MacOS/下生成Xcode.unsigned,备份好原始的Xcode，把Xcode.unsigned重命名为Xcode，重启Xcode即可.

###1.4,再次重启Xcode,如果以前插件无法运行,请下载本工程,运行一遍即可

#二:工程文件说明

## 特别说明,此版本为解决Xcode插件处理终结版本(只要是xcode版本升级,导致不插件无法加载,都可以尝试使用此工程命令修正,觉得好用,还望给个star ,谢谢! 有群里小伙伴反馈,如果电脑的用户名曾经更改而且没有更改个人目录那么获取的路径无效,修正后为不获取用户名,而是获取用户下个人目录方式.并且打印台也打印一下你插件目录安装插件都是哪些啦.

##1  直接上图(很简单一步到位)
![](./pics/XcodePluginUpgradeCompatible-LFL1.png)
![](./pics/XcodePluginUpgradeCompatible-LFL2.png)
![](./pics/XcodePluginUpgradeCompatible-LFL3.png)
###1.1 新增加打印插件名
![](./pics/XcodePluginUpgradeCompatible-LFL4.png)

##2    中文说明

### 2.1每当Xcode升级之后，都会导致原有的Xcode插件不能使用，这是因为每个插件的Info.plist中记录了该插件兼容Xcode版本的DVTPlugInCompatibilityUUID，而每个版本的Xcode的DVTPlugInCompatibilityUUID都是不同的。如果想让原来的插件继续工作，我们就得将新版Xcode的DVTPlugInCompatibilityUUID加入到每一个插件的Info文件中，手动添加的话比较费时间还可能出错

### 2.2 如何解决和使用本命令 com + R 运行后,重启Xcode即可  tips : Xcode重启后会要求用户确认是否加载非苹果官方插件，请选择Load Bundles
 

##3   Documents in English for part 2
 
### 1.Whenever the Xcode after upgrading, will cause the original Xcode can not use the plugin, this is because each plugin Info. The records in the plist DVTPlugInCompatibilityUUID Xcode version of the plugin compatibility, and each version of Xcode DVTPlugInCompatibilityUUID is different.If you want to keep the original plug-in work, we will have the new Xcode DVTPlugInCompatibilityUUID added to each plugin Info file, manually add more time-consuming they might be wrong.

### 2.How to solve and use this commandCom + R running, restartXcode   Tips:reboot Xcode will require the user to confirm whether to Load the apple official plugin, please select the Load Bundles


# 3. 有任何问题，请及时 issues me 
 <dragonli_52171@163.com>   
 

# License

English: this library is available under the MIT license, see the LICENSE file for more information.  