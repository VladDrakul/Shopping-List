//
//  ShoppingLists.h
//  ShoppingListReminder
//
//  Created by devin wakefield on 5/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


/*
 This class's goal is to have a collection of different ShoppingList classes that will make up a table that the user can select and edit.
 */
#import <Foundation/Foundation.h>
#import "ShoppingList.h"

@interface ShoppingLists : NSObject <NSCoding>

@property (strong, nonatomic) NSMutableArray * lists;
@property (strong, nonatomic) NSString * name;

- (id)initWithCoder:(NSCoder *)decoder;

- (void)encodeWithCoder:(NSCoder *)encoder;

-(id) init;

-(id) initWithName: (NSString *) newName;

-(void) addList:(ShoppingList *) newItem;

-(NSUInteger) numLists;

-(ShoppingList *) getListAtIndex: (NSUInteger) index;

-(ShoppingList *) removeListAtIndex: (NSUInteger) index;

-(NSString *) getNameOfListAtIndex: (NSUInteger) index;




@end
