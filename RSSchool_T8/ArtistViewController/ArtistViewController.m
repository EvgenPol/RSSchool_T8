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

@end



@implementation ArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Artist";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Drawings"
                                                                              style:UIBarButtonItemStyleDone
                                                                             target:self
                                                                             action:@selector(push)];
    
    self.canvas.delegate = (id)self;
    [self.canvas setupCanvas];
    [self firstSetupButtons];
    [self setupStateIdle];
    [self madeByEvgenyPoliubin];
    

    
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
    [self.canvas setNeedsLayout];
    for (MyButton *button in self.buttonsOnScreen) {
        if ([button.titleLabel.text isEqual:@"Share"]) {
            [button setupDisenabled];
        } else {
            [button setupEnabled];
        }
    }
}

-(void)setupStateDraw {
    for (MyButton *button in self.buttonsOnScreen) {
            [button setupDisenabled];
    }
}

-(void)setupStateDone {
    for (MyButton *button in self.buttonsOnScreen) {
        if ([button.titleLabel.text isEqual:@"Share"] || [button.titleLabel.text isEqual:@"Reset"]) {
            [button setupEnabled];
        }
    }
}

-(void)madeByEvgenyPoliubin{
    NSString *string = @"do nothing";
    string = nil;
}

- (IBAction)touchDrawResetButtom:(MyButton *)sender {
    if ([sender.titleLabel.text isEqualToString:@"Draw"]) {
        NavigationController *navigator = (NavigationController*)self.navigationController;
        float time = self.timerView.selectedValue;
        DrawingObject object = navigator.drawingVC.selectedObject;
        NSArray<UIColor*> *colors = self.paletteView.selectedCollors;
        
        [self.canvas drawWithTime:time Object:object AndColors:colors];
    
        [sender setTitle:@"Reset" forState:UIControlStateNormal];
        [self setupStateDraw];
    } else {
        [sender setTitle:@"Draw" forState:UIControlStateNormal];
        for (CAShapeLayer *layer in self.canvas.arrayShapeLayer) {
            layer.strokeEnd = 0;
            layer.strokeColor = UIColor.clearColor.CGColor;
        }
        [self setupStateIdle];
        [self.canvas setNeedsDisplay];
    }
}

-(void)push {
    NavigationController *navigation = (NavigationController*)self.navigationController;
    [self.navigationController pushViewController:navigation.drawingVC animated:YES];
}

@end




@interface ArtistViewController (MyViewDelegate) <PaletteViewDelegate, TimerViewDelegate, CanvasViewDelegate>

-(void)saveTouchPalette;
-(void)saveTouchTime;
-(void)sendDone;
    
@end



@implementation ArtistViewController (MyViewDelegate)

- (void)saveTouchPalette {
    [UIView animateWithDuration:0.8 animations:^{
        [self.openPaletteButton resignFirstResponder];
    }];
}


- (void)saveTouchTime {
    [UIView animateWithDuration:0.8 animations:^{
        [self.openTimerButton resignFirstResponder];
    }];
}

- (void)sendDone {
    [self setupStateDone];
}

@end
