//
//  UIImage+YDDPod.m
//  YDDPPStickerKeyboard
//
//  Created by ydd on 2021/1/7.
//

#import "UIImage+YDDPod.h"
#import "NSBundle+YDD.h"

@implementation UIImage (YDDPod)

+ (UIImage *)ydd_imageWithName:(NSString *)name
{
    NSBundle *bundle = [NSBundle ydd_bundleWithBundleName:@"YDDPPStickerKeyboard.bundle" podName:@"YDDPPStickerKeyboard"];
    UIImage *image = [UIImage imageNamed:name
                                inBundle:bundle
           compatibleWithTraitCollection:nil];
    return image;
}

+ (UIImage *)ydd_emojiImageWithName:(NSString *)name
{
    NSBundle *bundle = [NSBundle ydd_bundleWithBundleName:@"YDDPPStickerKeyboard" podName:@"YDDPPStickerKeyboard"];
    NSString *stickerPath = [bundle pathForResource:@"Sticker" ofType:@"bundle"];
    NSBundle *emojiBundle = [NSBundle bundleWithPath:stickerPath];
    
    
    UIImage *image = [UIImage imageNamed:name
                                inBundle:emojiBundle
           compatibleWithTraitCollection:nil];
    return image;
}


@end
