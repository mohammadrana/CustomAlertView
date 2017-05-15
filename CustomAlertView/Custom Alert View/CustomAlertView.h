//
//  CustomAlertView.h
//  CustomAlertView
//
//  Created by Rana on 2/8/17.
//  Copyright © 2017 Rana. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomAlertDelegate <NSObject>
- (void) buttonPressed:(int) index;
- (void) dismissAlertView;
@end

@interface CustomAlertView : UIView<UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIView *alertBgView;
@property (weak, nonatomic) IBOutlet UIImageView *alertImage;
@property (weak, nonatomic) IBOutlet UILabel *alertTitle;
@property (weak, nonatomic) IBOutlet UILabel *alertMessage;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtnOutlet;
@property (weak, nonatomic) IBOutlet UIButton *okBtnOutlet;

@property (weak, nonatomic) id <CustomAlertDelegate> delegate;

- (IBAction)cencleAction:(id)sender;
- (IBAction)okAction:(id)sender;
- (void) numberOfBtnShow:(int)count;
- (void) altImage:(NSString*)imgName altTitle:(NSString*)title altMessage:(NSString*)message;

@end
