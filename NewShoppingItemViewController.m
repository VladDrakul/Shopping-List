//
//  NewShoppingItemViewController.m
//  TestingTables
//
//  Created by devin wakefield on 5/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NewShoppingItemViewController.h"

@implementation NewShoppingItemViewController

@synthesize doneButton, nameTextField, stepper, categoryTextField, parent, parameter, index;


//textFieldTouched is simple; it just makes the textField be blank when the user 
//clicks it
-(IBAction) textFieldTouched:(UITextField *)sender{
    sender.text = @"";
}

- (IBAction)dismissKeyboard{
    [nameTextField resignFirstResponder];
}

/*
 
 Function:      handleDoneButton
 
 Description:   This does a bunch of work that the ItemsTableController should do, but because of (I think) some threading, I can't do what I actually want, so this does the actual work, and it works! I tested it and it worked! I'm so proud! Yayyy! :)
 
 */

-(IBAction) handleDoneButton{
    //This needs to tell the ItemsTableController what the new information is. So... need to get the table... with PARENT IVAR! WOOT! I CAN DO IT!
    
    Item *newItem = [[Item alloc] initWithName:nameTextField.text withCategory: (NSString *)[parent.categories objectAtIndex:stepper.value] withChecked:NO];
    parent.newerItem = newItem;
    
    switch (parameter) {
        case 0:
            [parent.items addItem:newItem atIndex:index];
            break;
        case 1:
            [parent.items addItem:newItem atIndex:index+1];
            break;
        case 2:
            [parent.items removeItemAtIndex:index];
            [parent.items addItem:newItem atIndex:index];
            break;
            
        default:
            break;
    }

    [parent.tableView reloadData];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:NULL];

}

/*
 
 Function: handleStepper
 
 Description:   This basically changes the categoryTextField to be whatever category the new Item is. Yayyyy can do it!
 
 */

-(IBAction) handleStepper{
    //roar! 		FOOD, CLOTHING, LUXURY, HOUSING, ENTERTAINMENT, BUSINESS, OTHER


    categoryTextField.text = [[parent categories] objectAtIndex:(NSInteger) stepper.value];

    
    //categoryTextField.text = @"roar";
    
 /*   switch ((int) stepper.value) {
        case 0:
            categoryTextField.text = @"Food!";
            break;
        case 1:
            categoryTextField.text = @"Clothing!";
            break;
        case 2:
            categoryTextField.text = @"Luxury!";
            break;
        case 3:
            categoryTextField.text = @"Housing!";
            break;
        case 4:
            categoryTextField.text = @"Entertainment!";
            break;
        case 5:
            categoryTextField.text = @"Business!";
            break;
        case 6:
            categoryTextField.text = @"Other!";
            break;
            
        default:
            break;
    }*/
}

/*
 * Method:      handleTextEntered
 *
 * Description: this method takes the text entered in the categoryTextField and then puts it into the categories NSMutableArray in the ItemsTableController. it then gets rid of the keyboard with resignFirstResponder.
 */

-(IBAction) handleTextEntered{
    [[parent categories] addObject:categoryTextField.text];
    stepper.maximumValue++;
    stepper.value = [[parent categories] indexOfObject:categoryTextField.text];
    [categoryTextField resignFirstResponder];
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
    
    //Basically I need to do some stepper initializing/customization:
    
    stepper.wraps = YES;
    if ([parent.categories count] == 0) {
        stepper.maximumValue = 0;
    }else{
        stepper.maximumValue = [parent.categories count]-1;
    }
    stepper.minimumValue = 0;
    
    if ((int) stepper.value == 0) {
        categoryTextField.text = @"";
    } else {
        categoryTextField.text = [[parent categories] objectAtIndex:(NSInteger) stepper.value];
    }

     
    //categories = [[NSMutableArray alloc] init];
    
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
