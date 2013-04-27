//
//  smkViewController.h
//  JSMobilePuzzleGame
//
//  Created by smk-dev on 25.04.2013.
//  Copyright (c) 2013 smk-dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface smkGameViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *gameWebView;

- (IBAction)newGameButtonAction:(id)sender;
- (IBAction)solveButtonAction:(id)sender;

@end
