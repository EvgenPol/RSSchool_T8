//
//  NavigationController.m
//  RSSchool_T8
//
//  Created by Евгений Полюбин on 15.07.2021.
//

#import "NavigationController.h"
#import "RSSchool_T8-Swift.h"
#import "PaletteView.h"

@interface NavigationController ()

@property (strong, nonatomic) DrawingVC *drawingVC;

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem.backBarButtonItem setTintColor:[UIColor colorNamed:@"LightGreenSea"]];
    [self setDrawingVC:[[DrawingVC alloc] init]];
    [self addChildViewController:self.drawingVC];
    [self.drawingVC setView:[[UIView alloc] init]];
    [self.drawingVC.view setFrame:[UIScreen mainScreen].bounds];
    [self.drawingVC.view setBackgroundColor:UIColor.blueColor];
    [self.drawingVC willMoveToParentViewController:self];
}

-(void)pushTextNav{
    NSLog(@"Work!");
}

@end
