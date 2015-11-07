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
    NSLog(@"\n\n---------------------------\nRotated\n---------------------------\n\n");
    [self.faceView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    // fac resize la frame ( nu stiu dc nu face asta automat )
    [self.faceView setNeedsDisplay]; // reapeleaza la schimbarea modelului
}

/*
 -(void) setHappiness:(int)happiness
 {
 _happiness=happiness;
 [self.faceView setNeedsDisplay]; // atunci cand se modifica modelul - happiness se va redesena view-ul construit
 }
 */

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    [self.faceView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    return YES; // putem roti device-ul
}

@end
