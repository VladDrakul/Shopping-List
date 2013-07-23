//
//  ItemsTableController.h
//  TestingTables
//
//  Created by devin wakefield on 5/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShoppingList.h"
#import "ControlActionSheetDelegate.h"

@interface ItemsTableController : UITableViewController <UIActionSheetDelegate>{
    NSUInteger editRowIndex;
    BOOL controlActionSheetCalled;
    BOOL sortCheck, sortName, sortCategory;
}

@property (strong, nonatomic) ShoppingList *items;
@property (strong, nonatomic) ControlActionSheetDelegate *controlDelegate;
@property (strong, nonatomic) NSMutableArray *categories;

@property (strong, nonatomic) Item * newerItem;

-(IBAction)controlButtonTapped:(id)sender;
-(IBAction)cellButtonTapped:(id)sender;

@end
