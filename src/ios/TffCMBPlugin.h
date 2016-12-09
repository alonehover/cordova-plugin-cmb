#import <Cordova/CDV.h>

@interface TffCMBPlugin : CDVPlugin

- (void) test:(CDVInvokedUrlCommand*)command;

@property(nonatomic,strong)NSString *currentCallbackId;

@end
