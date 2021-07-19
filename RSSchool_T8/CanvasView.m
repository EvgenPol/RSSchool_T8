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
@property (strong, nonatomic, nullable) NSTimer *timer;


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
        layer.lineCap = kCALineCapRound;
        layer.lineJoin = kCALineJoinRound;
        
        [self.layer addSublayer:layer];
    }
   
    self.arrayShapeLayer = arrayShapeLayer;
}

-(void)setPathsForShapeLayers:(DrawingObject)object {
    CAShapeLayer *layer0;
    CAShapeLayer *layer1;
    CAShapeLayer *layer2;
    
    switch (object) {
        case DrawingObjectTree:
            layer0 = self.arrayShapeLayer[0];
            layer1 = self.arrayShapeLayer[1];
            layer2 = self.arrayShapeLayer[2];
            layer0.path = [UIBezierPath treeLeaves].CGPath;
            layer1.path = [UIBezierPath treeTrunk].CGPath;
            layer2.path = [UIBezierPath treeGround].CGPath;
            layer2.lineWidth = 0.5;
            break;
            
        case DrawingObjectHead:
            layer0 = self.arrayShapeLayer[0];
            layer1 = self.arrayShapeLayer[1];
            layer2 = self.arrayShapeLayer[2];
            layer0.path = [UIBezierPath headFace].CGPath;
            layer1.path = [UIBezierPath headLips].CGPath;
            layer2.path = [UIBezierPath headNeck].CGPath;
            layer2.lineWidth = 1;
            break;
            
        case DrawingObjectLandscape:
            layer0 = self.arrayShapeLayer[0];
            layer1 = self.arrayShapeLayer[1];
            layer2 = self.arrayShapeLayer[2];
            layer0.path = [UIBezierPath landscapeSky].CGPath;
            layer1.path = [UIBezierPath landscapeHill].CGPath;
            layer2.path = [UIBezierPath landscapeMountain].CGPath;
            layer2.lineWidth = 0.5;
            break;
            
        case DrawingObjectPlanet:
            layer0 = self.arrayShapeLayer[0];
            layer1 = self.arrayShapeLayer[1];
            layer2 = self.arrayShapeLayer[2];
            layer0.path = [UIBezierPath planetAsteroids].CGPath;
            layer1.path = [UIBezierPath planetSurface].CGPath;
            layer2.path = [UIBezierPath planetAndRing].CGPath;
            layer2.lineWidth = 1;
            break;
    }
}

-(void)setColorsForShapeLayers:(NSArray<UIColor*>*)colors {
    NSMutableArray<UIColor*> *innerArray = [colors mutableCopy];
    NSMutableArray<UIColor*> *shuffledArray = [[NSMutableArray alloc] init];
    int indexLayer = 0;
    
    while (innerArray.count < 3) {
        [innerArray addObject:UIColor.blackColor];
    }

    for (int i = 0; i < 3; i++) {
        uint32_t removedIndex = arc4random_uniform((uint32_t)innerArray.count);
        UIColor *removedColor = [innerArray objectAtIndex:removedIndex];
        [shuffledArray addObject:removedColor];
        [innerArray removeObjectAtIndex:removedIndex];
    }
    

    for (UIColor *color in shuffledArray) {
        CAShapeLayer *layer = self.arrayShapeLayer[indexLayer];
        layer.strokeColor = color.CGColor;
        indexLayer ++;
    }
}

-(void)drawWithTime:(float)time Object:(DrawingObject)object AndColors:(NSArray<UIColor*>*)colors {
    [self setPathsForShapeLayers:object];
    [self setColorsForShapeLayers:colors];
    
    self.currentStep = 1.0f / (60.0f * time);
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval: 0.0167
                                                  target:self
                                                selector:@selector(oneStepDrawing)
                                                userInfo:nil
                                                 repeats:YES];
    [self.timer setTolerance:0.01];
}

-(void)oneStepDrawing{
    CAShapeLayer *layerForCheck = self.arrayShapeLayer[0];
    if (layerForCheck.strokeEnd > 1){
        [self.timer invalidate];
        [self setTimer:nil];
        [self.delegate sendDone];
        return;
    }
    if (layerForCheck.strokeEnd < 1)  {
        for (CAShapeLayer *layer in self.arrayShapeLayer) {
            layer.strokeEnd += self.currentStep;
        }
    }
}


@end

