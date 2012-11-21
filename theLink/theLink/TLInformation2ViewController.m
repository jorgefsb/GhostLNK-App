//
//  TLInformation2ViewController.m
//  theLink
//
//  Created by Herzon Rodríguez on 03/octubre/2012.
//  Copyright (c) 2012 VanillaSys. All rights reserved.
//

#import "TLInformation2ViewController.h"
#import "TLMenuViewController.h"

@interface TLInformation2ViewController ()

@end

@implementation TLInformation2ViewController

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
    [self.navigationItem setHidesBackButton:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextView:(id)sender {
    UIViewController *vc = self.presentingViewController;
    TLMenuViewController *controller = [[[TLMenuViewController alloc] initWithNibName:@"TLMenuViewController" bundle:nil] autorelease];
    UINavigationController *navController = [[[UINavigationController alloc] initWithRootViewController:controller] autorelease];
    navController.view.alpha = 0.0;
    [UIView animateWithDuration:0.25
                     animations:^{
                         self.view.alpha = 0.0;
                     }
                     completion:^ (BOOL finished) {
                         [self.navigationController dismissViewControllerAnimated:NO completion:^ {
                             [vc presentViewController:navController animated:NO completion:nil];
                             [UIView animateWithDuration:0.25
                                              animations:^{
                                                  navController.view.alpha = 1.0;
                                              }];
                         }];
                     }
     ];
}

@end
