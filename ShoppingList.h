//
//  ShoppingList.h
//  ShoppingListReminder
//
//  Created by devin wakefield on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MKAnnotation.h>
#import "Item.h"

/*
 This class, as the name implies, is so that the user can create a ShoppingList. It is very bare-bones right now, as I'm currently migrating it to the ShoppingListViewController so that it can be a standalone TableView. Each ShoppingList is supposed to have a name so that it can be linked to another TableView, what will be the ShoppingListsTableViewController so that each cell would be a link to a shopping list.
 
 */

@interface ShoppingList: NSObject{
    NSMutableArray * items;
    NSString * listName;
}

@property (strong, nonatomic) NSMutableArray    *items;
@property (strong, nonatomic) NSString          *listName;
@property CLLocationCoordinate2D                coordinates;
@property CLLocationDistance                    radius;



- (id)initWithCoder:(NSCoder *)decoder;

- (void)encodeWithCoder:(NSCoder *)encoder;

-(id) init;

-(id) initWithName: (NSString *) newName 
     andCoordinate: (CLLocationCoordinate2D) newCoordinate 
         andRadius: (CLLocationDistance) newRadius;

-(void) addItem:(Item *) newItem;

-(void) addItem:(Item *)newItem atIndex: (NSUInteger) index;

-(NSUInteger) numItems;

-(Item *) getItemAtIndex: (NSUInteger) index;

-(Item *) removeItemAtIndex: (NSUInteger) index;

-(NSMutableArray *) getAllMembers;

-(NSString *) getNameAtIndex: (NSUInteger) index;

-(NSString *) getCategoryAtIndex: (NSUInteger) index;

+(ShoppingList *) mergeLists: (ShoppingList *) list1 andList:(ShoppingList *) list2 withNewName: (NSString *) newName;

@end
