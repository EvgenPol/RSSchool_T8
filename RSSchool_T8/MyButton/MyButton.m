//
//  MyButton.m
//  RSSchool_T8
//
//  Created by Евгений Полюбин on 17.07.2021.
//

#import "MyButton.h"

@implementation MyButton

-(void)setupEnabled {
    self.alpha = 1;
    [self setUserInteractionEnabled:YES];
    self.layer.shadowRadius = 2.0;
}

-(void)setupDisenabled {
    self.alpha = 0.5;
    [self setUserInteractionEnabled:NO];
}

-(BOOL)canBecomeFirstResponder {
    return YES;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self setHighlighted:NO];
    self.layer.shadowRadius = 3;
}


-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    self.layer.shadowRadius = 1;
    if ([self.titleLabel.text isEqualToString:@"Open Palette"]) {
        [self becomeFirstResponder];
    }
    if ([self.titleLabel.text isEqualToString:@"Open Timer"]) {
        [self becomeFirstResponder];
    }
    [UIView performWithoutAnimation:^{
        [self setHighlighted:NO];
        [self layoutIfNeeded];
    }];
    }


// -- to disable the text alpha change when the touch moves
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

-(void)setupMyButton {
    [self setTitleColor:[UIColor colorNamed:@"LightGreenSea"] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont fontWithName:@"Montserrat-Medium" size:18];
    self.backgroundColor = UIColor.whiteColor;
    self.layer.cornerRadius = 10;
    [MyButton addShadowButton:self.layer];
    
}

+(void)addShadowButton:(CALayer*)layer {
    layer.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.25f].CGColor;
    layer.shadowOffset = CGSizeMake(0.0, 0.0);
    layer.shadowOpacity = 1.0;
    layer.shadowRadius = 2.0;
}

@end
