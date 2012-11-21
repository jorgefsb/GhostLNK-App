//
//  TLGeneralViewController.m
//  theLink
//
//  Created by Herzon Rodríguez on 05/octubre/2012.
//  Copyright (c) 2012 VanillaSys. All rights reserved.
//

#import "TLGeneralViewController.h"

@interface TLGeneralViewController ()

@end

@implementation TLGeneralViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"generalBackground.png"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)popController {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
