//
//  smkViewController.m
//  JSMobilePuzzleGame
//
//  Created by smk-dev on 25.04.2013.
//  Copyright (c) 2013 smk-dev. All rights reserved.
//

#import "smkGameViewController.h"

@implementation smkGameViewController

@synthesize gameWebView = _gameWebView;

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

- (void)dealloc {
    _gameWebView = nil;
}

#pragma mark - Actions

- (IBAction)newGameButtonAction:(id)sender {
    [self.gameWebView stringByEvaluatingJavaScriptFromString:@"newGame();"];
}

- (IBAction)solveButtonAction:(id)sender {
    [self.gameWebView stringByEvaluatingJavaScriptFromString:@"solve();"];
}

#pragma mark - Gestures

@end
