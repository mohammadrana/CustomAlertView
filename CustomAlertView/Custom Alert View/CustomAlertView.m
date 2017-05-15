//
//  CustomAlertView.m
//  CustomAlertView
//
//  Created by Rana on 2/8/17.
//  Copyright © 2017 Rana. All rights reserved.
//

#define OK_BUTTON_TAG       888
#define CANCEL_BUTTON_TAG   999

#import "CustomAlertView.h"

@implementation CustomAlertView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"CustomAlertView" owner:self options:nil];
        self = [nibs objectAtIndex:0];
    }
    return self;
}

//How to get a CGPoint from a tapped location?
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    //CGPoint location = [touch locationInView:touch.view];
    CGPoint touchPoint = [touch locationInView:[self.alertBgView superview]];
    NSLog(@"touchPoint   %f", touchPoint.y);
    
    if ( !CGRectContainsPoint( self.alertBgView.frame, touchPoint ) ) {
        // inside
        [_delegate dismissAlertView];
    } else {
        // outside
    }
}

- (void) numberOfBtnShow:(int)count{
    if (count == 1) {
        //NSLog(@"self.numberOfButton  %d", count);
        [self.cancelBtnOutlet setHidden:YES];
        
        CGRect btFrame = self.okBtnOutlet.frame;
        btFrame.origin.x = self.alertImage.center.x - CGRectGetWidth(self.okBtnOutlet.frame)/2;
        self.okBtnOutlet.frame = btFrame;
    }
}

- (void) altImage:(NSString*)imgName altTitle:(NSString*)title altMessage:(NSString*)message{
    
    //NSLog(@"imgName:  %@     altTitle:  %@     altMessage:  %@", imgName, title, message);
    
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        if ([title caseInsensitiveCompare:@"Alert"] == NSOrderedSame) {
            self.alertTitle.textColor = [UIColor colorWithRed:0.996 green:0.000 blue:0.000 alpha:1.00];
        }
        //Change UI GCD
        [self.alertImage setImage:[UIImage imageNamed:imgName]];
        [self.alertTitle setText:title];
        [self.alertMessage setText:message];
//        self.alertMessage.adjustsFontSizeToFitWidth = YES;
//        self.alertMessage.minimumScaleFactor = 0.5;
//        [self.alertMessage sizeToFit];
        
        CGRect n_frame = self.alertMessage.frame;
        n_frame.size.height = [self expectedHeight:self.alertMessage] - 10;
        
        float updateSelfHeight = self.alertMessage.frame.size.height - n_frame.size.height;
        NSLog(@"updateSelfHeight  %f", updateSelfHeight);
        
        self.alertMessage.frame = n_frame;
        
        CGRect newFrame = self.alertBgView.frame;
        
        NSLog(@"self.alertBgView  %f", newFrame.size.height);
        if (updateSelfHeight > 0) {
            //fabsf(float)
            newFrame.origin.y = newFrame.origin.y + updateSelfHeight/2;
            newFrame.size.height = newFrame.size.height - updateSelfHeight;
        }else{
            newFrame.origin.y = newFrame.origin.y - fabsf(updateSelfHeight/2);
            newFrame.size.height = newFrame.size.height + fabsf(updateSelfHeight);
        }
        
        self.alertBgView.frame = newFrame;
        NSLog(@"self.alertBgView new  %f", newFrame.size.height);
    });
}

- (IBAction)cencleAction:(id)sender {
    NSLog(@"Cencle");
    [self.delegate buttonPressed:CANCEL_BUTTON_TAG];
}

- (IBAction)okAction:(id)sender {
    NSLog(@"OK");
    [self.delegate buttonPressed:OK_BUTTON_TAG];
}

- (float)expectedHeight:(UILabel *)label{
    [label setNumberOfLines:0];
    [label setLineBreakMode:NSLineBreakByWordWrapping];
    
    //UIFont *font = [UIFont fontWithName:@"SolaimanLipiNormal" size:14]; //Warning! It's an example, set the font, you need
    
    NSDictionary *attributesDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                          label.font, NSFontAttributeName,
                                          nil];
    
    CGSize maximumLabelSize = CGSizeMake(label.frame.size.width, 9999); //FLT_MAX or 9999
    
    CGRect expectedLabelRect = [[label text] boundingRectWithSize:maximumLabelSize
                                                         options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                                                      attributes:attributesDictionary
                                                         context:nil];
    CGSize *expectedLabelSize = &expectedLabelRect.size;
    
    //    return expectedLabelSize->height;
    return expectedLabelSize->height + 10;
}

@end
