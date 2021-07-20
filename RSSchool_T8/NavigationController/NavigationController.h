//
//  NavigationController.h
//  RSSchool_T8
//
//  Created by Евгений Полюбин on 15.07.2021.
//

#import <UIKit/UIKit.h>
#import "RSSchool_T8-Swift.h"

NS_ASSUME_NONNULL_BEGIN

@interface NavigationController : UINavigationController

@property (strong, nonatomic) DrawingVC *drawingVC;
@property (strong, nonatomic) NSDictionary *textAttributes_Font;

@end

NS_ASSUME_NONNULL_END
