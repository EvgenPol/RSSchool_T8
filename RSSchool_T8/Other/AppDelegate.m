//
//  AppDelegate.m
//  RSSchool_T8
//
//  Created by Евгений Полюбин on 15.07.2021.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = UIColor.blackColor;
    
    self.window.rootViewController = [[ViewController alloc] init];
    self.window.rootViewController.view.backgroundColor = UIColor.whiteColor;
    
    [self.window makeKeyAndVisible];
    return YES;
}




@end
