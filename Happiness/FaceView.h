//
//  FaceView.h
//  Happiness
//
//  Created by Stefan on 05/11/15.
//  Copyright © 2015 Stefan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FaceView : UIView

@property (nonatomic) CGFloat scale;

- (void) pinch:(UIGestureRecognizer *) gesture; // pinch gesture e facut public - oricine il poate folosi

@end
