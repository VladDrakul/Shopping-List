//
//  ControlActionSheetDelegate.h
//  TestingTables
//
//  Created by devin wakefield on 5/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShoppingList.h"
//#import "ItemsTableController.h"

/*

 This is SOOOOOOO not done, but basically it'll do some work for the ItemsTableController.

*/
@class ItemsTableController;
@interface ControlActionSheetDelegate : NSObject <UIActionSheetDelegate>

@property (strong, nonatomic) ShoppingList * myList;
@property (strong, nonatomic) ItemsTableController *parent;

-(id) initWithShoppingList:(ShoppingList *) list;

@end
