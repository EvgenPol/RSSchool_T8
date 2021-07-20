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
   
   }

- (NSDictionary*)textAttributes_Font {
    UIFont *font = [UIFont fontWithName:@"Montserrat-Regular" size:17.0];
    return [NSDictionary dictionaryWithObjectsAndKeys: font, NSFontAttributeName, nil];
}


@end
