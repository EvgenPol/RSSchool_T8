//
//  UIBezierPath+DrawingStuff.h
//  RSSchool_T8
//
//  Created by Евгений Полюбин on 16.07.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBezierPath (DrawingStuff)

+(UIBezierPath*)treeLeaves;
+(UIBezierPath*)treeTrunk;
+(UIBezierPath*) treeGround;

+(UIBezierPath*)headFace;
+(UIBezierPath*)headLips;
+(UIBezierPath*)headNeck;

+(UIBezierPath*)landscapeSky;
+(UIBezierPath*)landscapeHill;
+(UIBezierPath*)landscapeMountain;

+(UIBezierPath*)planetAndRing;
+(UIBezierPath*)planetSurface;
+(UIBezierPath*)planetAsteroids;

@end

NS_ASSUME_NONNULL_END
