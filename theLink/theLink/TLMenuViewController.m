//
//  TLMenuViewController.m
//  theLink
//
//  Created by Herzon Rodríguez on 03/octubre/2012.
//  Copyright (c) 2012 VanillaSys. All rights reserved.
//

#import "TLMenuViewController.h"
#import "TLSpiritConnectViewController.h"
#import "TLInformationViewController.h"
#import "TLMoreInformationViewController.h"
#import "Flurry.h"

#import "AFABNotificationBar.h"

@interface TLMenuViewController ()

@end

@implementation TLMenuViewController

@synthesize cameraOverlayView = _cameraOverlayView;

@synthesize photoPreviewOverlayView = _photoPreviewOverlayView;
@synthesize photoPreviewView = _photoPreviewView;
@synthesize photoPreviewImageView = _photoPreviewImageView;

@synthesize savingPhotoView = _savingPhotoView;
@synthesize activityImageView = _activityImageView;

- (void)dealloc {
    [_cameraOverlayView release];
    [_photoPreviewOverlayView release];
    [_photoPreviewView release];
    [_photoPreviewImageView release];
    [_savingPhotoView release];
    [_activityImageView release];
    [super dealloc];
}

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
    _cameraOverlayView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cameraOverlay.png"]];//[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
    _photoPreviewOverlayView.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"cameraOverlay.png"]]; //[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
    _savingPhotoView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
    _savingPhotoView.layer.cornerRadius = 10.0;
    
    _adWhirlView = [[AdWhirlView requestAdWhirlViewWithDelegate:self] retain];
    [self.view addSubview:_adWhirlView];
    
    
    [Flurry startSession:@"Q9VQGZKB4P24GQPF26B9"];
    
//    AFABNotificationBar *bar = [[AFABNotificationBar alloc] initWithFrame:self.view.bounds];
//    bar.frame = CGRectMake(bar.frame.origin.x, self.view.frame.origin.y, bar.frame.size.width, bar.frame.size.height);
//    [bar setShowWhenCountIsZero:NO];
//    [self.view addSubview:bar];
//    [bar release];
//    [FlurryAds initialize:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
   [FlurryAds setAdDelegate:self];
    
        // 1. Fetch and display banner ads
    [FlurryAds fetchAndDisplayAdForSpace:@"Bottom"
                                    view:self.view size:BANNER_BOTTOM];
    
        // 2. Fetch fullscreen ads for later display
	[FlurryAds fetchAdForSpace:@"Bottom"
                         frame:self.view.frame size:FULLSCREEN];
}

- (void)viewDidUnload {
    [super viewDidUnload];
        // Remove Banner Ads and reset delegate
	[FlurryAds removeAdFromSpace:@"Bottom"];
    
	[FlurryAds setAdDelegate:nil];
	
}

-(IBAction) showFullScreenAdClickedButton:(id)sender {
    
        // Check if ad is ready. If so, display the ad
    if ([FlurryAds adReadyForSpace:@"Bottom"]) {
    	[FlurryAds displayAdForSpace:@"Bottom"
                              onView:self.view];
	} else {
            // fetch an ad
        [FlurryAds fetchAdForSpace:@"Bottom"
                             frame:self.view.frame size:FULLSCREEN];
	}
}

- (void)spaceDidReceiveAd:(NSString *)adSpace {
	NSLog(@"=========== Ad Space [%@] Did Receive Ad ================ ", adSpace);
    if ([adSpace isEqualToString:@"Bottom"]) {
    	[FlurryAds displayAdForSpace:adSpace onView:self.view];
	}
}*/

#pragma mark - AdWhirlViewDelegate Methods

- (NSString *)adWhirlApplicationKey {
    return @"8fc8995a37734921a9cef9abb198c679";
}

- (UIViewController *)viewControllerForPresentingModalView {
    return self;
}

- (void)adWhirlDidReceiveAd:(AdWhirlView *)adWhirlView {
    NSLog(@"adWhirlDidReceiveAd:");
    
    [UIView beginAnimations:@"anim" context:nil];
    
    [UIView setAnimationDuration:0.7];
    
    CGSize adSize = [_adWhirlView actualAdSize];
    CGRect newFrame = _adWhirlView.frame;
    
    newFrame.size = adSize;
    newFrame.origin.x = (self.view.bounds.size.width - adSize.width)/ 2;
    newFrame.origin.y = (self.view.bounds.size.height - adSize.height);
    
    _adWhirlView.frame = newFrame;
    
    [UIView commitAnimations];
}

- (void)adWhirlDidFailToReceiveAd:(AdWhirlView *)adWhirlView usingBackup:(BOOL)yesOrNo {
    NSLog(@"adWhirlDidFailToReceiveAd:");
}

- (void)adWhirlDidAnimateToNewAdIn:(AdWhirlView *)adWhirlView {
    NSLog(@"adWhirlDidAnimateToNewAdIn:");
}

#pragma mark - Other Methods

- (IBAction)chatWithSpirit:(id)sender {
    TLSpiritConnectViewController *controller = [[[TLSpiritConnectViewController alloc] initWithNibName:@"TLSpiritConnectViewController" bundle:nil] autorelease];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)presentPhotoController:(id)sender {
    UIImagePickerController *pickerController = [[[UIImagePickerController alloc] init] autorelease];
	pickerController.delegate = self;
	pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    pickerController.showsCameraControls = NO;
    _cameraOverlayView.frame = CGRectMake(0, 427, _cameraOverlayView.frame.size.width, _cameraOverlayView.frame.size.height);
    
    pickerController.wantsFullScreenLayout = YES;
    pickerController.view.autoresizesSubviews = NO;
	[self presentViewController:pickerController animated:YES completion:^{
        pickerController.cameraOverlayView = _cameraOverlayView;
    }];
}

- (IBAction)moreInformationController:(id)sender {
    TLMoreInformationViewController *controller = [[[TLMoreInformationViewController alloc] initWithNibName:@"TLMoreInformationViewController" bundle:nil] autorelease];
    UINavigationController *nav = [[[UINavigationController alloc] initWithRootViewController:controller] autorelease];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
}

- (IBAction)informationController:(id)sender {
    TLInformationViewController *controller = [[[TLInformationViewController alloc] initWithNibName:@"TLInformationViewController" bundle:nil] autorelease];
    UINavigationController *nav = [[[UINavigationController alloc] initWithRootViewController:controller] autorelease];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
}

- (IBAction)cancelPhoto:(id)sender {
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)takePhoto:(id)sender {
    UIImagePickerController *controller = (UIImagePickerController *)self.presentedViewController;
    _cameraOverlayView.userInteractionEnabled = NO;
    [controller takePicture];
}

- (IBAction)retakePhoto:(id)sender {
    _photoPreviewOverlayView.userInteractionEnabled = NO;
    _photoPreviewImageView.image = nil;
    [_photoPreviewView removeFromSuperview];
    _cameraOverlayView.userInteractionEnabled = YES;
}

- (IBAction)savePhoto:(id)sender {
    _savingPhotoView.hidden = NO;
    
    CABasicAnimation* spinAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    spinAnimation.toValue = [NSNumber numberWithFloat:10*M_PI];
    spinAnimation.duration = 2.5;
    spinAnimation.repeatCount = NSIntegerMax;
    [_activityImageView.layer addAnimation:spinAnimation forKey:@"spinAnimation"];
    
    _photoPreviewOverlayView.userInteractionEnabled = NO;
    UIImage *imageToSave = _photoPreviewImageView.image;
    UIImageWriteToSavedPhotosAlbum(imageToSave, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

- (void)image:(UIImage*)image didFinishSavingWithError:(NSError *)error contextInfo:(NSDictionary*)info {
    NSString *title = @"Error";
    NSString *message = @"There was an error trying to save the image. Try again later.";
    if (!error) {
        title = @"Success";
        message = @"Image saved to your camera roll!";
        [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
    }
    
    _photoPreviewView.userInteractionEnabled = YES;
    _savingPhotoView.hidden = YES;
    _cameraOverlayView.userInteractionEnabled = YES;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

- (void)dismissPickerController {
    
}

#pragma mark - UIImagePickerControllerDelegate Methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    _photoPreviewImageView.image = [self lala:image];
    _photoPreviewView.frame = CGRectMake(0, 0, picker.view.frame.size.width, picker.view.frame.size.height);
    [picker.view addSubview:_photoPreviewView];
    _photoPreviewOverlayView.userInteractionEnabled = YES;
}

- (UIImage *)lala:(UIImage *)inputImage {
    CGFloat width = inputImage.size.width;
    CGFloat height = inputImage.size.height;
    
        // create a new bitmap image context
        //
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    
        // get context
        //
    CGContextRef context = UIGraphicsGetCurrentContext();
    
        // push context to make it current
        // (need to do this manually because we are not drawing in a UIView)
        //
    UIGraphicsPushContext(context);
    
        //
        // [drawing code comes here- look at CGContext reference
        // for available operations]
        //
    
        // this example draws the inputImage into the context
        //
    [inputImage drawInRect:CGRectMake(0, 0, width, height)];
    
    srandom(time(NULL));
    int ghostPic = (random() % 3)+1;
    UIImage *d = [UIImage imageNamed:[NSString stringWithFormat:@"ghost_%d.png", ghostPic]];
    CGRect imageRect = CGRectMake(0, 0, width, height);
    [d drawInRect:imageRect blendMode:kCGBlendModeOverlay alpha:1.0];
    
        // pop context
        //
    UIGraphicsPopContext();
    
        // get a UIImage from the image context- enjoy!!!
        //
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    
        // clean up drawing environment
        //
    UIGraphicsEndImageContext();
    
    return outputImage;
}

- (UIImage*)overlayWith:(UIImage*)overlayImage {
    
        // size is taken from the background image
	UIGraphicsBeginImageContext(overlayImage.size);
        // draw img at 0,0 in the context
    [overlayImage drawAtPoint:CGPointZero];
    
        // draw another at 0,0 in the context, maybe with an alpha value
    srandom(time(NULL));
    int ghostPic = random() % 3;
    UIImage *d = [UIImage imageNamed:[NSString stringWithFormat:@"ghost_%d.png", ghostPic]];
    CGRect imageRect = CGRectMake(0, 0, overlayImage.size.width, overlayImage.size.height);
    [d drawInRect:imageRect blendMode:kCGBlendModeOverlay alpha:1.0];
    
        // ... and other operations
    
        // assign context to UIImage
    UIImage *outputImg = UIGraphicsGetImageFromCurrentImageContext();
    
        // end context
    UIGraphicsEndImageContext();
	/*
     // If Image Artifacts appear, replace the "overlayImage drawAtPoint" , method with the following
     // Yes, it's a workaround, yes I filed a bug report
     CGRect imageRect = CGRectMake(0, 0, self.size.width, self.size.height);
     [overlayImage drawInRect:imageRect blendMode:kCGBlendModeOverlay alpha:0.999999999];
     */
	return outputImg;
}

@end
