#import <Cordova/CDV.h>

@interface TffCMBPlugin : CDVPlugin

- (void) pay:(CDVInvokedUrlCommand*)command;

@property(nonatomic,strong)NSString *currentCallbackId;

@end
