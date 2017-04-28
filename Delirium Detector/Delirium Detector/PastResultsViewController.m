//
//  PastResultsViewController.m
//  Delirium Detector
//
//  Created by MDM528 on 4/25/17.
//  Copyright © 2017 IOT. All rights reserved.
//

#import "PastResultsViewController.h"
#import "PastResultsTableViewCell.h"
@import Firebase;
@import FirebaseDatabase;
@import FirebaseAuth;
@interface PastResultsViewController ()
@property (strong, nonatomic) FIRDatabaseReference *ref;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation PastResultsViewController

NSDictionary *postDictionary;

NSDictionary *surveyData;
NSDictionary *EEGData;

NSArray *surveyScoreArray;
NSArray *surveyDateArray;
NSArray *EEGScoreArray;
NSArray *EEGDateArray;
NSArray *DisplayedScoreArray;
NSArray *DisplayedDateArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FIRUser *user = [FIRAuth auth].currentUser;
    self.ref = [[[FIRDatabase database] reference] child:user.uid];//rootFirebase/currentUserId
    [_ref observeSingleEventOfType: FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot){
        
        postDictionary = snapshot.value;
        surveyData = [postDictionary valueForKey:@"Survey Data"];
        EEGData = [postDictionary valueForKey:@"results"];
 
        surveyScoreArray = [[surveyData allValues] valueForKey:@"Overall Score"];
        surveyDateArray = [[surveyData allValues] valueForKey:@"date"];
        //EEGScoreArray = [[EEGData allValues] valueForKey:@"Overall Score"];
        EEGDateArray = [[EEGData allValues] valueForKey:@"date"];
        
        NSLog(@"%@",EEGScoreArray);
        NSLog(@"%@",EEGDateArray);
        NSLog(@"%@",surveyScoreArray);
        NSLog(@"%@",surveyDateArray);
        [_tableView reloadData];
    }];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(segmentResultFilter.selectedSegmentIndex == 0){
        DisplayedDateArray = EEGDateArray;
        DisplayedScoreArray = EEGScoreArray;
    }
    else{
        DisplayedDateArray = surveyDateArray;
        DisplayedScoreArray = surveyScoreArray;
    }
    NSLog(@"%lu",[DisplayedDateArray count]);
    return [DisplayedDateArray count];// counter for rows
}
- (PastResultsTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *SimpleIdentifier = @"BasicResult";
    PastResultsTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:SimpleIdentifier];
    if (cell == nil){
        cell =[[PastResultsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleIdentifier];
    }
    //cell.dataValueLabel.text = @"test";
     if(segmentResultFilter.selectedSegmentIndex == 0){
         cell.dataTypeLabel.text = @"EEG Result:";
     }
     else{
         cell.dataTypeLabel.text = @"Survey Result:";
         cell.dataValueLabel.text = DisplayedScoreArray[indexPath.row];
     }
    cell.dateValueLabel.text = DisplayedDateArray[indexPath.row];
    //
    return cell;
}

- (IBAction)updateFilter:(id)sender{
    [_tableView reloadData];
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
