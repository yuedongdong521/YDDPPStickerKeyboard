//
//  NSBundle+YDD.h
//  YDDPPStickerKeyboard
//
//  Created by ydd on 2021/1/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (YDD)


/**
 获取文件所在name，默认情况下podName和bundlename相同，传一个即可
 
 @param bundleName bundle名字，就是在resource_bundles里面的名字
 @param podName pod的名字
 @return bundle
 */
+ (NSBundle *)ydd_bundleWithBundleName:(NSString *)bundleName podName:(NSString *)podName;


+ (NSBundle *)ydd_bundleWithPod:(NSString *)pod bundleName:(NSString *)bundleName;


@end

NS_ASSUME_NONNULL_END
