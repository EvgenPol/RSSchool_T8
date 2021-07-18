//
//  ButtonPalette.m
//  RSSchool_T8
//
//  Created by Евгений Полюбин on 17.07.2021.
//

#import "ButtonPalette.h"
#import "MyButton.h"

@interface ButtonPalette ()

@property (class, readonly) NSArray *colorsArray;

@end

@implementation ButtonPalette
@synthesize color;
@synthesize isChosed;

+(NSArray*)colorsArray {
    return @[
        [UIColor colorNamed:@"Color-1"],
        [UIColor colorNamed:@"Color-2"],
        [UIColor colorNamed:@"Color-3"],
        [UIColor colorNamed:@"Color-4"],
        [UIColor colorNamed:@"Color-5"],
        [UIColor colorNamed:@"Color-6"],
        [UIColor colorNamed:@"Color-7"],
        [UIColor colorNamed:@"Color-8"],
        [UIColor colorNamed:@"Color-9"],
        [UIColor colorNamed:@"Color-10"],
        [UIColor colorNamed:@"Color-11"],
        [UIColor colorNamed:@"Color-12"]
    ];
}

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
   
   
    [MyButton addShadowButton:self.layer];
    [self setBackgroundColor: UIColor.whiteColor];
    [self.layer addSublayer:colorLayer];
    [self.layer setCornerRadius: 10];
    [self setColor:color];
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.widthAnchor constraintEqualToConstant:40].active = YES;
    [self.heightAnchor constraintEqualToConstant:40].active = YES;
}

- (instancetype)initWithIdentifier:(NSInteger)i {
    self = [super init];
    if (self) {
        [self setupButtomPalleteWithColor: ButtonPalette.colorsArray[i]];
    }
    return self;
}

@end
