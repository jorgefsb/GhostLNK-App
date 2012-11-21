//
//  TLMoreInformationViewController.m
//  theLink
//
//  Created by Herzon Rodríguez on 16/octubre/2012.
//  Copyright (c) 2012 VanillaSys. All rights reserved.
//

#import "TLMoreInformationViewController.h"

@interface TLMoreInformationViewController ()

@end

@implementation TLMoreInformationViewController

@synthesize tableView = _tableView;

- (void)dealloc {
    [_moreAppsArray release];
    [_tableView release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _moreAppsArray = [[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"MoreApps" ofType:@"plist"]] retain];
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

#pragma mark - UITableViewDataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_moreAppsArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"identifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.detailTextLabel.textColor = [UIColor darkGrayColor];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;

    }
    
    NSDictionary *dict = [_moreAppsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [dict objectForKey:@"title"];
    cell.detailTextLabel.text = [dict objectForKey:@"description"];
    cell.imageView.image = [UIImage imageNamed:[dict objectForKey:@"icon"]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.backgroundColor = indexPath.row % 2 ? [UIColor lightGrayColor] : [UIColor grayColor];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dict = [_moreAppsArray objectAtIndex:indexPath.row];
    if (![[dict objectForKey:@"link"] isEqualToString:@""]) {
        NSURL *url = [NSURL URLWithString:[dict objectForKey:@"link"]];
        [[UIApplication sharedApplication] openURL:url];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"ComingSoon", nil)
                                                        message:nil
                                                       delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"Accept", nil)
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - URL Openning English

    //Missal in audio and Daily Readings
- (IBAction)link1_English:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://click.linksynergy.com/fs-bin/stat?id=t2lzWo0r0/E&offerid=243958&type=3&subid=0&tmpid=1826&RD_PARM1=http%253A%252F%252Fitunes.apple.com%252Fus%252Fapp%252Fmissal-in-audio-daily-readings%252Fid455967431%253Fmt%253D8%2526uo%253D4%2526partnerId%253D30"];
    [[UIApplication sharedApplication] openURL:url];
}

    //US Border Wait Time
- (IBAction)link2_English:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://click.linksynergy.com/fs-bin/stat?id=t2lzWo0r0/E&offerid=243958&type=3&subid=0&tmpid=1826&RD_PARM1=http%253A%252F%252Fitunes.apple.com%252Fus%252Fapp%252Fus-border-wait-time%252Fid441109185%253Fmt%253D8%2526uo%253D4%2526partnerId%253D30"];
    [[UIApplication sharedApplication] openURL:url];
}

    //Vatican - News, Online Radio and the bible in American English
- (IBAction)link3_English:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://click.linksynergy.com/fs-bin/stat?id=t2lzWo0r0/E&offerid=243958&type=3&subid=0&tmpid=1826&RD_PARM1=http%253A%252F%252Fitunes.apple.com%252Fus%252Fapp%252Fvatican-news-online-radio%252Fid441843676%253Fmt%253D8%2526uo%253D4%2526partnerId%253D30"];
    [[UIApplication sharedApplication] openURL:url];
}

    //Election Wars and Cheats
- (IBAction)link4_English:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://click.linksynergy.com/fs-bin/stat?id=t2lzWo0r0/E&offerid=243958&type=3&subid=0&tmpid=1826&RD_PARM1=https%253A%252F%252Fitunes.apple.com%252Fus%252Fapp%252Felection-wars-and-cheats%252Fid541896503%253Fmt%253D8%2526uo%253D4%2526partnerId%253D30"];
    [[UIApplication sharedApplication] openURL:url];
}

    //Ghost Link
- (IBAction)link5_English:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Coming Soon"
                                                    message:nil
                                                   delegate:nil
                                          cancelButtonTitle:@"Accept"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

    //Gusanito Emoji - Emoticons, icons and symbols of wamba, wippo and familiy
- (IBAction)link6_English:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Coming Soon"
                                                    message:nil
                                                   delegate:nil
                                          cancelButtonTitle:@"Accept"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

#pragma mark - URL Openning Spanish

    //Misal 2012
- (IBAction)link1_Spanish:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://click.linksynergy.com/fs-bin/stat?id=t2lzWo0r0/E&offerid=243958&type=3&subid=0&tmpid=1826&RD_PARM1=http%253A%252F%252Fitunes.apple.com%252Fmx%252Fapp%252Fmisal-2012%252Fid490423084%253Fmt%253D8%2526uo%253D4%2526partnerId%253D30"];
    [[UIApplication sharedApplication] openURL:url];
}

    //Misal 2011
- (IBAction)link2_Spanish:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://click.linksynergy.com/fs-bin/stat?id=t2lzWo0r0/E&offerid=243958&type=3&subid=0&tmpid=1826&RD_PARM1=http%253A%252F%252Fitunes.apple.com%252Fmx%252Fapp%252Fmisal-2011%252Fid448307739%253Fmt%253D8%2526uo%253D4%2526partnerId%253D30"];
    [[UIApplication sharedApplication] openURL:url];
}

    //US Border Wait time : Tiempo de espera para cruzar frontera desde México a EU en coche
- (IBAction)link3_Spanish:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://click.linksynergy.com/fs-bin/stat?id=t2lzWo0r0/E&offerid=243958&type=3&subid=0&tmpid=1826&RD_PARM1=http%253A%252F%252Fitunes.apple.com%252Fmx%252Fapp%252Fus-border-wait-time-tiempo%252Fid441109185%253Fmt%253D8%2526uo%253D4%2526partnerId%253D30"];
    [[UIApplication sharedApplication] openURL:url];
}

    //Vaticano - Noticias, Radio en linea y biblia
- (IBAction)link4_Spanish:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://click.linksynergy.com/fs-bin/stat?id=t2lzWo0r0/E&offerid=243958&type=3&subid=0&tmpid=1826&RD_PARM1=http%253A%252F%252Fitunes.apple.com%252Fmx%252Fapp%252Fvaticano-noticias-radio-en%252Fid436687586%253Fmt%253D8%2526uo%253D4%2526partnerId%253D30"];
    [[UIApplication sharedApplication] openURL:url];
}

    //Tráfico de Guadalajara
- (IBAction)link5_Spanish:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://click.linksynergy.com/fs-bin/stat?id=t2lzWo0r0/E&offerid=243958&type=3&subid=0&tmpid=1826&RD_PARM1=http%253A%252F%252Fitunes.apple.com%252Fus%252Fapp%252Ftrafico-de-guadalajara%252Fid428607370%253Fmt%253D8%2526uo%253D4%2526partnerId%253D30"];
    [[UIApplication sharedApplication] openURL:url];
}

    //Nudos de corbata en video con separación de color
- (IBAction)link6_Spanish:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://click.linksynergy.com/fs-bin/stat?id=t2lzWo0r0/E&offerid=243958&type=3&subid=0&tmpid=1826&RD_PARM1=https%253A%252F%252Fitunes.apple.com%252Fmx%252Fapp%252Fnudos-corbata-en-video-con%252Fid436654120%253Fmt%253D8%2526uo%253D4%2526partnerId%253D30"];
    [[UIApplication sharedApplication] openURL:url];
}

    //Guerras Electorales
- (IBAction)link7_Spanish:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://click.linksynergy.com/fs-bin/stat?id=t2lzWo0r0/E&offerid=243958&type=3&subid=0&tmpid=1826&RD_PARM1=https%253A%252F%252Fitunes.apple.com%252Fmx%252Fapp%252Fguerras-electorales%252Fid514441394%253Fmt%253D8%2526uo%253D4%2526partnerId%253D30"];
    [[UIApplication sharedApplication] openURL:url];
}

    //Ghost Link
- (IBAction)link8_Spanish:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Proximamente"
                                                    message:nil
                                                   delegate:nil
                                          cancelButtonTitle:@"Aceptar"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

    //Gusanito Emoji - Emoticons, icons and symbols of wamba, wippo and familiy
- (IBAction)link9_Spanish:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Proximamente"
                                                    message:nil
                                                   delegate:nil
                                          cancelButtonTitle:@"Aceptar"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

@end
