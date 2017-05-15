//
//  ViewController.m
//  CustomAlertView
//
//  Created by Rana on 2/8/17.
//  Copyright © 2017 Rana. All rights reserved.
//

#import "ViewController.h"
#import "CustomAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) buttonPressed:(int)index{
    NSLog(@"Alert button pressed:  %d", index);
    
    [self.customAlertView removeFromSuperview];
    self.customAlertView = nil;
}

- (void)dismissAlertView{
    [self.customAlertView removeFromSuperview];
    self.customAlertView = nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)oneButtonAlert:(id)sender {
    // Initialize the custom alert view controller object
    // and set self as its delegate.
    self.customAlertView = [[CustomAlertView alloc] initWithFrame:self.view.frame];
    self.customAlertView.center = self.view.center;
    //[customAlertView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    self.customAlertView.delegate = self;
    [self.view addSubview:self.customAlertView];
    
    [self.customAlertView numberOfBtnShow:1];
    [self.customAlertView altImage:@"Congratulation.png" altTitle:@"Congratulation" altMessage:@"Successfulley register."];
}

- (IBAction)twoButtonAlert:(id)sender {
    // Initialize the custom alert view controller object
    // and set self as its delegate.
    self.customAlertView = [[CustomAlertView alloc] initWithFrame:self.view.frame];
    self.customAlertView.center = self.view.center;
    //[customAlertView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    self.customAlertView.delegate = self;
    [self.view addSubview:self.customAlertView];
    
    [self.customAlertView numberOfBtnShow:2];
    [self.customAlertView altImage:@"Alert.png" altTitle:@"Alert" altMessage:@"Net problem."];
}

@end
