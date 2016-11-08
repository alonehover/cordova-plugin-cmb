#import "TffCMBPlugin.h"
#import <Cordova/CDV.h>

@implementation TffCMBPlugin
- (void)test:(CDVInvokedUrlCommand*)command
{
    UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"标题" 
                                                    message:@"你好世界！" 
                                                    delegate:self 
                                                    cancelButtonTitle:@"取消" 
                                                    otherButtonTitles:@"确定", nil];
    [alertview show];
}

@end