//
//  CanvasView.h
//  RSSchool_T8
//
//  Created by Евгений Полюбин on 16.07.2021.
//

#import <UIKit/UIKit.h>

typedef enum {
    DrawingObjectTree,
    DrawingObjectHead,
    DrawingObjectLandscape,
    DrawingObjectPlanet,
    DrawingObjectNone,
} DrawingObject;



NS_ASSUME_NONNULL_BEGIN

@interface CanvasView : UIView

@property (nonatomic, readwrite) DrawingObject drawingObject;
-(void)setupCanvas;

@end

NS_ASSUME_NONNULL_END
