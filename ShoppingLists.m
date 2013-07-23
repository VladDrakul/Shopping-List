//
//  ShoppingLists.m
//  ShoppingListReminder
//
//  Created by devin wakefield on 5/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ShoppingLists.h"
#import "Item.h"

@implementation ShoppingLists

@synthesize lists, name;


- (id)initWithCoder:(NSCoder *)decoder{
    if (self = [super init]) {
        lists = [decoder decodeObjectForKey:@"lsits"];
        name = [decoder decodeObjectForKey:@"name"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:lists forKey:@"lists"];
    [encoder encodeObject:name forKey:@"name"];
    
}


/*
 * Function:	initWithName:
 *
 * Description:	This is the designated initializer, and initializes a ShoppingLists with a name.
 */

-(id) initWithName: (NSString *) newName{
    if(self = [super init]){
        self.name = newName;
        lists = [[NSMutableArray alloc] init];
    }
    
    return self;
}

/*
 * Method:	init
 *
 * Description:	Basically just inits the ShoppingLists with the name newListContainer. Simple. Gets the job done.
 */

-(id) init{
    self = [self initWithName:@"newListContainer"];
    
    return self;
    
}

/*
 * Method:	addList:
 *
 * Description:	Adds a list to the end of the lists mutalbe array.
 */

-(void) addList:(ShoppingList *) newList{
    [lists addObject:newList];
//    [lists  objectAtIndex:0];
}

/*
 * Method:	numLists
 *
 * Description:	Returns the number of lists in the mutable array lists.
 */

-(NSUInteger) numLists{
    return [lists count];    
}

/*
 * Method:	getListAtIndex:
 *
 * Description:	This returns a ShoppingList at a given index.
 */

-(ShoppingList *) getListAtIndex: (NSUInteger) index{
    return [lists objectAtIndex:index];
    
}

/*
 * Method:	removeListAtIndex:
 *
 * Description:	This removes and returns the list at a given index.
 */

-(ShoppingList *) removeListAtIndex: (NSUInteger) index{
    ShoppingList * tempList = [self getListAtIndex:index];
    [lists removeObjectAtIndex:index];
    return tempList;
    
}

/*
 * Method:	getNameOfListAtIndex:
 *
 * Description:	This is a convenience function that gets the name of a ShoppingList at a given index. It helps make code look prettier.
 */

-(NSString *) getNameOfListAtIndex: (NSUInteger) index{
    return [self getListAtIndex:index].listName;
}

@end
