//
//  AppDelegate.h
//  Delirium Detector
//
//  Created by Aman Gupta on 3/19/17.
//  Copyright © 2017 IOT. All rights reserved.
//

#import <UIKit/UIKit.h>
@import UIKit;
@import Firebase;
@import GoogleSignIn;


@interface AppDelegate : UIResponder <UIApplicationDelegate, GIDSignInDelegate>


@property (strong, nonatomic) UIWindow *window;


@end

