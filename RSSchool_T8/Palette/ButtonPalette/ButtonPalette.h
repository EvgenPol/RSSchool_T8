//
//  ButtonPalette.h
//  RSSchool_T8
//
//  Created by Евгений Полюбин on 17.07.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ButtonPalette : UIButton

@property (nonatomic) BOOL isChosed;
@property (weak, nonatomic) UIColor *color;

-(void)touchButtonPalette;
-(void)setupButtomPalleteWithColor:(UIColor*)color;

@end

NS_ASSUME_NONNULL_END
