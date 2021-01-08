//
//  NSBundle+YDD.m
//  YDDPPStickerKeyboard
//
//  Created by ydd on 2021/1/7.
//

#import "NSBundle+YDD.h"

@implementation NSBundle (YDD)

/**
 获取文件所在name，默认情况下podName和bundlename相同，传一个即可
 
 @param bundleName bundle名字，就是在resource_bundles里面的名字
 @param podName pod的名字
 @return bundle
 */
+ (NSBundle *)ydd_bundleWithBundleName:(NSString *)bundleName podName:(NSString *)podName {
    if (bundleName == nil && podName == nil) {
        return nil;
    }
    if (bundleName == nil ) {
        bundleName = podName;
    }
    if (podName == nil) {
        podName = bundleName;
    }
    
    NSString *suff = @".bundle";
    if ([bundleName hasSuffix:suff]) {
        bundleName = [bundleName substringToIndex:bundleName.length - suff.length];
    }
    
    
    
    //没使用framwork的情况下
    NSURL *associateBundleURL = [[NSBundle mainBundle] URLForResource:bundleName withExtension:@"bundle"];
    //使用framework形式
    if (!associateBundleURL) {
        associateBundleURL = [[NSBundle mainBundle] URLForResource:@"Frameworks" withExtension:nil];
        associateBundleURL = [associateBundleURL URLByAppendingPathComponent:podName];
        associateBundleURL = [associateBundleURL URLByAppendingPathExtension:@"framework"];
        NSBundle *associateBunle = [NSBundle bundleWithURL:associateBundleURL];
        associateBundleURL = [associateBunle URLForResource:bundleName withExtension:@"bundle"];
    }
    //生产环境直接返回空
    return associateBundleURL ? [NSBundle bundleWithURL:associateBundleURL] : nil;
}


/// 获取framework组件bundle
/// @param pod 组件名
/// @param bundleName 组件bundle名（不带扩展名）
+ (NSBundle *)ydd_bundleWithPod:(NSString *)pod bundleName:(NSString *)bundleName {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Frameworks" ofType:nil];
    if (!path) {
        return nil;
    }
    NSString *bundlePath = [NSString stringWithFormat:@"%@/%@.framework/%@.bundle", path, pod, bundleName];
    return [NSBundle bundleWithPath:bundlePath];
}





@end
