//
//  PastResultsViewController.h
//  Delirium Detector
//
//  Created by MDM528 on 4/25/17.
//  Copyright © 2017 IOT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PastResultsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    IBOutlet UISegmentedControl *segmentResultFilter;
}

- (IBAction)updateFilter:(id)sender;

@end
