//
//  Palette.h
//  RSSchool_T8
//
//  Created by Евгений Полюбин on 16.07.2021.
//

#import <UIKit/UIKit.h>
#import "MyButton.h"
#import "ButtonPalette.h"

NS_ASSUME_NONNULL_BEGIN

@interface Palette : UIInputView

@property (strong, nonatomic) MyButton *saveButton;
@property (strong, nonatomic) NSArray *colorButtons;
@property (strong, nonatomic) NSMutableArray *selectedCollors;

-(void)setupPalette;

@end

NS_ASSUME_NONNULL_END
