//
//  LeftRightViewController.m
//  iOSClubProject
//
//  Created by Richard  Feldtz on 2/24/16.
//  Copyright © 2016 iosclub. All rights reserved.
//

#import "LeftRightViewController.h"

@interface LeftRightViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *leftHandImageView;
@property (nonatomic, weak) IBOutlet UIImageView *rightHandImageView;
@property (nonatomic, assign) BOOL isGuess;

@end

@implementation LeftRightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(IBAction)leftButtonPressed {
    [self playerGuessedWithLeftSide:YES];
}

-(IBAction)rightButtonPressed {
    [self playerGuessedWithLeftSide:NO];
}

-(void)playerGuessedWithLeftSide: (BOOL)didGuessWithLeft{
    if (self.isGuess) {
        return;
    }
    self.isGuess = YES;
    
    NSInteger side = arc4random() % 2;
    if (side == 0) {
        self.leftHandImageView.image = [UIImage imageNamed:@"hand"];
    }
    else if (side == 1) {
        self.rightHandImageView.image = [UIImage imageNamed:@"hand"];
    }
    
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(resetHands) userInfo:nil repeats:NO];
}

-(void)resetHands {
    self.isGuess = NO;
    self.leftHandImageView.image = [UIImage imageNamed:@"Fist"];
    self.rightHandImageView.image = [UIImage imageNamed:@"Fist"];
}


@end
