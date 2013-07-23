//
//  MyTableViewController.m
//  TableTest
//
//  Created by Joshua Conner on 5/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MyTableViewController.h"
#import "AppDelegate.h"
#import "ItemsTableController.h"
#import "NewShoppingListVC.h"
#import "SettingsViewController.h"

@implementation MyTableViewController

@synthesize shoppingLists;

-(void) addList:(ShoppingList *) newList{
    [shoppingLists addList:newList];
}

-(IBAction)addListButton:(id)sender{
    
    UIStoryboard *storyboard = self.storyboard;
    NewShoppingListVC *newShoppingList = [storyboard instantiateViewControllerWithIdentifier:@"newShoppingListVC"];
    newShoppingList.parent = self;
    
    [self presentViewController:newShoppingList animated:YES completion:NULL];
    
}

-(IBAction)changeMyLocation:(id)sender{
    UIStoryboard *storyboard = self.storyboard;
    SettingsViewController *settings = [storyboard instantiateViewControllerWithIdentifier:@"settingsVC"];
    settings.parent=self;
    
    [self presentViewController:settings animated:YES completion:NULL];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    UIApplication *app = [UIApplication sharedApplication];
    AppDelegate *delegate = app.delegate;
    shoppingLists = delegate.allOfTheLists;
    if(shoppingLists == nil){
        shoppingLists = [[ShoppingLists alloc] init];
    }
    
    UINavigationItem *navItem = self.navigationItem;
    navItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"New List" style:UIBarButtonItemStylePlain target:self action:@selector(addListButton:)];
    
    navItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Info" style:UIBarButtonItemStylePlain target:self action:@selector(changeMyLocation:)];
    [self.tableView reloadData];
    
    
    [super viewDidLoad];

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
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

/*
 
 Commented out because I do not want a category name. It's just... one category. So yeah.
 
 - (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //MediaCategory *category = [library getCategoryAtIndex:section];
    //return [category name];
}*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //MediaCategory *category = [library getCategoryAtIndex:section];
    return [shoppingLists numLists];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //MediaCategory *category = [library getCategoryAtIndex:[indexPath section]];
    
    cell.textLabel.text = [shoppingLists getNameOfListAtIndex:[indexPath row]];

//    const CGFloat white = {0.0, 0.0, 0.0, 1.0};
//    cell.textLabel.textColor = [[UIColor alloc] initWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];

    
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


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [shoppingLists removeListAtIndex:[indexPath row]];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

/*
 FROM OTHER CLASS for reference
 
 
 
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
 */


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyboard = self.storyboard;
    ItemsTableController *itemsVC = [storyboard instantiateViewControllerWithIdentifier:@"ItemsVC"];
    
    ShoppingList *list = [shoppingLists getListAtIndex:[indexPath row]];
    itemsVC.items = list;
    itemsVC.title = list.listName;
    
    [self.navigationController pushViewController:itemsVC animated:YES];
    

    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
