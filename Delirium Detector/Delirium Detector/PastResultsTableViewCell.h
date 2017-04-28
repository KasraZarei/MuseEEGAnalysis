//
//  PastResultsTableViewCell.h
//  Delirium Detector
//
//  Created by Teresa Salino-Hugg on 4/27/17.
//  Copyright © 2017 IOT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PastResultsTableViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *dataValueLabel;
@property (nonatomic, weak) IBOutlet UILabel *dataTypeLabel;
@property (nonatomic, weak) IBOutlet UILabel *dateValueLabel;
@end
