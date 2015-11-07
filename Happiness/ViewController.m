//
//  ViewController.m
//  Happiness
//
//  Created by Stefan on 05/11/15.
//  Copyright © 2015 Stefan. All rights reserved.
//

#import "ViewController.h"
#import "FaceView.h"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet FaceView *faceView;

@end

@implementation ViewController

@synthesize happiness=_happiness;
@synthesize faceView=_faceView;

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self.faceView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    // fac resize la frame ( nu stiu dc nu face asta automat )
    [self.faceView setNeedsDisplay]; // reapeleaza la schimbarea modelului
}



//- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
//{
//    // Define the new screen size we are about to transition to
//    CGSize windowSize;
//    windowSize= size;
//    
//    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context){
//        [self.faceView setFrame:CGRectMake(0, 0, size.width, size.height)];
//    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context){
//    }];
//    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
//}



-(void) setHappiness:(int)happiness
{
    _happiness=happiness;
    [self.faceView setNeedsDisplay]; // atunci cand se modifica modelul - happiness se va redesena view-ul construit
    
}



@end
