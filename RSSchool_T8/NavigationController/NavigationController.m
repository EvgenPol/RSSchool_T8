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

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationBar setTintColor:[UIColor colorNamed:@"LightGreenSea"]];
    [self.navigationBar setTitleTextAttributes:self.textAttributes_Font];
   }

- (NSDictionary*)textAttributes_Font {
    UIFont *font = [UIFont fontWithName:@"Montserrat-Regular" size:17.0];
    return [NSDictionary dictionaryWithObjectsAndKeys: font, NSFontAttributeName, nil];
}

-(void)setupNavigationBarForArtist {
    UIViewController *artist = (UIViewController*)self.viewControllers[0];
    artist.navigationItem.title = @"Artist";
    
    UIBarButtonItem *buttonItemArtist = [UIBarButtonItem alloc];
    UIBarButtonItem *backButtonArtist = [UIBarButtonItem alloc];
    
    buttonItemArtist = [buttonItemArtist initWithTitle:@"Drawings"
                        style:UIBarButtonItemStyleDone
                       target:self
                       action:@selector(push)
     ];
    
    backButtonArtist = [backButtonArtist initWithTitle:@"Artist"
                        style:UIBarButtonItemStylePlain
                       target:self
                       action:@selector(pushBack)
     ];

    [buttonItemArtist setTitleTextAttributes:self.textAttributes_Font forState:UIControlStateNormal];
    [buttonItemArtist setTitleTextAttributes:self.textAttributes_Font forState:UIControlStateHighlighted];
    
    [backButtonArtist setTitleTextAttributes:self.textAttributes_Font forState:UIControlStateNormal];
    [backButtonArtist setTitleTextAttributes:self.textAttributes_Font forState:UIControlStateHighlighted];
    
    artist.navigationItem.rightBarButtonItem = buttonItemArtist;
    artist.navigationItem.backBarButtonItem = backButtonArtist;
}

-(void)push {
    [self pushViewController:self.drawingVC animated:YES];
}

-(void)pushBack {
    [self popViewControllerAnimated:YES];
}

@end
