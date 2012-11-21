//
//  TLMoreInformationViewController.h
//  theLink
//
//  Created by Herzon Rodríguez on 16/octubre/2012.
//  Copyright (c) 2012 VanillaSys. All rights reserved.
//

#import "TLGeneralViewController.h"

@interface TLMoreInformationViewController : TLGeneralViewController <UITableViewDataSource, UITableViewDelegate> {
    NSArray *_moreAppsArray;
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;

@end
