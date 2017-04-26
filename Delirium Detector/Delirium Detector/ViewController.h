//
//  ViewController.h
//  Delirium Detector
//
//  Created by Aman Gupta on 3/19/17.
//  Copyright © 2017 IOT. All rights reserved.
//

#import <UIKit/UIKit.h>
@import UIKit;
@import Firebase;
@import GoogleSignIn;

@interface ViewController : UIViewController
@end
@interface MainViewController : UITableViewController<GIDSignInUIDelegate>


@end

