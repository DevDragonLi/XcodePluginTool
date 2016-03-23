# XcodePluginUpgradeCompatible-LFL

##                  中文说明 

### 1.每当Xcode升级之后，都会导致原有的Xcode插件不能使用，这是因为每个插件的Info.plist中记录了该插件兼容Xcode版本的DVTPlugInCompatibilityUUID，而每个版本的Xcode的DVTPlugInCompatibilityUUID都是不同的。如果想让原来的插件继续工作，我们就得将新版Xcode的DVTPlugInCompatibilityUUID加入到每一个插件的Info文件中，手动添加的话比较费时间还可能出错

### 2.如何解决和使用本命令
###  com + R 运行后,重启Xcode即可  tips : Xcode重启后会要求用户确认是否加载非苹果官方插件，请选择Load Bundles
 

##                 Documents in English
 
### 1.Whenever the Xcode after upgrading, will cause the original Xcode can not use the plugin, this is because each plugin Info. The records in the plist DVTPlugInCompatibilityUUID Xcode version of the plugin compatibility, and each version of Xcode DVTPlugInCompatibilityUUID is different.If you want to keep the original plug-in work, we will have the new Xcode DVTPlugInCompatibilityUUID added to each plugin Info file, manually add more time-consuming they might be wrong.
 
 ### 2. How to solve and use this commandCom + R running, restartXcode   Tips:reboot Xcode will require the user to confirm whether to Load the apple official plugin, please select the Load Bundles

## 觉得好用,还望给个star ,谢谢呀
