
//  XcodePluginUpgradeCompatible-LFL.m
//  Created by DragonLi on 15/12/18.
//  Copyright © 2015年 DragonLi. All rights reserved.

#define LFLog(...) NSLog(__VA_ARGS__)

/**
 *   @author DragonLi
 *   如何解决和使用本命令
 *   com + R 运行后,关闭Xcode再重启Xcode即可.
 *   tips : Xcode重启后会要求用户确认是否加载非苹果官方插件，请选择Load Bundles
 */
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {

        // 1.1 获取当前电脑Users下所有文件名
        NSMutableArray *users = [NSMutableArray arrayWithCapacity:1];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *path = @"/Users";
        NSArray *tempArray = [fileManager contentsOfDirectoryAtPath:path error:nil];
        
        for (NSString* fileName in tempArray) {
            BOOL flag = YES;
            NSString* fullPath = [path stringByAppendingPathComponent:fileName];
            if ([fileManager fileExistsAtPath:fullPath isDirectory:&flag]) {
                if (!flag) {
                    [users addObject:fullPath];
                }
            }
        }
        //1.2 遍历 得到 目录名
        NSString *userCatalogueNameReally = [[NSString alloc]init];
        for (NSString *userCatalogueName in tempArray) {
            
            if ([userCatalogueName isEqualToString:@".localized"] ||
                [userCatalogueName isEqualToString:@"Deleted Users"]||
                [userCatalogueName isEqualToString:@"Guest"]||
                [userCatalogueName isEqualToString:@"Shared"]) {
            }else {
                userCatalogueNameReally = userCatalogueName;
                LFLog(@"当前用户%@",userCatalogueNameReally);
            }
        }
        
        //2.1 -------------- 获取 Xcode 插件路径名---------------///
        NSString *pluginPath = [NSString stringWithFormat:@"/Users/%@/Library/Application Support/Developer/Shared/Xcode/Plug-ins", userCatalogueNameReally];
        
        //2.2.1 加载本地的Info.plist.
        NSDictionary *xcodeInfoDictionary = [[NSDictionary alloc] initWithContentsOfFile:@"/Applications/Xcode.app/Contents/Info.plist"];
        
        //2.2.2 获取 Xcode  UUID
        NSString *xcodeUUID = xcodeInfoDictionary[@"DVTPlugInCompatibilityUUID"];
        NSError *error;
        NSArray *pathArray = [fileManager contentsOfDirectoryAtPath:pluginPath error:&error];
//        3. 遍历处理插件的UUID
        if (!error) {
            for (NSString *xcpluginFileName  in pathArray) {
                if ([xcpluginFileName hasSuffix:@".xcplugin"]) {
                    LFLog(@"你电脑之前安装了%@这个插件",[xcpluginFileName componentsSeparatedByString:@".xcplugin"].firstObject);
                    NSString *pluginPlistPath = [NSString stringWithFormat:@"%@/%@/Contents/Info.plist", pluginPath, xcpluginFileName];
                    NSMutableDictionary *pluginInfoDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:pluginPlistPath];
                    NSMutableArray *supportedUUIDs = [NSMutableArray arrayWithArray:pluginInfoDictionary[@"DVTPlugInCompatibilityUUIDs"]];
                    
                    if (![supportedUUIDs containsObject:xcodeUUID]) {
                        [supportedUUIDs addObject:xcodeUUID];
                        [pluginInfoDictionary setValue:supportedUUIDs forKey:@"DVTPlugInCompatibilityUUIDs"];
                        [pluginInfoDictionary writeToFile:pluginPlistPath atomically:YES];
                    }
                }
            }
            LFLog(@"Processed, please restart xcode");
        }
        else{
            LFLog(@"Wrong ,Please try again!");
        }
        return 0;
    }
}