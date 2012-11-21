//
//  TLSpiritChatViewController.h
//  theLink
//
//  Created by Herzon Rodríguez on 04/octubre/2012.
//  Copyright (c) 2012 VanillaSys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLGeneralViewController.h"

@interface TLSpiritConnectViewController : TLGeneralViewController {
    
}

@property (nonatomic, retain) IBOutlet UITextField *spiritNameTextField;
@property (nonatomic, retain) IBOutlet UIImageView *activityImageView;

@property (nonatomic, retain) IBOutlet UIImageView *failedImageView;
@property (nonatomic, retain) IBOutlet UILabel *textLabel;

@end
