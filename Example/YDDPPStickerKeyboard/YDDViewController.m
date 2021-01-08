//
//  YDDViewController.m
//  YDDPPStickerKeyboard
//
//  Created by yuedongdong521 on 01/07/2021.
//  Copyright (c) 2021 yuedongdong521. All rights reserved.
//

#import "YDDViewController.h"
#import "PPStickerInputView.h"

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define IS_iPhoneX \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0 && IS_IPHONE;\
}\
(isPhoneX);})

@interface YDDViewController ()<PPStickerInputViewDelegate>

@property (nonatomic, strong) PPStickerInputView *inputView;

@end

@implementation YDDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.inputView];
    
    CGFloat height = [self.inputView heightThatFits];
    CGFloat minY = CGRectGetHeight(self.view.bounds) - height - (IS_iPhoneX ? 34 : 0);
    self.inputView.frame = CGRectMake(0, minY, CGRectGetWidth(self.view.bounds), height);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (PPStickerInputView *)inputView
{
    if (!_inputView) {
        _inputView = [[PPStickerInputView alloc] init];
        _inputView.delegate = self;
    }
    return _inputView;
}

#pragma mark - PPStickerInputViewDelegate

- (void)stickerInputViewDidClickSendButton:(PPStickerInputView *)inputView
{
    NSString *plainText = inputView.plainText;
    if (!plainText.length) {
        return;
    }
    
    NSLog(@"plainText : %@", plainText);
   
    [inputView clearText];
    
}



@end
