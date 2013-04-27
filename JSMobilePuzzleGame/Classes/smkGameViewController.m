//
//  smkViewController.m
//  JSMobilePuzzleGame
//
//  Created by smk-dev on 25.04.2013.
//  Copyright (c) 2013 smk-dev. All rights reserved.
//

#import "smkGameViewController.h"

@implementation smkGameViewController

@synthesize gameWebView;
@synthesize gestureView;

#pragma mark - Lifecycle

- (void)viewDidLoad {
    
    // set up game
    NSString *gameDirName = @"www";
    NSString *indexHtmlPath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:gameDirName];
    NSString *indexHtml = [NSString stringWithContentsOfFile:indexHtmlPath encoding:NSUTF8StringEncoding error:nil];
    NSURL *gameDirectory = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:gameDirName ofType:nil]];
    
    // load index.html
    [self.gameWebView loadHTMLString:indexHtml baseURL:gameDirectory];
}

#pragma mark - Actions

- (IBAction)newGameButtonAction:(id)sender {
    [self.gameWebView stringByEvaluatingJavaScriptFromString:@"newGame();"];
    self.gestureView.userInteractionEnabled = YES;
}

- (IBAction)solveButtonAction:(id)sender {
    [self.gameWebView stringByEvaluatingJavaScriptFromString:@"solve();"];
    self.gestureView.userInteractionEnabled = NO;
}

#pragma mark - Gestures

- (IBAction)swipeLeftAction:(UISwipeGestureRecognizer *)sender {
    [self.gameWebView stringByEvaluatingJavaScriptFromString:@"swipeLeft();"];
    [self checkGameFinish];
}

- (IBAction)swipeRightAction:(UISwipeGestureRecognizer *)sender {
    [self.gameWebView stringByEvaluatingJavaScriptFromString:@"swipeRight();"];
    [self checkGameFinish];
}

- (IBAction)swipeUpAction:(UISwipeGestureRecognizer *)sender {
    [self.gameWebView stringByEvaluatingJavaScriptFromString:@"swipeUp();"];
    [self checkGameFinish];
}

- (IBAction)swipeDownAction:(UISwipeGestureRecognizer *)sender {
    [self.gameWebView stringByEvaluatingJavaScriptFromString:@"swipeDown();"];
    [self checkGameFinish];
}

#pragma mark - Private methods

- (void)checkGameFinish {
    NSString * result = [self.gameWebView stringByEvaluatingJavaScriptFromString:@"isFinish()"];
    if ([result isEqualToString:@"1"]) {
        self.gestureView.userInteractionEnabled = NO;
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"You won!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

@end
