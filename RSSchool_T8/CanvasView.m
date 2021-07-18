//
//  CanvasView.m
//  RSSchool_T8
//
//  Created by Евгений Полюбин on 16.07.2021.
//

#import "CanvasView.h"
#import "UIBezierPath+DrawingStuff.h"
@implementation CanvasView


- (void)drawRect:(CGRect)rect {
    UIBezierPath *path;
    if (_drawingObject == DrawingObjectTree) {
        path = [UIBezierPath drawingTree];
    }
}

-(void)setupCanvas {
    self.layer.cornerRadius = 8.0;
    self.layer.shadowColor = [UIColor colorWithRed:0 green:0.698 blue:1 alpha:0.25].CGColor;
    self.layer.shadowOffset = CGSizeMake(0.0, 0.0);
    self.layer.shadowRadius = 8.0;
    self.layer.shadowOpacity = 1.0;
}


@end

