//
//  ViewController.m
//  Delirium Detector
//
//  Created by Aman Gupta on 3/19/17.
//  Copyright © 2017 IOT. All rights reserved.
//

#import "ViewController.h"
@import UIKit;
@import Firebase;
@import GoogleSignIn;

@interface ViewController ()

@end

@implementation ViewController



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewDidAppear:(BOOL)animated{
    [GIDSignIn sharedInstance].uiDelegate = self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // TODO(developer) Configure the sign-in button look/feel
    
    // ...
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(changeView)
                                                 name:@"TestNotification"
                                               object:nil];
}

-(void) changeView{
    NSLog(@"Test passed");
    [self performSegueWithIdentifier:@"test" sender:self];
}


@end
