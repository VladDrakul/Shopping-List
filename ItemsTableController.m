//
//  ItemsTableController.m
//  TestingTables
//
//  Created by devin wakefield on 5/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ItemsTableController.h"
#import "ControlActionSheetDelegate.h"
#import "NewShoppingItemViewController.h"
#import "AppDelegate.h"

@implementation ItemsTableController
@synthesize items, controlDelegate, newerItem, categories;

-(void) sortByCategory{
    items.items = [[NSMutableArray alloc] initWithArray:[items.items sortedArrayUsingComparator:^(id a, id b) {
        Item *first = a;
        Item *second = b;
        return [first compareCategory:second];
    }]];  
}

-(void) sortByName{
    items.items = [[NSMutableArray alloc] initWithArray:[items.items sortedArrayUsingComparator:^(id a, id b) {
        NSString *first = [(Item *)a name];
        NSString *second = [(Item *)b name];
        return [first compare:second];
    }]];
}

-(void) sortByChecked{
    items.items = [[NSMutableArray alloc] initWithArray:[items.items sortedArrayUsingComparator:^(id a, id b) {
        Item *first = a;
        Item *second = b;
        return [first compareChecked:second];
        
    }]];
}

/*
 
 Function:      controlButtonTapped:
 
 Description:   This method basically controls the control button that appears in the Navigation bar at the right. Basically it just starts up an actionSheet that gives some actions for the controlDelegate to do.
            - Sort List By Name will sort the items list by name
            - Sort List By Category will sort the items list by category
            - Sort List By Checked will sort the items list by whether or not it has been checked off the list.
 
 */

- (IBAction)controlButtonTapped: (id)sender{
    controlActionSheetCalled = YES;
//    controlDelegate = [[ControlActionSheetDelegate alloc] initWithShoppingList:items];
//    controlDelegate.myList = items;
    editRowIndex = [items numItems];
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:self.title delegate:self cancelButtonTitle:@"Never Mind" destructiveButtonTitle:@"Uncheck All" otherButtonTitles:@"Sort List By Name", @"Sort List By Category", @"Sort List By Checked", @"New Item!", nil];
    
    [actionSheet showInView:self.view];
 //   controlDelegate = nil;
    //[self.tableView reloadData];
}

/*
 Function:      CellButtonTapped: (id)sender
 
 Description:   This handles the button that each tableViewCell has. It sets up an action sheet that asks the user what should happen. The options are to:
 - delete the cell/item, 
 - create a new item above where this item is in between where this item is and the one currently above. So, if there are currently Items A, B, C, ... and the user clicks B and chooses this option and creates item D, the new list would be Items A, D, B, C, ..., 
 - create a new item below where this item is (synonymous with "create a new item above", except this time the new item is put in below), and 
 - replace this item (where the item chosen will be replaced with an entirely new item created by the user).
 - Oh, and of course, there's the cancel option, which doesn't do anything.
 */

- (IBAction)cellButtonTapped: (id)sender{
    controlActionSheetCalled = NO;
    UIButton *senderButton = (UIButton *) sender;
    UITableViewCell *buttonCell = (UITableViewCell *)[senderButton superview];
    NSUInteger buttonRow = [[self.tableView indexPathForCell:buttonCell] row];
    NSString *buttonTitle = [items getNameAtIndex:buttonRow];
    editRowIndex = buttonRow;
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:[NSString stringWithFormat:@"What do you want to do to %@?", buttonTitle] delegate:self cancelButtonTitle:@"Whoops!" destructiveButtonTitle:@"Delete Item" otherButtonTitles:@"Create New Item Above", @"Create New Item Below", @"Replace This Item", nil];
    
    
    //This next call for the actionSheet to setTag:buttonRow is so that the action sheet knows which item to replace, delete, or insert above/below of. It would mess things up if there are going to be more than one action sheet, but there's just this one, so it should all be good.
    
    [actionSheet setTag:buttonRow];
    [actionSheet showInView:self.view];
}

/*
 Function:      createNewItemViewControllerWithParemeter:
 
 Description:   This will create a new ItemViewController, and depending on the parameter, it will insert a new Item to items as well. 
                0 adds an item above where editRowIndex is.
                1 adds an item below where editRowIndex is.
                2 replaces an item below where editRowIndex is.
 
    This function does not work, because I finish going through the new viewController before the new item I want to add is created, so I'm going to do it in the new ViewController, because then it won't SIGABRT :(
 
    Never mind It works, but like I mentioned above it works through the new viewController thing. So yeah! :)
 
 */

-(void) createNewItemViewControllerWithParemeter:(NSUInteger) param{
    UIStoryboard *storyboard = self.storyboard;
    NewShoppingItemViewController *newItemVC = [storyboard instantiateViewControllerWithIdentifier:@"newItemVC"];
    newItemVC.parent = self;
    newItemVC.parameter = param;
    newItemVC.index = editRowIndex;
    

    //newItemVC.categories = delegate.categoryNames;
    
    [self presentViewController:newItemVC animated:YES completion:NULL];
    
    NSLog(@"Testing");

}

/*
 * This action sheet comes from the "edit" button on each of the items in the TableView. I think it's been explained there.
 */

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(!controlActionSheetCalled){
        switch (buttonIndex) {
            case 0:
                //This deletes an item.
                [items removeItemAtIndex:[actionSheet tag]];
                break;
            case 1:
                //This creates a new Item Above.
                [self createNewItemViewControllerWithParemeter:0];
                //            [items addItem:newerItem atIndex: editRowIndex+1];
                break;
            case 2:
                //This creates a new Item Below.
                [self createNewItemViewControllerWithParemeter:1];
                //            [items addItem:newerItem atIndex:editRowIndex];
                break;
            case 3:
                //This replaces this Item.
                [self createNewItemViewControllerWithParemeter:2];
                break;
            case 4:
                //This doesn't do anything, because it's cancelling the action sheet. So nothing happens! Yay!
                break;
            default:
                break;
            }
    } else {
        switch (buttonIndex) {
                
                /*
                 @"Never Mind" destructiveButtonTitle:@"Uncheck All" otherButtonTitles:@"Sort List By Name", @"Sort List By Category", @"Sort list by checked", @"New Item!"
                 0: uncheck all
                 1: sort list by name
                 2: sort list by category
                 3: sort list by checked
                 4: new item!
                 5: never mind
                 */
            case 0:
                /*
                 for (Address *address in allAddresses) {
                 [mapVC.mapView addAnnotation:address];
                 }
                 */
                for (Item *item in items.items) {
                    item.isChecked = NO;
                }
                
                break;
            case 1:
                [self sortByName];
                sortName = YES;
                sortCheck = NO;
                sortCategory=NO;
                //NSUInteger i = 0;
                
                [self.tableView reloadData];
                break;
                
            case 2:
                [self sortByCategory];
                sortCategory=YES;
                sortCheck=NO;
                sortName=NO;
                break;
                
            case 3:
                [self sortByChecked];
                sortName=NO;
                sortCheck=YES;
                sortCategory=NO;
                break;
                
            case 4:
                [self createNewItemViewControllerWithParemeter:0];
                break;
                
            case 5:
                break;
                
            default:
                break;
        }

    }
    
    [self.tableView reloadData];

}

/*
 tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 */

/*
 UIStoryboard *storyBoard = self.storyboard;
 UIViewController *secondVC = [storyBoard instantiateViewControllerWithIdentifier:@"orangeView"];
 [self presentViewController:secondVC animated:YES completion:NULL]; 
 */


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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
    //categories = [[NSMutableArray alloc] init];
    //UIApplication *app = [UIApplication sharedApplication];
    UINavigationItem *navItem = self.navigationItem;
 //   UIButton *controlButton = [[UIButton alloc] initWithFrame:CGRectMake(0.0, 0.0, 60.0, 30.0)];
  //  [controlButton setTitle:@"Control" forState:UIControlStateNormal];
   // [controlButton addTarget:self action:@selector(controlButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    navItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Control" style:UIBarButtonItemStylePlain target:self action:@selector(controlButtonTapped:)];
  //  [barButtonItem setT
    UIApplication *app = [UIApplication sharedApplication];
    AppDelegate *delegate = app.delegate;
    self.categories = delegate.categoryNames;

    sortCheck=YES;
    sortCategory=NO;
    sortName=NO;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.items = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [items numItems];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(0.0, 0.0, 60.0, 30.0);
        [button setTitle:@"Edit!" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(cellButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        cell.accessoryView = button;
    }
    
    // Configure the cell...
    Item *huh;// = [[Item alloc] init];
    huh = [items getItemAtIndex:[indexPath row]];
    cell.textLabel.text = [[items getItemAtIndex:[indexPath row]] name] ;
    cell.editing = YES; 	
    cell.detailTextLabel.text = [[items getItemAtIndex:[indexPath row]] itemCategory];
    
    UIImage *image;// = [[UIImage alloc] init];
    
    if([items getItemAtIndex:[indexPath row]].isChecked){
        image = [UIImage imageNamed:@"40px-Light_green_check.png"];
    }else{
        image = [UIImage imageNamed:@"x-mark.jpg"];
    }
    
    cell.imageView.image = image;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [category removeMemberAtIndex:[indexPath row]];
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 }
 */


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [items removeItemAtIndex:[indexPath row]];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Item *selectedItem = [items getItemAtIndex:[indexPath row]];
    
    selectedItem.isChecked = !selectedItem.isChecked;
    
    if (sortName) {
        [self sortByName];
    }else if(sortCheck){
        [self sortByChecked];
    }else if(sortCategory){
        [self sortByCategory];
    }
    [self.tableView reloadData];
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
