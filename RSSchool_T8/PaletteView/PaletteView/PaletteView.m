//
//  Palette.m
//  RSSchool_T8
//
//  Created by Евгений Полюбин on 16.07.2021.
//

#import "PaletteView.h"

@interface PaletteView ()

@property (strong, nonatomic) NSMutableArray *selectedButtons;
@property (strong, nonatomic) NSArray *colors;
@property (weak, nonatomic) CALayer *layerPaletteView;
@property (weak, nonatomic) NSTimer *timer;

-(void)setupLayers;
-(void)saveSettings:(MyButton*)sender;
-(void)setupStackViews;

@end



@implementation PaletteView

@synthesize timer;
@synthesize layerPaletteView;
@synthesize colors;
@synthesize selectedCollors;
@synthesize selectedButtons;
@synthesize colorButtons;


-(void)setupPalette {
    [self setupLayers];
    [self setupSaveButton];
    [self setupStackViews];
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
    
    [saveButton addTarget: self
                   action: @selector(saveSettings:)
         forControlEvents: UIControlEventTouchUpInside];
    
    [MyButton addShadowButton:saveButton.layer];
    [self addSubview:saveButton];
    
    
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
        ButtonPalette *but = [[ButtonPalette alloc] initWithIdentifier:i];
        [but addTarget:self action:@selector(choseColor:) forControlEvents:UIControlEventTouchUpInside];
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

-(instancetype)init {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGRect frame = CGRectMake(0, 0, screenSize.height/2, screenSize.width);
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setupPalette];
        self.selectedButtons = [NSMutableArray new];
        self.selectedCollors = [NSMutableArray new];
    }
    return self;
}

-(void)saveSettings:(MyButton*)sender {
    [self.selectedCollors removeAllObjects];
    
    for (ButtonPalette* but in selectedButtons) {
        [selectedCollors addObject:but.color];
    }
    
    [self.delegate saveTouchPalette];
}
    

@end
