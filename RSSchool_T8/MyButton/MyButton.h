//
//  MyButton.h
//  RSSchool_T8
//
//  Created by Евгений Полюбин on 17.07.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyButton : UIButton

@property (strong, nonatomic) UIView *inputView;

-(void)setupMyButton;
+(void)addShadowButton:(CALayer*)layer;

@end

NS_ASSUME_NONNULL_END
