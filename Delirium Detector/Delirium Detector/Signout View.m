//
//  Signout View.m
//  Delirium Detector
//
//  Created by Tejaswi Rohit Anupindi on 4/10/17.
//  Copyright © 2017 IOT. All rights reserved.
//

#import "Signout View.h"
@import Firebase;

@interface Signout_View ()

@end

@implementation Signout_View


-(void) viewDidAppear:(BOOL)animated{
    [GIDSignIn sharedInstance].uiDelegate = self;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)signoutAction:(id)sender {
    
    if ([FIRAuth auth].currentUser) {
        NSLog(@"User is signed in.");
        // ...
    } else {
        NSLog(@"User is not  signed in.");

        // No user is signed in.
        // ...
    }
    
    NSLog(@"Touch up inside");
    NSError *signOutError;
    BOOL status = [[FIRAuth auth] signOut:&signOutError];
    if (!status) {
        NSLog(@"Error signing out: %@", signOutError);
        return;
    }
    [[GIDSignIn sharedInstance] signOut];
    //[self dismissViewControllerAnimated:true completion:nil];
}
@end


