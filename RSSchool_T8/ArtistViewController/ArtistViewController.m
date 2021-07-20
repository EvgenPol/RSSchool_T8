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
#import <LinkPresentation/LPLinkMetadata.h>


typedef enum {
    StateButtonIdle,
    StateButtonDraw,
    StateButtonDone,
} StateButton;

@interface ArtistViewController ()

@property (weak, nonatomic) IBOutlet CanvasView *canvas;
@property (strong, nonatomic) IBOutletCollection(MyButton) NSArray *buttonsOnScreen;
@property (weak, nonatomic) IBOutlet MyButton *openPaletteButton;
@property (weak, nonatomic) IBOutlet MyButton *openTimerButton;

@property (weak, nonatomic) PaletteView *paletteView;
@property (weak, nonatomic) TimerView *timerView;

- (void)viewDidLoad;
- (void)firstSetupButtons;
- (void)changeStateButton:(StateButton)state;

- (IBAction)touchDrawResetButton:(MyButton *)sender;
- (IBAction)touchShareButton:(MyButton *)sender;

@end



@implementation ArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.canvas.delegate = (id)self;
    [self.canvas setupCanvas];
    [self firstSetupButtons];
    [self changeStateButton:StateButtonIdle];
    [self madeByEvgenyPoliubin];
    
    //customization tab bar
    [(NavigationController *)self.navigationController setupNavigationBarForArtist];
}

- (void)firstSetupButtons {
    for (MyButton *button in self.buttonsOnScreen) {
        button.titleEdgeInsets = UIEdgeInsetsMake(5, 21, 5, 0);
        [button setupMyButton];
        
        if (button == self.openPaletteButton) {
            PaletteView *palleteView = [[PaletteView alloc] init];
            palleteView.delegate = (id)self;
            button.inputView = palleteView;
            self.paletteView = palleteView;
        }
        if (button == self.openTimerButton) {
            TimerView *timerView = [[TimerView alloc] init];
            timerView.delegate = (id)self;
            button.inputView = timerView;
            self.timerView  = timerView;
        }
    }
}

- (void)changeStateButton:(StateButton)state {
    switch (state) {
        case StateButtonIdle:
            for (MyButton *button in self.buttonsOnScreen) {
                if ([button.titleLabel.text isEqual:@"Share"]) {
                    [button setupDisenabled];
                } else {
                    [button setupEnabled];
                }
            }
            break;
            
        case StateButtonDraw:
            for (MyButton *button in self.buttonsOnScreen) {
                    [button setupDisenabled];
            }
            break;
            
        case StateButtonDone:
            for (MyButton *button in self.buttonsOnScreen) {
                if ([button.titleLabel.text isEqual:@"Share"] || [button.titleLabel.text isEqual:@"Draw"]) {
                           [button setupEnabled];
                }
                if ([button.titleLabel.text isEqual:@"Draw"]) {
                           [button setTitle:@"Reset" forState:UIControlStateNormal];
                }
            }
            break;
    }
}

-(void)madeByEvgenyPoliubin{
    NSString *string = @"do nothing";
    string = nil;
}

- (IBAction)touchDrawResetButton:(MyButton *)sender {
    if ([sender.titleLabel.text isEqualToString:@"Draw"]) {
        NavigationController *navigator = (NavigationController*)self.navigationController;
        float time = self.timerView.selectedValue;
        DrawingObject object = navigator.drawingVC.selectedObject;
        NSArray<UIColor*> *colors = self.paletteView.selectedCollors;
        
        [self.canvas drawWithTime:time Object:object AndColors:colors];
        [self changeStateButton:StateButtonDraw];
    } else {
        [sender setTitle:@"Draw" forState:UIControlStateNormal];
        for (CAShapeLayer *layer in self.canvas.arrayShapeLayer) {
            layer.strokeEnd = 0;
            layer.strokeColor = UIColor.clearColor.CGColor;
        }
        [self changeStateButton:StateButtonIdle];
    }
}

- (IBAction)touchShareButton:(MyButton *)sender {
    UIImage* image = [self.canvas getImage];
    NSData *imagePNG = UIImagePNGRepresentation(image);
    
    UIActivityViewController *activityVC = [UIActivityViewController alloc];
    activityVC = [activityVC initWithActivityItems:@[imagePNG, self] applicationActivities:nil];
    
    activityVC.popoverPresentationController.sourceView = self.view;
        
    [self presentViewController:activityVC animated:YES completion:nil];
}

@end



//MARK: subscribe to my views delegate
@interface ArtistViewController (MyViewDelegate) <PaletteViewDelegate, TimerViewDelegate, CanvasViewDelegate>

-(void)saveTouchPalette;
-(void)saveTouchTime;
-(void)sendDone;

@end



@implementation ArtistViewController (MyViewDelegate)

- (void)saveTouchPalette {
    [UIView animateWithDuration:0.9 animations:^{
        [self.openPaletteButton resignFirstResponder];
    }];
}

- (void)saveTouchTime {
    [UIView animateWithDuration:0.9 animations:^{
        [self.openTimerButton resignFirstResponder];
    }];
}

- (void)sendDone {
    [self changeStateButton:StateButtonDone];
}

@end



//MARK: subscribe to datasource "UIActivityItemSource" for button share (add icon app)
@interface ArtistViewController (UIActivityItemSource) <UIActivityItemSource>

@end

@implementation ArtistViewController (UIActivityItemSource)

//activityViewController and activityViewControllerPlaceholderItem methods is required from protocol
- (nullable id)activityViewController:(nonnull UIActivityViewController *)activityViewController itemForActivityType:(nullable UIActivityType)activityType {
    return nil;
}

- (nonnull id)activityViewControllerPlaceholderItem:(nonnull UIActivityViewController *)activityViewController {
    return @"";
}
//

//necessary for us methods
- (LPLinkMetadata*)activityViewControllerLinkMetadata:(UIActivityViewController *)activityViewController  API_AVAILABLE(ios(13.0)){
    UIImage *image = [UIImage imageNamed:@"IconForActivityVC"];
  
    NSItemProvider *imageProvider = [[NSItemProvider alloc] initWithObject:image];
    LPLinkMetadata *metadata = [[LPLinkMetadata alloc] init];
    metadata.imageProvider = imageProvider;
    return metadata;
}

@end
