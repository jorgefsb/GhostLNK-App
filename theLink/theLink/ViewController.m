//
//  ViewController.m
//  theLink
//
//  Created by Herzon Rodríguez on 03/octubre/2012.
//  Copyright (c) 2012 VanillaSys. All rights reserved.
//

#import "ViewController.h"
#import "TLInformation1ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize loadingView = _loadingView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self performSelector:@selector(removeSplash) withObject:nil afterDelay:3.0];
}

- (void)removeSplash {
//    [_loadingView removeFromSuperview];
    
//    UITapGestureRecognizer *tap = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nextView:)] autorelease];
//    [self.view addGestureRecognizer:tap];
    [self nextView:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextView:(id)sender {
    TLInformation1ViewController *controller = [[[TLInformation1ViewController alloc] initWithNibName:@"TLInformation1ViewController" bundle:nil] autorelease];
    UINavigationController *navController = [[[UINavigationController alloc] initWithRootViewController:controller] autorelease];
    
    
    navController.view.alpha = 0.0;
    
    [UIView animateWithDuration:0.25
                     animations:^{
                         self.view.alpha = 0.0;
                     }
                     completion:^ (BOOL finished) {
                         [UIView animateWithDuration:0.25
                                          animations:^{
                                              navController.view.alpha = 1.0;
                                              [self presentViewController:navController animated:NO completion:nil];
                                              self.view.alpha = 1.0;
                                          }];
                    }
     ];
}

@end
