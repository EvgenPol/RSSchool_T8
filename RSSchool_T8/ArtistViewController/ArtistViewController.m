//
//  ArtistViewController.m
//  RSSchool_T8
//
//  Created by Евгений Полюбин on 15.07.2021.
//

#import "ArtistViewController.h"
#import "CanvasView.h"
#import "NavigationController.h"
#import "PaletteView.h"
#import "RSSchool_T8-Bridging-Header.h"


@interface ArtistViewController ()

@property (weak, nonatomic) IBOutlet CanvasView *canvas;
@property (strong, nonatomic) IBOutletCollection(MyButton) NSArray *buttonsOnScreen;
@property (weak, nonatomic) IBOutlet MyButton *openPaletteButton;
@property (weak, nonatomic) IBOutlet MyButton *openTimerButton;

@property (weak, nonatomic) PaletteView *paletteView;
@property (weak, nonatomic) TimerView *timerView;

@property (strong, nonatomic) NSArray *selectedColors;
@property (nonatomic) float selectedTime;
@property (nonatomic) DrawingObject selectedDrawingObject;



@end



@implementation ArtistViewController
@synthesize selectedColors;
@synthesize selectedTime;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Artist";
    self.selectedColors = @[];
    self.selectedTime = 1.00;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Drawings"
                                                                              style:UIBarButtonItemStyleDone
                                                                             target:self
                                                                             action:@selector(push)];

    [self.canvas setupCanvas];
    [self firstSetupButtons];
    [self setupStateIdle];
    [self madeByEvgenyPoliubin];
    [self setSelectedDrawingObject:DrawingObjectTree];
    

    
}

-(void)firstSetupButtons {
    for (MyButton *button in self.buttonsOnScreen) {
        button.titleEdgeInsets = UIEdgeInsetsMake(5, 21, 5, 0);
        [button setupMyButton];
        if ([button.titleLabel.text isEqual:@"Open Palette"]) {
            PaletteView *palleteView = [[PaletteView alloc] init];
            palleteView.delegate = (id)self;
            button.inputView = palleteView;
            self.paletteView = palleteView;
        }
        if ([button.titleLabel.text isEqual:@"Open Timer"]) {
            TimerView *timerView = [[TimerView alloc] init];
            timerView.delegate = (id)self;
            button.inputView = timerView;
            self.timerView  = timerView;
        }
    }
}


-(void)setupStateIdle {
    self.canvas.drawingObject = DrawingObjectNone;
    [self.canvas setNeedsLayout];
    for (UIButton *button in self.buttonsOnScreen) {
        if ([button.titleLabel.text isEqual:@"Share"]) {
            button.alpha = 0.5;
            [button setUserInteractionEnabled:NO];
        } else {
            button.alpha = 1.0;
            [button setUserInteractionEnabled:YES];
        }
    }
}

-(void)setupStateDraw {
    for (UIButton *button in self.buttonsOnScreen) {
            button.alpha = 0.5;
            [button setUserInteractionEnabled:NO];
    }
}

-(void)setupStateDone {
    for (UIButton *button in self.buttonsOnScreen) {
        if ([button.titleLabel.text isEqual:@"Share"] || [button.titleLabel.text isEqual:@"Reset"])
            button.alpha = 1.0;
            [button setUserInteractionEnabled:YES];
    }
}

-(void)madeByEvgenyPoliubin{
    NSString *string = @"do nothing";
    string = nil;
}

- (IBAction)touchDrawResetButtom:(MyButton *)sender {
    if ([sender.titleLabel.text isEqualToString:@"Draw"]) {
        [self.canvas setDrawingObject:self.selectedDrawingObject];
        [self.canvas drawObjectWithTime: self.selectedTime];
        
        [sender setTitle:@"Reset" forState:UIControlStateNormal];
        [self setupStateDone];
        
    } else {
        [sender setTitle:@"Draw" forState:UIControlStateNormal];
        for (CAShapeLayer *layer in self.canvas.arrayShapeLayer) {
            layer.strokeEnd = 0;
        }
        [self setupStateIdle];
        [self.canvas setNeedsDisplay];
    }
}

-(void)push {
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end




@interface ArtistViewController (PaletteViewDelegate_TimerViewDelegate) <PaletteViewDelegate, TimerViewDelegate>

-(void)saveTouchPalette;
-(void)saveTouchTime;
    
@end



@implementation ArtistViewController (PaletteViewDelegate_TimerViewDelegate)

- (void)saveTouchPalette {
    self.selectedColors = [NSArray arrayWithArray:self.paletteView.selectedCollors];
    [UIView animateWithDuration:0.8 animations:^{
        [self.openPaletteButton resignFirstResponder];
    }];
}


- (void)saveTouchTime {
    self.selectedTime = self.timerView.selectedValue;
    [UIView animateWithDuration:0.8 animations:^{
        [self.openTimerButton resignFirstResponder];
    }];
}

@end
