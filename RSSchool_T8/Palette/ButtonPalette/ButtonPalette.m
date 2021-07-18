//
//  ButtonPalette.m
//  RSSchool_T8
//
//  Created by Евгений Полюбин on 17.07.2021.
//

#import "ButtonPalette.h"

@implementation ButtonPalette

@synthesize isChosed;
@synthesize color;



-(void)touchButtonPalette {
    if (self.isChosed) {
        CALayer *colorLayer = self.layer.sublayers.firstObject;
        [colorLayer setFrame:CGRectMake(8, 8, 24, 24)];
        [colorLayer setCornerRadius:6];
        self.isChosed = NO;
    } else {
        CALayer *colorLayer = self.layer.sublayers.firstObject;
        [colorLayer setFrame:CGRectMake(2, 2, 36, 36)];
        [colorLayer setCornerRadius:8];
        self.isChosed = YES;
    }
}

-(void)setupButtomPalleteWithColor:(UIColor*)color {
    self.isChosed = NO;
    CALayer *colorLayer = [[CALayer alloc] init];
    
    [colorLayer setFrame:CGRectMake(8, 8, 24, 24)];
    [colorLayer setCornerRadius: 6];
    [colorLayer setBackgroundColor: color.CGColor];
   
    
    [self setBackgroundColor: UIColor.whiteColor];
    [self.layer addSublayer:colorLayer];
    [self.layer setCornerRadius: 10];
    [self setColor:color];
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.widthAnchor constraintEqualToConstant:40].active = YES;
    [self.heightAnchor constraintEqualToConstant:40].active = YES;
}

@end
