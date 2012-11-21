//
//  TLInformationViewController.m
//  theLink
//
//  Created by Herzon Rodríguez on 19/octubre/2012.
//  Copyright (c) 2012 VanillaSys. All rights reserved.
//

#import "TLInformationViewController.h"

@interface TLInformationViewController ()

@end

@implementation TLInformationViewController

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
    // Do any additional setup after loading the view from its nib.
//    UIBarButtonItem *item = [[[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(dismissController)] autorelease];
//    self.navigationItem.leftBarButtonItem = item;
    UIButton *b = [UIButton buttonWithType:UIButtonTypeCustom];
    [b setFrame:CGRectMake(0, 0, 75, 28)];
    [b setImage:[UIImage imageNamed:@"backButton.png"] forState:UIControlStateNormal];
    [b addTarget:self action:@selector(dismissController) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[[UIBarButtonItem alloc] initWithCustomView:b] autorelease];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismissController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)openLink:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://www.facebook.com/karaokulta"];
    [[UIApplication sharedApplication] openURL:url];
}

@end
