#import "TffCMBPlugin.h"
#import "TffCMBViewController.h"

@implementation TffCMBPlugin

//-(void)pluginInitialize{
//
//}

- (void)test:(CDVInvokedUrlCommand*)command
{
    TffCMBViewController *vc = [[TffCMBViewController alloc] init];
    vc.view.frame = [UIScreen mainScreen].bounds;
    NSString *getURL = @"http://payment.jack.toursforfun.com/forward/cmb";
    if ([getURL hasPrefix:@"http"] == NO) {//考虑输入的网 址中不是以http开头的情况
        getURL =[ @"http://" stringByAppendingString:getURL];
    }
    [vc loadUrl:getURL];
    
    UINavigationController *naVC = [[UINavigationController alloc]initWithRootViewController:vc];
    
    [self.viewController presentViewController:naVC animated:YES completion:^{
        NSLog(@"模态成功");
    }];
}

@end
