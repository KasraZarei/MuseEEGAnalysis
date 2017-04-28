//
//  SurveyViewController.h
//  Delirium Detector
//
//  Created by Teresa Salino-Hugg on 4/24/17.
//  Copyright © 2017 IOT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SurveyViewController : UIViewController{
    
    IBOutlet UISegmentedControl *segmentQ1;
    IBOutlet UISegmentedControl *segmentQ2;
    IBOutlet UISegmentedControl *segmentQ3;
    IBOutlet UISegmentedControl *segmentQ4;
    IBOutlet UISegmentedControl *segmentQ5;
    IBOutlet UISegmentedControl *segmentQ6;
    IBOutlet UISegmentedControl *segmentQ7;
    
    IBOutlet UILabel *label;
    
}
- (IBAction)pushSurveyToFirebase:(id)sender;
- (IBAction)surveyComplete:(id)sender;
@end
