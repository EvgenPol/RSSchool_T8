//
//  PaletteView.h
//  RSSchool_T8
//
//  Created by Евгений Полюбин on 16.07.2021.
//

#import <UIKit/UIKit.h>
#import "MyButton.h"
#import "ButtonPalette.h"

NS_ASSUME_NONNULL_BEGIN

@protocol PaletteViewDelegate <NSObject>
-(void)saveTouchPalette;
@end

@interface PaletteView : UIInputView

@property(nullable, nonatomic, weak) id<PaletteViewDelegate> delegate;
@property (strong, nonatomic) NSArray *colorButtons;
@property (strong, nonatomic) NSMutableArray *selectedCollors;

@end

NS_ASSUME_NONNULL_END
