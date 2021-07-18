//
//  ArtistViewController.m
//  RSSchool_T8
//
//  Created by Евгений Полюбин on 15.07.2021.
//

#import "ArtistViewController.h"
#import "CanvasView.h"
#import "NavigationController.h"
#import "Palette.h"
@interface ArtistViewController ()

@property (weak, nonatomic) IBOutlet CanvasView *canvas;
@property (strong, nonatomic) IBOutletCollection(MyButton) NSArray *buttonsOnScreen;

@end


@implementation ArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Artist";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Drawings"
                                                                              style:UIBarButtonItemStyleDone
                                                                             target:self
                                                                             action:@selector(push)];
    
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
            CGSize screenSize = [UIScreen mainScreen].bounds.size;
            CGRect framePallete = CGRectMake(0, 0, screenSize.height/2, screenSize.width);
            Palette *palleteView = [[Palette alloc] initWithFrame: framePallete];
            [palleteView setupPalette];
            [palleteView.saveButton addTarget:button action:@selector(touchSave) forControlEvents:UIControlEventTouchUpInside];
            
            button.inputView = palleteView;
        }
        if ([button.titleLabel.text isEqual:@"Open Timer"]) {
            
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
