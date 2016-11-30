//
//  TffCMBViewController.h
//  途风旅游
//
//  Created by TFF on 2016/11/10.
//
//

#import <UIKit/UIKit.h>


@interface TffCMBViewController : UIViewController
- (void)loadUrl:(NSString*)outerURL setParam:(NSString*)loadParam;
- (void)loadURLRequest:(NSURLRequest*)requesturl;
@end
