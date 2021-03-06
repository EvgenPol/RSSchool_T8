//
//  CanvasView.h
//  RSSchool_T8
//
//  Created by Евгений Полюбин on 16.07.2021.
//

#import <UIKit/UIKit.h>
#import "RSSchool_T8-Swift.h"

NS_ASSUME_NONNULL_BEGIN

@protocol CanvasViewDelegate <NSObject>

-(void)sendDone;

@end



@interface CanvasView : UIView

@property (strong, nonatomic) NSArray<CAShapeLayer*> *arrayShapeLayer;
@property (weak, nonatomic, nullable) id<CanvasViewDelegate> delegate;


-(void)setupCanvas;
-(void)drawWithTime:(float)time Object:(DrawingObject)object AndColors:(NSArray<UIColor*>*)colors;
-(UIImage*)getImage;

@end

NS_ASSUME_NONNULL_END
