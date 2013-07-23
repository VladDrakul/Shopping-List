//
//  NewShoppingListVC.m
//  Shopping_List
//
//  Created by devin wakefield on 5/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NewShoppingListVC.h"
#import "ShoppingList.h"
#import "MapViewController.h"
#import "AppDelegate.h"

@implementation NewShoppingListVC

@synthesize nameTextField, doneButton, parent, distance, coord;

- (IBAction)dismissKeyboard{
    [nameTextField resignFirstResponder];
    
}

- (IBAction) newLocationButton{
    
    UIStoryboard *storyboard = self.storyboard;
    MapViewController *newLoc = [storyboard instantiateViewControllerWithIdentifier:@"mapVC"];
    
    newLoc.parent = self;
    
    [self presentModalViewController:newLoc animated:YES];
    
    
    /*
     UIStoryboard *storyboard = self.storyboard;
     NewShoppingItemViewController *newItemVC = [storyboard instantiateViewControllerWithIdentifier:@"newItemVC"];
     newItemVC.parent = self;
     newItemVC.parameter = param;
     newItemVC.index = editRowIndex;
     [self presentViewController:newItemVC animated:YES completion:NULL];
     
     
     */
    
}

- (IBAction)handleDoneButton{
    [parent addList:[[ShoppingList alloc] initWithName:nameTextField.text andCoordinate:coord andRadius:distance]];
    
    [parent.tableView reloadData];
    
    /*UIApplication *app = [UIApplication sharedApplication];
    AppDelegate *delegate = app.delegate;*/
    
    
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:NULL];

}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

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
