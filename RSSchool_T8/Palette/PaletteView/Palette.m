//
//  Palette.m
//  RSSchool_T8
//
//  Created by Евгений Полюбин on 16.07.2021.
//

#import "Palette.h"

@interface Palette ()


@property (strong, nonatomic) NSMutableArray *selectedButtons;
@property (strong, nonatomic) NSArray *colors;
@property (weak, nonatomic) CALayer *layerPaletteView;
@property (weak, nonatomic) NSTimer *timer;

-(void)setupLayers;
-(void)saveSettings;
-(void)setupStackViews;

@end



@implementation Palette

@synthesize timer;
@synthesize layerPaletteView;
@synthesize colors;
@synthesize selectedCollors;
@synthesize selectedButtons;
@synthesize colorButtons;
@synthesize saveButton;

-(void)setupPalette{
    [self setupLayers];
    [self setupSaveButton];
    [self setupStackViews];
    [self setNeedsDisplay];
}

-(void)setupLayers {
    CALayer *basicLayer = [[CALayer alloc] init];
    CGRect frame = self.layer.frame;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    self.layer.backgroundColor = UIColor.whiteColor.CGColor;
    [basicLayer setFrame: CGRectMake(frame.origin.x, frame.origin.x, width, frame.size.height)];
    basicLayer.backgroundColor = UIColor.whiteColor.CGColor;
    basicLayer.cornerRadius = 40.0;
    basicLayer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner;
    self.layerPaletteView = basicLayer;
    
    [self addShadow:basicLayer];
    [self.layer addSublayer:basicLayer];
}

-(void)setupSaveButton {
    MyButton *saveButton = [MyButton buttonWithType:UIButtonTypeRoundedRect];
    [saveButton setupMyButton];
    [saveButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 21, 0, 21)];
    [saveButton setTitle:@"Save" forState:UIControlStateNormal];
    
    [MyButton addShadowButton:saveButton.layer];
    [self addSubview:saveButton];
    self.saveButton = saveButton;
    
    saveButton.translatesAutoresizingMaskIntoConstraints = false;
    [saveButton.topAnchor constraintEqualToAnchor:self.topAnchor constant:20].active = YES;
    [saveButton.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-40].active = YES;
    [saveButton.widthAnchor constraintEqualToConstant:85].active = YES;
}

-(UIStackView*)returnStackView {
    UIStackView *stack = [[UIStackView alloc] init];
    stack.axis = UILayoutConstraintAxisHorizontal;
    stack.distribution = UIStackViewDistributionEqualSpacing;
    stack.alignment = UIStackViewAlignmentCenter;
    stack.translatesAutoresizingMaskIntoConstraints = false;
    stack.spacing = 20;
    return stack;
}

-(void)setupStackViews {
    UIStackView *firstRow = [self returnStackView];
    UIStackView *secondRow = [self returnStackView];
  
    NSMutableArray *buttons = [NSMutableArray new];
    for (int i = 0; i < 12; i++) {
        ButtonPalette *but = [[ButtonPalette alloc] init];
        [but setupButtomPalleteWithColor:colors[i]];
        [but addTarget:self action:@selector(choseColor:) forControlEvents:UIControlEventTouchUpInside];
        [MyButton addShadowButton:but.layer];
        [buttons addObject:but];
        
        (i < 6) ? [firstRow addArrangedSubview:but] : [secondRow addArrangedSubview:but];
    }
    self.colorButtons = [NSArray arrayWithArray:buttons];
    
    [self addSubview:firstRow];
    [self addSubview:secondRow];
   
    [firstRow.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
    [firstRow.topAnchor constraintEqualToAnchor:self.topAnchor constant:92].active = YES;
    [secondRow.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
    [secondRow.topAnchor constraintEqualToAnchor:firstRow.bottomAnchor constant:20].active = YES;
}

-(void)addShadow:(CALayer*)layer {
    layer.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.25f].CGColor;
    layer.shadowOffset = CGSizeMake(0.0, 0.0);
    layer.shadowOpacity = 1.0;
    layer.shadowRadius = 8.0;
}

-(void)choseColor:(ButtonPalette*)sender {
    if ([selectedButtons containsObject:sender]) {
        [sender touchButtonPalette];
        [selectedButtons removeObject:sender];
    } else {
        [selectedButtons addObject:sender];
        [sender touchButtonPalette];
        
        if (self.timer) {
            [timer invalidate];
        }
        
        [self.layerPaletteView setBackgroundColor:sender.color.CGColor];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:NO block:^(NSTimer * _Nonnull timer) {
            [self.layerPaletteView  setBackgroundColor:UIColor.whiteColor.CGColor];
            [self.timer invalidate];
        }];
          
    }
    
    if (selectedButtons.count > 3) {
        [selectedButtons[0] touchButtonPalette];
        [selectedButtons removeObjectAtIndex:0];
    }
}

-(void)s{
    [self setBackgroundColor:UIColor.whiteColor];
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.selectedButtons = [NSMutableArray new];
        self.selectedCollors = [NSMutableArray new];
        self.colors = @[
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
            [UIColor colorNamed:@"Color-12"]];
    }
    return self;
}

-(void)saveSettings {
    [self.selectedCollors removeAllObjects];
    
    for (ButtonPalette* but in selectedButtons) {
        [selectedCollors addObject:but.color];
    }
}


@end
