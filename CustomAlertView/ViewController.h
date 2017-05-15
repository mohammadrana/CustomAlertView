//
//  ViewController.h
//  CustomAlertView
//
//  Created by Rana on 2/8/17.
//  Copyright © 2017 Rana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomAlertView.h"

@interface ViewController : UIViewController<CustomAlertDelegate>

@property (strong, nonatomic) CustomAlertView *customAlertView;

- (IBAction)oneButtonAlert:(id)sender;
- (IBAction)twoButtonAlert:(id)sender;

@end

