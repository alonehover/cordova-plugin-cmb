#import "TffCMBPlugin.h"
#import "TffCMBViewController.h"

@implementation TffCMBPlugin

-(void)pluginInitialize{
//    CDVViewController *viewController = (CDVViewController *)self.viewController;
}

- (void)test:(CDVInvokedUrlCommand*)command
{
    TffCMBViewController *vc = [[TffCMBViewController alloc] init];
    vc.view.frame = [UIScreen mainScreen].bounds;
    
    NSMutableDictionary *args = [command argumentAtIndex:0];
    NSString   *getURL  = [args objectForKey:@"url"];
    NSString   *jsonRequestData  = [args objectForKey:@"jsonRequestData"];
    if ([getURL hasPrefix:@"http"] == NO) {//考虑输入的网 址中不是以http开头的情况
        getURL =[ @"http://" stringByAppendingString: getURL];
    }
    [vc loadUrl: getURL setParam: jsonRequestData];
    
    UINavigationController *naVC = [[UINavigationController alloc]initWithRootViewController:vc];

    [self.viewController presentViewController:naVC animated:YES completion:^{
        NSLog(@"模态成功");
    }];
}

@end
