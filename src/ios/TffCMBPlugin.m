#import "TffCMBPlugin.h"
#import "TffCMBViewController.h"

@implementation TffCMBPlugin

-(void)pluginInitialize{
//    CDVViewController *viewController = (CDVViewController *)self.viewController;
}

- (void)pay:(CDVInvokedUrlCommand*)command
{
    self.currentCallbackId = command.callbackId;

    TffCMBViewController *vc = [[TffCMBViewController alloc] init];
    vc.view.frame = [UIScreen mainScreen].bounds;

    NSMutableDictionary *args = [command argumentAtIndex:0];
    NSString   *getURL  = [args objectForKey:@"url"];
    NSString   *jsonRequestData  = [args objectForKey:@"jsonRequestData"];

    if ([getURL hasPrefix:@"http"] == NO) {//考虑输入的网 址中不是以http开头的情况
        getURL =[ @"http://" stringByAppendingString: getURL];
    }

    [vc loadUrl: getURL setParam: jsonRequestData];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveNotification:)
                                                 name:PAY_STATUS
                                               object:nil];

    UINavigationController *naVC = [[UINavigationController alloc]initWithRootViewController:vc];

    [self.viewController presentViewController:naVC animated:YES completion:nil];
}

#pragma mark - 接受通知的方法
- (void) receiveNotification: (NSNotification *) notification {
    NSString *textVal = notification.userInfo[@"text"];
    if([textVal isEqualToString:@"success"]){
        [self successWithCallbackID:self.currentCallbackId withMessage:textVal];
    }else{
        [self failWithCallbackID:self.currentCallbackId withMessage:textVal];
    }

    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)successWithCallbackID:(NSString *)callbackID withMessage:(NSString *)message
{
    CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:message];
    [self.commandDelegate sendPluginResult:commandResult callbackId:callbackID];
}

- (void)failWithCallbackID:(NSString *)callbackID withMessage:(NSString *)message
{
    CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:message];
    [self.commandDelegate sendPluginResult:commandResult callbackId:callbackID];
}

@end
