//
//  UIBezierPath+DrawingStuff.m
//  RSSchool_T8
//
//  Created by Евгений Полюбин on16.07.2021.
//

#import "UIBezierPath+DrawingStuff.h"

@implementation UIBezierPath (DrawingStuff)

+(UIBezierPath*)drawingTree {
    UIBezierPath* tree = [UIBezierPath bezierPath];
    [tree appendPath:[UIBezierPath treeLeaves]];
    [tree appendPath:[UIBezierPath treeTrunk]];
    [tree appendPath:[UIBezierPath treeGround]];
    return tree;
}

+(UIBezierPath*)drawingHead {
    UIBezierPath* head = [UIBezierPath bezierPath];

    return head;
}


//MARK: Drawing Tree Stuff (leaves, Trunk, Ground)
//Drawing Leaves
+(UIBezierPath*)treeLeaves {

    UIBezierPath *leaves = [UIBezierPath bezierPath];
    [leaves moveToPoint:CGPointMake(233.19,85.76)];
    [leaves addCurveToPoint:CGPointMake(220.5,62) controlPoint1: CGPointMake(237,68.49) controlPoint2: CGPointMake(229.61,62)];
    [leaves addCurveToPoint:CGPointMake(215.97,62.55) controlPoint1: CGPointMake(218.93,62) controlPoint2: CGPointMake(217.41,62.19)];
    [leaves addCurveToPoint:CGPointMake(199.5,49) controlPoint1: CGPointMake(215.41,54.99) controlPoint2: CGPointMake(208.25,49)];
    [leaves addCurveToPoint:CGPointMake(191.6,50.77) controlPoint1: CGPointMake(196.64,49) controlPoint2: CGPointMake(193.94,49.64)];
    [leaves addCurveToPoint:CGPointMake(180.5,47) controlPoint1: CGPointMake(188.67,48.43) controlPoint2: CGPointMake(184.77,47)];
    [leaves addCurveToPoint:CGPointMake(175.97,47.55) controlPoint1: CGPointMake(178.93,47) controlPoint2: CGPointMake(177.41,47.19)];
    [leaves addCurveToPoint:CGPointMake(159.5,34) controlPoint1: CGPointMake(175.41,39.99) controlPoint2: CGPointMake(168.25,34)];
    [leaves addCurveToPoint:CGPointMake(145.59,40.7) controlPoint1: CGPointMake(153.65,34) controlPoint2: CGPointMake(148.52,36.67)];
    [leaves addCurveToPoint:CGPointMake(140.5,40) controlPoint1: CGPointMake(143.98,40.25) controlPoint2: CGPointMake(142.28,40)];
    [leaves addCurveToPoint:CGPointMake(130.81,42.77) controlPoint1: CGPointMake(136.88,40) controlPoint2: CGPointMake(133.53,41.03)];
    [leaves addCurveToPoint:CGPointMake(125.5,42) controlPoint1: CGPointMake(129.14,42.27) controlPoint2: CGPointMake(127.36,42)];
    [leaves addCurveToPoint:CGPointMake(111.59,48.7) controlPoint1: CGPointMake(119.65,42) controlPoint2: CGPointMake(114.52,44.67)];
    [leaves addCurveToPoint:CGPointMake(106.5,48) controlPoint1: CGPointMake(109.98,48.25) controlPoint2: CGPointMake(108.28,48)];
    [leaves addCurveToPoint:CGPointMake(90,62.5) controlPoint1: CGPointMake(97.39,48) controlPoint2: CGPointMake(90,54.49)];
    [leaves addCurveToPoint:CGPointMake(90.01,63.02) controlPoint1: CGPointMake(90,62.68) controlPoint2: CGPointMake(90,62.85)];
    [leaves addCurveToPoint:CGPointMake(88.59,64.7) controlPoint1: CGPointMake(89.49,63.55) controlPoint2: CGPointMake(89.02,64.11)];
    [leaves addCurveToPoint:CGPointMake(83.5,64) controlPoint1: CGPointMake(86.98,64.25) controlPoint2: CGPointMake(85.28,64)];
    [leaves addCurveToPoint:CGPointMake(67,78.5) controlPoint1: CGPointMake(74.39,64) controlPoint2: CGPointMake(67,70.49)];
    [leaves addCurveToPoint:CGPointMake(68.58,84.71) controlPoint1: CGPointMake(67,80.72) controlPoint2: CGPointMake(67.57,82.83)];
    [leaves addCurveToPoint:CGPointMake(66,92.5) controlPoint1: CGPointMake(66.95,86.96) controlPoint2: CGPointMake(66,89.63)];
    [leaves addCurveToPoint:CGPointMake(67.19,97.92) controlPoint1: CGPointMake(66,94.42) controlPoint2: CGPointMake(66.42,96.25)];
    [leaves addCurveToPoint:CGPointMake(64,106.5) controlPoint1: CGPointMake(65.19,100.33) controlPoint2: CGPointMake(64,103.29)];
    [leaves addCurveToPoint:CGPointMake(65.58,112.71) controlPoint1: CGPointMake(64,108.72) controlPoint2: CGPointMake(64.57,110.83)];
    [leaves addCurveToPoint:CGPointMake(63,120.5) controlPoint1: CGPointMake(63.95,114.96) controlPoint2: CGPointMake(63,117.63)];
    [leaves addCurveToPoint:CGPointMake(79.5,135) controlPoint1: CGPointMake(63,128.51) controlPoint2: CGPointMake(70.39,135)];
    [leaves addCurveToPoint:CGPointMake(81.68,134.88) controlPoint1: CGPointMake(80.24,135) controlPoint2: CGPointMake(80.96,134.96)];
    [leaves addCurveToPoint:CGPointMake(96.5,143) controlPoint1: CGPointMake(84.36,139.69) controlPoint2: CGPointMake(89.99,143)];
    [leaves addCurveToPoint:CGPointMake(104.35,141.26) controlPoint1: CGPointMake(99.34,143) controlPoint2: CGPointMake(102.02,142.37)];
    [leaves addCurveToPoint:CGPointMake(119.5,150) controlPoint1: CGPointMake(106.89,146.4) controlPoint2: CGPointMake(112.72,150)];
    [leaves addCurveToPoint:CGPointMake(121.68,149.88) controlPoint1: CGPointMake(120.24,150) controlPoint2: CGPointMake(120.96,149.96)];
    [leaves addCurveToPoint:CGPointMake(136.5,158) controlPoint1: CGPointMake(124.36,154.69) controlPoint2: CGPointMake(129.99,158)];
    [leaves addCurveToPoint:CGPointMake(145,155.93) controlPoint1: CGPointMake(139.61,158) controlPoint2: CGPointMake(142.52,157.24)];
    [leaves addCurveToPoint:CGPointMake(149.66,157.6) controlPoint1: CGPointMake(146.43,156.69) controlPoint2: CGPointMake(147.99,157.26)];
    [leaves addCurveToPoint:CGPointMake(162.5,163) controlPoint1: CGPointMake(152.68,160.9) controlPoint2: CGPointMake(157.31,163)];
    [leaves addCurveToPoint:CGPointMake(170.35,161.26) controlPoint1: CGPointMake(165.34,163) controlPoint2: CGPointMake(168.02,162.37)];
    [leaves addCurveToPoint:CGPointMake(185.5,170) controlPoint1: CGPointMake(172.89,166.4) controlPoint2: CGPointMake(178.72,170)];
    [leaves addCurveToPoint:CGPointMake(187.68,169.88) controlPoint1: CGPointMake(186.24,170) controlPoint2: CGPointMake(186.96,169.96)];
    [leaves addCurveToPoint:CGPointMake(202.5,178) controlPoint1: CGPointMake(190.36,174.69) controlPoint2: CGPointMake(195.99,178)];
    [leaves addCurveToPoint:CGPointMake(211,175.93) controlPoint1: CGPointMake(205.61,178) controlPoint2: CGPointMake(208.52,177.24)];
    [leaves addCurveToPoint:CGPointMake(219.5,178) controlPoint1: CGPointMake(213.48,177.24) controlPoint2: CGPointMake(216.39,178)];
    [leaves addCurveToPoint:CGPointMake(236,163.5) controlPoint1: CGPointMake(228.61,178) controlPoint2: CGPointMake(236,171.51)];
    [leaves addCurveToPoint:CGPointMake(235.99,162.99) controlPoint1: CGPointMake(236,163.33) controlPoint2: CGPointMake(236,163.16)];
    [leaves addCurveToPoint:CGPointMake(236.5,163) controlPoint1: CGPointMake(236.16,163) controlPoint2: CGPointMake(236.33,163)];
    [leaves addCurveToPoint:CGPointMake(245,160.93) controlPoint1: CGPointMake(239.61,163) controlPoint2: CGPointMake(242.52,162.24)];
    [leaves addCurveToPoint:CGPointMake(253.5,163) controlPoint1: CGPointMake(247.48,162.24) controlPoint2: CGPointMake(250.39,163)];
    [leaves addCurveToPoint:CGPointMake(270,148.5) controlPoint1: CGPointMake(262.61,163) controlPoint2: CGPointMake(270,156.51)];
    [leaves addCurveToPoint:CGPointMake(269.66,145.56) controlPoint1: CGPointMake(270,147.49) controlPoint2: CGPointMake(269.88,146.51)];
    [leaves addCurveToPoint:CGPointMake(277,133.5) controlPoint1: CGPointMake(274.09,142.96) controlPoint2: CGPointMake(277,138.53)];
    [leaves addCurveToPoint:CGPointMake(273.19,124.24) controlPoint1: CGPointMake(277,129.98) controlPoint2: CGPointMake(275.57,126.75)];
    [leaves addCurveToPoint:CGPointMake(280,112.5) controlPoint1: CGPointMake(277.32,121.6) controlPoint2: CGPointMake(280,117.33)];
    [leaves addCurveToPoint:CGPointMake(263.5,98) controlPoint1: CGPointMake(280,104.49) controlPoint2: CGPointMake(272.61,98)];
    [leaves addCurveToPoint:CGPointMake(258.96,98.55) controlPoint1: CGPointMake(261.93,98) controlPoint2: CGPointMake(260.41,98.19)];
    [leaves addCurveToPoint:CGPointMake(242.5,85) controlPoint1: CGPointMake(258.41,90.99) controlPoint2: CGPointMake(251.25,85)];
    [leaves addCurveToPoint:CGPointMake(234.6,86.77) controlPoint1: CGPointMake(239.64,85) controlPoint2: CGPointMake(236.94,85.64)];
    [leaves addCurveToPoint:CGPointMake(233.19,85.76) controlPoint1: CGPointMake(234.15,86.41) controlPoint2: CGPointMake(233.68,86.08)];


    return leaves;
}

//Drawing Trunk
+(UIBezierPath*)treeTrunk {
    UIBezierPath *trunk = [UIBezierPath bezierPath];

    [trunk moveToPoint: CGPointMake(102, 270.5)];
    [trunk addCurveToPoint: CGPointMake(163.5, 207.5) controlPoint1: CGPointMake(121.83, 264.67) controlPoint2: CGPointMake(161.9, 243.9)];
    [trunk addCurveToPoint: CGPointMake(153.5, 160.5) controlPoint1: CGPointMake(165.1, 171.1) controlPoint2: CGPointMake(157.5, 161)];
    [trunk moveToPoint: CGPointMake(245.5, 276)];
    [trunk addCurveToPoint: CGPointMake(192, 247) controlPoint1: CGPointMake(227.17, 275) controlPoint2: CGPointMake(190.8, 267.8)];
    [trunk addCurveToPoint: CGPointMake(203, 188.5) controlPoint1: CGPointMake(193.2, 226.2) controlPoint2: CGPointMake(199.83, 199.33)];
    [trunk addCurveToPoint: CGPointMake(212.5, 176.5) controlPoint1: CGPointMake(205.17, 184.17) controlPoint2: CGPointMake(210.1, 175.7)];
    [trunk moveToPoint: CGPointMake(178.5, 185)];
    [trunk addCurveToPoint: CGPointMake(171, 234) controlPoint1: CGPointMake(177, 200.17) controlPoint2: CGPointMake(173.4, 231.2)];
    [trunk moveToPoint: CGPointMake(183.5, 259.5)];
    [trunk addCurveToPoint: CGPointMake(188.5, 188.5) controlPoint1: CGPointMake(183.5, 251.5) controlPoint2: CGPointMake(182.5, 203)];
    [trunk moveToPoint: CGPointMake(165, 227.5)];
    [trunk addCurveToPoint: CGPointMake(144.5, 256.5) controlPoint1: CGPointMake(152, 246.5) controlPoint2: CGPointMake(150.5, 251)];
   
    return trunk;
}

//Drawing Ground
+(UIBezierPath*)treeGround {
    UIBezierPath *ground = [UIBezierPath bezierPath];

    [ground moveToPoint: CGPointMake(119.5, 263.5)];
    [ground addCurveToPoint: CGPointMake(86, 268.81) controlPoint1: CGPointMake(111.5, 255) controlPoint2: CGPointMake(96.4, 255.61)];
    [ground moveToPoint: CGPointMake(59.5, 275)];
    [ground addCurveToPoint: CGPointMake(83.5, 268) controlPoint1: CGPointMake(62.83, 271.17) controlPoint2: CGPointMake(72.3, 264.4)];
    [ground addCurveToPoint: CGPointMake(94, 272) controlPoint1: CGPointMake(94.7, 271.6) controlPoint2: CGPointMake(95.17, 272.17)];
    [ground moveToPoint: CGPointMake(198, 260.5)];
    [ground addCurveToPoint: CGPointMake(221.5, 260.5) controlPoint1: CGPointMake(203, 257.73) controlPoint2: CGPointMake(214.7, 253.85)];
    [ground addCurveToPoint: CGPointMake(226.74, 266.5) controlPoint1: CGPointMake(223.78, 262.73) controlPoint2: CGPointMake(225.48, 264.74)];
    [ground moveToPoint: CGPointMake(230, 273.5)];
    [ground addCurveToPoint: CGPointMake(226.74, 266.5) controlPoint1: CGPointMake(230, 272.46) controlPoint2: CGPointMake(229.25, 269.99)];
    [ground moveToPoint: CGPointMake(226.74, 266.5)];
    [ground addCurveToPoint: CGPointMake(261.5, 268) controlPoint1: CGPointMake(238.33, 263.33) controlPoint2: CGPointMake(261.5, 259.2)];
    [ground addCurveToPoint: CGPointMake(244.5, 276) controlPoint1: CGPointMake(261.5, 276.8) controlPoint2: CGPointMake(245.83, 275.17)];
   
    return ground;
}

@end



//@implementation UIBezierPath (DrawingStuff)
//
//+(UIBezierPath*)drawingTree {
//    UIBezierPath* tree = [UIBezierPath bezierPath];
////    [tree appendPath:[UIBezierPath treeLeaves];
////    [tree appendPath:[UIBezierPath treeTrunk];
////    [tree appendPath:[UIBezierPath treeGround];
//    return tree;
//}
//
//+(UIBezierPath*)drawingHead {
//    UIBezierPath* head = [UIBezierPath bezierPath];
//
//    return head;
//}
//
//
////MARK: Drawing Tree Stuff (leaves, Trunk, Ground)
////Drawing Leaves
//+(NSArray*)treeLeavesArrayPoints {
//    NSArray *array = @[
//        @[@233.19, @85.76],
//        @[@220.5, @62, @237, @68.49, @229.61, @62],
//        @[@215.97, @62.55, @218.93, @62, @217.41, @62.19],
//        @[@199.5, @49, @215.41, @54.99, @208.25, @49],
//        @[@191.6, @50.77, @196.64, @49, @193.94, @49.64],
//        @[@180.5, @47, @188.67, @48.43, @184.77, @47],
//        @[@175.97, @47.55, @178.93, @47, @177.41, @47.19],
//        @[@159.5, @34, @175.41, @39.99, @168.25, @34],
//        @[@145.59, @40.7, @153.65, @34, @148.52, @36.67],
//        @[@140.5, @40, @143.98, @40.25, @142.28, @40],
//        @[@130.81, @42.77, @136.88, @40, @133.53, @41.03],
//        @[@125.5, @42, @129.14, @42.27, @127.36, @42],
//        @[@111.59, @48.7, @119.65, @42, @114.52, @44.67],
//        @[@106.5, @48, @109.98, @48.25, @108.28, @48],
//        @[@90, @62.5, @97.39, @48, @90, @54.49],
//        @[@90.01, @63.02, @90, @62.68, @90, @62.85],
//        @[@88.59, @64.7, @89.49, @63.55, @89.02, @64.11],
//        @[@83.5, @64, @86.98, @64.25, @85.28, @64],
//        @[@67, @78.5, @74.39, @64, @67, @70.49],
//        @[@68.58, @84.71, @67, @80.72, @67.57, @82.83],
//        @[@66, @92.5, @66.95, @86.96, @66, @89.63],
//        @[@67.19, @97.92, @66, @94.42, @66.42, @96.25],
//        @[@64, @106.5, @65.19, @100.33, @64, @103.29],
//        @[@65.58, @112.71, @64, @108.72, @64.57, @110.83],
//        @[@63, @120.5, @63.95, @114.96, @63, @117.63],
//        @[@79.5, @135, @63, @128.51, @70.39, @135],
//        @[@81.68, @134.88, @80.24, @135, @80.96, @134.96],
//        @[@96.5, @143, @84.36, @139.69, @89.99, @143],
//        @[@104.35, @141.26, @99.34, @143, @102.02, @142.37],
//        @[@119.5, @150, @106.89, @146.4, @112.72, @150],
//        @[@121.68, @149.88, @120.24, @150, @120.96, @149.96],
//        @[@136.5, @158, @124.36, @154.69, @129.99, @158],
//        @[@145, @155.93, @139.61, @158, @142.52, @157.24],
//        @[@149.66, @157.6, @146.43, @156.69, @147.99, @157.26],
//        @[@162.5, @163, @152.68, @160.9, @157.31, @163],
//        @[@170.35, @161.26, @165.34, @163, @168.02, @162.37],
//        @[@185.5, @170, @172.89, @166.4, @178.72, @170],
//        @[@187.68, @169.88, @186.24, @170, @186.96, @169.96],
//        @[@202.5, @178, @190.36, @174.69, @195.99, @178],
//        @[@211, @175.93, @205.61, @178, @208.52, @177.24],
//        @[@219.5, @178, @213.48, @177.24, @216.39, @178],
//        @[@236, @163.5, @228.61, @178, @236, @171.51],
//        @[@235.99, @162.99, @236, @163.33, @236, @163.16],
//        @[@236.5, @163, @236.16, @163, @236.33, @163],
//        @[@245, @160.93, @239.61, @163, @242.52, @162.24],
//        @[@253.5, @163, @247.48, @162.24, @250.39, @163],
//        @[@270, @148.5, @262.61, @163, @270, @156.51],
//        @[@269.66, @145.56, @270, @147.49, @269.88, @146.51],
//        @[@277, @133.5, @274.09, @142.96, @277, @138.53],
//        @[@273.19, @124.24, @277, @129.98, @275.57, @126.75],
//        @[@280, @112.5, @277.32, @121.6, @280, @117.33],
//        @[@263.5, @98, @280, @104.49, @272.61, @98],
//        @[@258.96, @98.55, @261.93, @98, @260.41, @98.19],
//        @[@242.5, @85, @258.41, @90.99, @251.25, @85],
//        @[@234.6, @86.77, @239.64, @85, @236.94, @85.64],
//        @[@233.19, @85.76, @234.15, @86.41, @233.68, @86.08],
//    ];
//
//@end
