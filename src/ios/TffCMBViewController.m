//
//  TffCMBViewController.m
//  途风旅游
//
//  Created by TFF on 2016/11/10.
//
//
#import "TffCMBPlugin.h"
#import "TffCMBViewController.h"
#import <cmbkeyboard/CMBWebKeyboard.h>
#import <cmbkeyboard/NSString+Additions.h>

@interface TffCMBViewController () <UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation TffCMBViewController

    NSMutableURLRequest *_requestUrl;

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    
    return self;
}

- (BOOL)needBackItem
{
    return YES;
}

- (void)loadUrl:(NSString *)outerURL {
    
    NSURL *url = [NSURL URLWithString: outerURL];
    NSString *body = [NSString stringWithFormat: @"trans_id=%@&user_id=%@", @"20001109140755406098",@"32"];
    _requestUrl = [NSMutableURLRequest requestWithURL:url];
    [_requestUrl setHTTPMethod: @"POST"];
    [_requestUrl setHTTPBody: [body dataUsingEncoding: NSUTF8StringEncoding]];

}

- (void)loadURLRequest:(NSMutableURLRequest*)requesturl
{
    _requestUrl = requesturl;
}

- (void)reloadWebView
{
    [_webView loadRequest: _requestUrl];
}

- (void)viewDidLoad {
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    [super viewDidLoad];
    
//    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    
    [self.navigationItem setTitle:@"招行一网通"];
    
    UIBarButtonItem *barBackBtn=[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(btnClicked)];
    self.navigationItem.leftBarButtonItem = barBackBtn;
    
    _webView = [[UIWebView alloc] init];
    _webView.frame = self.view.frame;
    [self.view addSubview:_webView];
    _webView.delegate = self; // self.wvDelegateColletion;
    
}

- (void)btnClicked {
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        NSLog(@"返回");
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[CMBWebKeyboard shareInstance] hideKeyboard];
    
    [self reloadWebView];
    
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[CMBWebKeyboard shareInstance] hideKeyboard];
    //    [self pb_setDesiredNavigaionBarType:self]
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    
}

static BOOL FROM = FALSE;
- (BOOL)webView:(UIWebView *)_webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
    if ([request.URL.host isCaseInsensitiveEqualToString:@"cmbls"]) {
        CMBWebKeyboard *secKeyboard = [CMBWebKeyboard shareInstance];
        [secKeyboard showKeyboardWithRequest:request];
        secKeyboard.webView = _webView;
        
        UITapGestureRecognizer* myTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [self.view addGestureRecognizer:myTap]; //这个可以加到任何控件上,比如你只想响应WebView，我正好填满整个屏幕
        myTap.delegate = self;
        myTap.cancelsTouchesInView = NO;
        return NO;
    }
    
    //
    return YES;
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

-(void)handleSingleTap:(UITapGestureRecognizer *)sender{
    [[CMBWebKeyboard shareInstance] hideKeyboard];
    
}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"Load webView error:%@", [error localizedDescription]);
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    if (FROM) {
        
        return;
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView_
{
    //_secKeyboard.webView = _webView;
}





#pragma mark - dealloc
- (void)dealloc
{
    [[CMBWebKeyboard shareInstance] hideKeyboard];
    
}

@end
