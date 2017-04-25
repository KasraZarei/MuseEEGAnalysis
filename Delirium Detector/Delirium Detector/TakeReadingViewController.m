//
//  TakeReadingViewController.m
//  Delirium Detector
//
//  Created by Teresa Salino-Hugg on 4/24/17.
//  Copyright © 2017 IOT. All rights reserved.
//

#import "TakeReadingViewController.h"
@import Firebase;
@import FirebaseDatabase;
@import FirebaseAuth;

@interface TakeReadingViewController ()
@property (strong, nonatomic) FIRDatabaseReference *ref;
@end

@implementation TakeReadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logAction:(id)sender {
    NSLog(@"Button Pressed");
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    // or @"yyyy-MM-dd hh:mm:ss a" if you prefer the time with AM/PM
    NSString *dateAsString = [dateFormatter stringFromDate:[NSDate date]];
#ifdef DEBUG
    NSLog(@"%@", dateAsString);
#endif
    
    FIRUser *user = [FIRAuth auth].currentUser;
    
    self.ref = [[[FIRDatabase database] reference] child:user.uid];//rootFirebase/currentUserId
    [[[_ref child:@"results"] childByAutoId] setValue:@{@"date":dateAsString}];
    //[[[_ref child:user.uid] childByAutoId] setValue:@{@"value":dateAsString}];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
