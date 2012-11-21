//
//  TLSpiritChatViewController.m
//  theLink
//
//  Created by Herzon Rodríguez on 04/octubre/2012.
//  Copyright (c) 2012 VanillaSys. All rights reserved.
//

#import "TLSpiritConnectViewController.h"
#import "TLSpiritChatViewController.h"

@interface TLSpiritConnectViewController ()

@end

@implementation TLSpiritConnectViewController

@synthesize spiritNameTextField = _spiritNameTextField;
@synthesize activityImageView = _activityImageView;

@synthesize textLabel = _textLabel;
@synthesize failedImageView = _failedImageView;

- (void)dealloc {
    [_spiritNameTextField release];
    [_activityImageView release];
    
    [_textLabel release];
    [_failedImageView release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Connect with spirits";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _spiritNameTextField.layer.cornerRadius = 10.0;
    _spiritNameTextField.backgroundColor = [UIColor whiteColor];
    
    UIButton *b = [UIButton buttonWithType:UIButtonTypeCustom];
    [b setFrame:CGRectMake(0, 0, 75, 28)];
    [b setImage:[UIImage imageNamed:@"backButton.png"] forState:UIControlStateNormal];
    [b addTarget:self action:@selector(popController:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[[UIBarButtonItem alloc] initWithCustomView:b] autorelease];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)popController:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)connectWithSpirit:(id)sender {
    self.navigationItem.leftBarButtonItem.enabled = NO;
        //Start rotating
    _activityImageView.hidden = NO;
    
    CABasicAnimation* spinAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    spinAnimation.toValue = [NSNumber numberWithFloat:10*M_PI];
    spinAnimation.duration = 2.5;
    [_activityImageView.layer addAnimation:spinAnimation forKey:@"spinAnimation"];
    
    [_spiritNameTextField resignFirstResponder];
    _spiritNameTextField.enabled = NO;
    _textLabel.text = @"Connecting...";
    _textLabel.textColor = [UIColor whiteColor];
    _textLabel.hidden = NO;
    _failedImageView.hidden = YES;
    UIButton *button = (UIButton *)sender;
    [button setImage:[UIImage imageNamed:@"connectOff.png"] forState:UIControlStateNormal];
    button.enabled = NO;
    [self performSelector:@selector(checkSpirit:) withObject:sender afterDelay:2.5];
//    [self checkSpirit:nil];
}

- (void)checkSpirit:(id)sender {
    self.navigationItem.leftBarButtonItem.enabled = YES;
    UIButton *button = (UIButton *)sender;
    [button setImage:[UIImage imageNamed:@"connectOn.png"] forState:UIControlStateNormal];
    button.enabled = YES;
    _spiritNameTextField.enabled = YES;
    _activityImageView.hidden = YES;
    srandom(time(NULL));
    int isAvailable = random() % 2;
//    int isAvailable = 1;
    if (!isAvailable) {
        _failedImageView.hidden = NO;
        _textLabel.text = @"Connection Failed.\nTry again later or seek for someone else.";
        _textLabel.textColor = [UIColor colorWithRed:145.0/255.0 green:93.0/255.0 blue:91.0/255.0 alpha:1.0];
        _textLabel.hidden = NO;
    } else {
        _textLabel.hidden = YES;
        TLSpiritChatViewController *controller = [[[TLSpiritChatViewController alloc] initWithNibName:@"TLSpiritChatViewController" bundle:nil spiritName:_spiritNameTextField.text] autorelease];
        [self.navigationController pushViewController:controller animated:YES];
    }
}

- (IBAction)hideKeyboard:(id)sender {
    [_spiritNameTextField resignFirstResponder];
}

@end
