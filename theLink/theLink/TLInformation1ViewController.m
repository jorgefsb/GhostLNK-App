//
//  TLInformation1ViewController.m
//  theLink
//
//  Created by Herzon Rodríguez on 03/octubre/2012.
//  Copyright (c) 2012 VanillaSys. All rights reserved.
//

#import "TLInformation1ViewController.h"
#import "TLInformation2ViewController.h"

@interface TLInformation1ViewController ()

@end

@implementation TLInformation1ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"GHOST LINK";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextView:(id)sender {
    TLInformation2ViewController *controller = [[[TLInformation2ViewController alloc] initWithNibName:@"TLInformation2ViewController" bundle:nil] autorelease];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
