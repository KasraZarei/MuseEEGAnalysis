//
//  PastResultsViewController.m
//  Delirium Detector
//
//  Created by MDM528 on 4/25/17.
//  Copyright © 2017 IOT. All rights reserved.
//

#import "PastResultsViewController.h"
@import Firebase;
@import FirebaseDatabase;
@import FirebaseAuth;
@interface PastResultsViewController ()
@property (strong, nonatomic) FIRDatabaseReference *ref;
@end

@implementation PastResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;// counter for rows
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *SimpleIdentifier = @"SimpleIdentifier";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:SimpleIdentifier];
    if (cell == nil){
        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleIdentifier];
    }
    //
    return cell;
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
