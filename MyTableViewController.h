//
//  MyTableViewController.h
//  TableTest
//
//  Created by Joshua Conner on 5/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShoppingLists.h"

@interface MyTableViewController : UITableViewController


@property (strong, nonatomic)    ShoppingLists *shoppingLists;


-(void) addList:(ShoppingList *) newList;


@end
