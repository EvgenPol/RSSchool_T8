//
//  CanvasView.m
//  RSSchool_T8
//
//  Created by Евгений Полюбин on 16.07.2021.
//

#import "CanvasView.h"
#import "UIBezierPath+DrawingStuff.h"

@interface CanvasView ()

@property (nonatomic) float currentStep;
@property (strong, nonatomic) NSTimer *timer;

@end


@implementation CanvasView

-(void)setupCanvas {
    self.layer.cornerRadius = 8.0;
    self.layer.shadowColor = [UIColor colorWithRed:0 green:0.698 blue:1 alpha:0.25].CGColor;
    self.layer.shadowOffset = CGSizeMake(0.0, 0.0);
    self.layer.shadowRadius = 8.0;
    self.layer.shadowOpacity = 1.0;
    
    NSArray *arrayShapeLayer = @[
        [CAShapeLayer layer],
        [CAShapeLayer layer],
        [CAShapeLayer layer],
    ];
    
    for (CAShapeLayer *layer in arrayShapeLayer) {
        [layer setStrokeStart:0];
        [layer setStrokeEnd:0];
        [layer setFillColor:UIColor.clearColor.CGColor];
        [layer setStrokeColor:UIColor.blackColor.CGColor];
        [layer setLineWidth:1.0];
        [layer setFrame:self.bounds];
        
        [self.layer addSublayer:layer];
    }
   
    [arrayShapeLayer[0] setPath:[UIBezierPath treeLeaves].CGPath];
    [arrayShapeLayer[1] setPath:[UIBezierPath treeTrunk].CGPath];
    [arrayShapeLayer[2] setPath:[UIBezierPath treeGround].CGPath];
    [arrayShapeLayer[2] setLineWidth:0.5];
    
    self.arrayShapeLayer = arrayShapeLayer;
}

-(void)drawObjectWithTime:(float) time {
    self.currentStep = 1.0f / (60.0f * time);
    
    NSLog(@"and current step %f, and time %f", self.currentStep , time);
    
//    self.currentStep = 0.1;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1/30
                                                  target:self
                                                selector:@selector(circleAnima)
                                                userInfo:self
                                                 repeats:YES];
    [self.timer setTolerance:0.02];
}

-(void)circleAnima{

//    NSLog(@"%f", self.shapeLayer.strokeEnd);
    CAShapeLayer *layerForCheck = self.arrayShapeLayer[0];
    if (layerForCheck.strokeEnd > 1){
        [self.timer invalidate];
        return;
    }
    if (layerForCheck.strokeEnd < 1)  {
        for (CAShapeLayer *layer in self.arrayShapeLayer) {
            layer.strokeEnd += self.currentStep;
        }
    }
//    if (self.shapeLayer.strokeEnd == 0) {
//        self.shapeLayer.strokeStart = 0;
//    }
//
//    if (self.shapeLayer.strokeStart == self.shapeLayer.strokeEnd) {
//        self.shapeLayer.strokeEnd = 0;
//    }
//    if (self.shapeLayer.strokeEnd > 1 && self.shapeLayer.strokeStart > 1) {
//
//        self.shapeLayer.strokeStart = self.shapeLayer.strokeEnd;
//
//    }
    
    
    
   
}


@end

