//
//  SettingsViewController.m
//  Shopping_List
//
//  Created by devin wakefield on 6/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SettingsViewController.h"
#import "MyLocationViewController.h"

@implementation SettingsViewController

@synthesize parent, myNewLocation, done, myNewRadius, myNewCoordinates;

-(IBAction)setNewLocation:(id)sender{
    UIStoryboard *storyboard = self.storyboard;
    MyLocationViewController *newLoc = [storyboard instantiateViewControllerWithIdentifier:@"myLocationVC"];  
    
    newLoc.parent = self;
    
    
    [self presentModalViewController:newLoc animated:YES];
}

-(IBAction)done:(id)sender{
    
    [self.presentingViewController dismissModalViewControllerAnimated:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization BLAHAHAHAHAHAHHA
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
