//
//  FaceView.m
//  Happiness
//
//  Created by Stefan on 05/11/15.
//  Copyright © 2015 Stefan. All rights reserved.
//

#import "FaceView.h"

@implementation FaceView
#define DEFAULT_SCALE 0.90 // factorul de multiplicare folosit la desenarea cercului

- (void) drawCircleAtPoint:(CGPoint)p withRadius:(CGFloat)radius inContext:(CGContextRef) context
{
    UIGraphicsPushContext(context); // deschidem zona grafica PUSH
    CGContextBeginPath(context); // vom desena in context un path
    CGContextAddArc(context, p.x, p.y, radius, 0, 2*M_PI, 1); // defineste arcul de cerc de la 0 la 2PI = cerc
    CGContextStrokePath(context); // deseneaza linia pe arcul definit anterior
    UIGraphicsPopContext(); // inchidem zona grafica POP
    
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context=UIGraphicsGetCurrentContext(); // aducem contextul grafic
    CGPoint midPoint;
    midPoint.x=self.bounds.origin.x+self.bounds.size.width/2 ; //punctul de mijloc al FaceView-ului
    midPoint.y=self.bounds.origin.y+self.bounds.size.height/2;
    NSLog(@"midpoint= %@", NSStringFromCGPoint(midPoint));
    NSLog(@"bounds.origin= %@", NSStringFromCGPoint(self.bounds.origin));
    NSLog(@"bounds.size= %@", NSStringFromCGSize(self.bounds.size));
    NSLog(@"frame.origin= %@", NSStringFromCGPoint(self.frame.origin));
    NSLog(@"frame.size= %@", NSStringFromCGSize(self.frame.size));
    NSLog(@"center= %@", NSStringFromCGPoint(self.center));
    NSLog(@"screen= %@", NSStringFromCGSize([[UIScreen mainScreen] bounds].size));
    

    
    CGFloat size = self.bounds.size.width/2; // determinam care este latura mai mica - latimea sau inaltimea a.i. sa folosim acest SIZE ca si raza a cercului desenat
    if (self.bounds.size.width > self.bounds.size.height)
    {
        size = self.bounds.size.height/2;
    }
    size *=DEFAULT_SCALE;
    CGContextSetLineWidth(context, 5.0);
    [[UIColor blueColor] setStroke];
    [self drawCircleAtPoint:midPoint withRadius:size inContext:context];
    
#define EYE_H 0.35
#define EYE_V 0.35
#define EYE_RADIUS 0.10
    
    CGPoint eyePoint;
    eyePoint.x = midPoint.x - size * EYE_H;
    eyePoint.y = midPoint.y - size * EYE_V;
    
    [self drawCircleAtPoint:eyePoint withRadius:size * EYE_RADIUS inContext:context]; // desenam ochiul stang
    eyePoint.x += size * EYE_H * 2;
    [self drawCircleAtPoint:eyePoint withRadius:size * EYE_RADIUS inContext:context]; // desenam ochiul drept

#define MOUTH_H 0.45
#define MOUTH_V 0.40
#define MOUTH_SMILE 0.25
    
    CGPoint mouthStart;
    mouthStart.x = midPoint.x - MOUTH_H * size;
    mouthStart.y = midPoint.y + MOUTH_V * size;
    CGPoint mouthEnd = mouthStart;
    mouthEnd.x += MOUTH_H * size * 2;
    CGPoint mouthCP1 = mouthStart;
    mouthCP1.x += MOUTH_H * size * 2/3;
    CGPoint mouthCP2 = mouthEnd;
    mouthCP2.x -= MOUTH_H * size * 2/3;
    
    float smile = 1.0; // this should be delegated! it's our View's data!
    
    CGFloat smileOffset = MOUTH_SMILE * size * smile;
    mouthCP1.y += smileOffset;
    mouthCP2.y += smileOffset;
    
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, mouthStart.x, mouthStart.y);
    CGContextAddCurveToPoint(context, mouthCP1.x, mouthCP2.y, mouthCP2.x, mouthCP2.y, mouthEnd.x, mouthEnd.y); // bezier curve
    CGContextStrokePath(context);

    

}


@end
