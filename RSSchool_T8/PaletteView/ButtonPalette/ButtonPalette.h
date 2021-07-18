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
@property (strong, nonatomic) UIColor *color;

-(void)touchButtonPalette;
- (instancetype)initWithIdentifier:(NSInteger)i;

@end

NS_ASSUME_NONNULL_END
