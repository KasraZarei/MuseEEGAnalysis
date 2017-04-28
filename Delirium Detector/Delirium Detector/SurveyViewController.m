//
//  SurveyViewController.m
//  Delirium Detector
//
//  Created by Teresa Salino-Hugg on 4/24/17.
//  Copyright © 2017 IOT. All rights reserved.
//

#import "SurveyViewController.h"
@import FirebaseDatabase;
@import Firebase;
@import Firebase;

@interface SurveyViewController ()
@property (strong, nonatomic) FIRDatabaseReference *ref;
@end

@implementation SurveyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //GET AND DISPLAY SURVERY QUESTIONS
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
- (IBAction)surveyComplete:(id)sender {
    //called when segment changes
    //NSLog(@"Current segment: %ld", [segmentQ1 selectedSegmentIndex]);
    
    double score = ((((double)(segmentQ1.selectedSegmentIndex+1))+((double)(segmentQ2.selectedSegmentIndex+1))+((double)(segmentQ3.selectedSegmentIndex+1))+((double)(segmentQ4.selectedSegmentIndex+1))+((double)(segmentQ5.selectedSegmentIndex+1))+((double)(segmentQ6.selectedSegmentIndex+1))+((double)(segmentQ7.selectedSegmentIndex+1)))/7);
    
    //NSLog(@"score: %f", score);
    
    NSString *finScore = [NSString stringWithFormat: @"%f", score];
    
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    // or @"yyyy-MM-dd hh:mm:ss a" if you prefer the time with AM/PM
    NSString *dateAsString = [dateFormatter stringFromDate:[NSDate date]];
    
    //NSNumber *q1Val = @(segmentQ1.selectedSegmentIndex+1);
    //NSNumber *q2Val = @(segmentQ2.selectedSegmentIndex+1);
    
    FIRUser *user = [FIRAuth auth].currentUser;
    
    self.ref = [[[FIRDatabase database] reference] child:user.uid];//rootFirebase/currentUserId
    //[[[_ref child:@"survey"] childByAutoId] setValue:@{@"Overall Score":finScore}];
    
    //self.ref =[[[[FIRDatabase database] reference] child:user.uid] child:@"survey"];//only reference survey section of current user
    //[_ref setValue:@{@"Overall Score":finScore}];
    
    NSString *key = [[_ref child:@"survey"] childByAutoId].key;
    NSDictionary *post = @{@"Overall Score": finScore,
                           @"date": dateAsString};
    NSDictionary *childUpdates = @{[@"/Survey Data/" stringByAppendingString:key]: post};
    [_ref updateChildValues:childUpdates];
}
- (IBAction)pushSurveyToFirebase:(id)sender {
    //FIRUser *user = [FIRAuth auth].currentUser;
    //self.ref =[[[[FIRDatabase database] reference] child:user.uid] child:@"survey"];//only reference survey section of current user
    //[_ref setValue:@{@"1":@"2"}];
    
    //Push surveys to Firebase/user.uid/survey/
}



@end
