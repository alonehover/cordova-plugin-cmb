#import "TffCMBPlugin.h"
#import "TffCMBViewController.h"

@implementation TffCMBPlugin

-(void)pluginInitialize{
    CDVViewController *viewController = (CDVViewController *)self.viewController;
    self.url = [viewController.settings objectForKey:@"url"];
    self.jsonRequestData = [viewController.settings objectForKey:@"jsonRequestData"];
}

- (void)test:(CDVInvokedUrlCommand*)command
{
    TffCMBViewController *vc = [[TffCMBViewController alloc] init];
    vc.view.frame = [UIScreen mainScreen].bounds;
    // NSString *getURL = @"http://payment.jack.toursforfun.com/forward/cmb";
    NSString *getURL = self.url;
    if ([getURL hasPrefix:@"http"] == NO) {//考虑输入的网 址中不是以http开头的情况
        getURL =[ @"http://" stringByAppendingString: getURL];
    }
    [vc loadUrl: getURL setParam: self.jsonRequestData];
    
    UINavigationController *naVC = [[UINavigationController alloc]initWithRootViewController:vc];

    [self.viewController presentViewController:naVC animated:YES completion:^{
        NSLog(@"模态成功");
    }];
}

@end
