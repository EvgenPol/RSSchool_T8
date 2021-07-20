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
    self.canvas.delegate = (id)self;
    [self.canvas setupCanvas];
    [self firstSetupButtons];
    [self setupStateIdle];
    [self madeByEvgenyPoliubin];
    
    
    UIBarButtonItem *buttonItem = [UIBarButtonItem alloc];
    UIBarButtonItem *backButton = [UIBarButtonItem alloc];
    buttonItem = [buttonItem initWithTitle:@"Drawings"
                        style:UIBarButtonItemStyleDone
                       target:self
                       action:@selector(push)
     ];
    backButton = [backButton initWithTitle:@"Artist"
                        style:UIBarButtonItemStylePlain
                       target:self
                       action:@selector(push)
     ];
                                
    NSDictionary *attributes = [(NavigationController*)self.navigationController textAttributes_Font];
    
    [buttonItem setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [backButton setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [buttonItem setTitleTextAttributes:attributes forState:UIControlStateHighlighted];
    [backButton setTitleTextAttributes:attributes forState:UIControlStateHighlighted];
    self.navigationItem.rightBarButtonItem = buttonItem;
    self.navigationItem.backBarButtonItem = backButton;
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
        if ([button.titleLabel.text isEqual:@"Share"] || [button.titleLabel.text isEqual:@"Draw"]) {
                 [button setupEnabled];
             }
             if ([button.titleLabel.text isEqual:@"Draw"]) {
                 [button setTitle:@"Reset" forState:UIControlStateNormal];
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
        if ([button.titleLabel.text isEqual:@"Share"] || [button.titleLabel.text isEqual:@"Draw"]) {
                   [button setupEnabled];
        }
        if ([button.titleLabel.text isEqual:@"Draw"]) {
                   [button setTitle:@"Reset" forState:UIControlStateNormal];
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

- (IBAction)touchShareButton:(MyButton *)sender {
    UIImage* image = [self.canvas getImage];
    NSData *imagePNG = UIImagePNGRepresentation(image);
    
    UIActivityViewController *activityVC = [UIActivityViewController alloc];
    activityVC = [activityVC initWithActivityItems:@[imagePNG, self] applicationActivities:nil];
    
    activityVC.popoverPresentationController.sourceView = self.view;
        
    [self presentViewController:activityVC animated:YES completion:nil];
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



@interface ArtistViewController (UIActivityItemSource) <UIActivityItemSource>

@end

@implementation ArtistViewController (UIActivityItemSource)

- (nullable id)activityViewController:(nonnull UIActivityViewController *)activityViewController itemForActivityType:(nullable UIActivityType)activityType {
    return nil;
}

- (nonnull id)activityViewControllerPlaceholderItem:(nonnull UIActivityViewController *)activityViewController {
    return @"";
}

- (LPLinkMetadata*)activityViewControllerLinkMetadata:(UIActivityViewController *)activityViewController  API_AVAILABLE(ios(13.0)){
    UIImage *image = [UIImage imageNamed:@"IconForActivityVC"];
  
    NSItemProvider *imageProvider = [[NSItemProvider alloc] initWithObject:image];
    LPLinkMetadata *metadata = [[LPLinkMetadata alloc] init];
    metadata.imageProvider = imageProvider;
    return metadata;
}

@end
