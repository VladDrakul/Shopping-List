//
//  ShoppingList.m
//  ShoppingListReminder
//
//  Created by devin wakefield on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ShoppingList.h"

@implementation ShoppingList

@synthesize items, listName, radius, coordinates;

- (id)initWithCoder:(NSCoder *)decoder{
    if (self = [super init]) {
        items  = [decoder decodeObjectForKey:@"items"];
        listName = [decoder decodeObjectForKey:@"listname"];
        radius = [decoder decodeDoubleForKey:@"radius"];
        CLLocationCoordinate2D whee = {[decoder decodeDoubleForKey:@"latitude"], [decoder decodeDoubleForKey:@"longitude"]};
        coordinates = whee;
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:items forKey:@"items"];
    [encoder encodeObject:listName forKey:@"listname"];
    [encoder encodeDouble:radius forKey:@"radius"];
    [encoder encodeDouble:coordinates.latitude forKey:@"latitude"];
}

/*
 Method:        init
 
 Description:   This is NOT the designated initializer... I just have it in case of... something? I don't know. It wasn't hard to do, so I did it, I guess.
 */

-(id) init{
    
    CLLocationCoordinate2D bob = {0,0};
    self = [self initWithName:@"New shopping list" andCoordinate:bob andRadius:5];
    
    return self;
}


/*
 Method:        initWithName:
 
 Description:   This is the designated initializer. It should be the only one called by this class's children. I don't think it will have any though. It takes in an NSString pointer.
 */

-(id) initWithName:(NSString *)newName 
     andCoordinate: (CLLocationCoordinate2D) newCoordinate 
         andRadius: (CLLocationDistance) newRadius{
    if(self = [super init]){
        self.listName = newName;
        self.coordinates = newCoordinate;
        self.radius = newRadius;
        items = [[NSMutableArray alloc] init];
        //NSLog(@"%f, %f, %f", newRadius, newCoordinate.latitude , newCoordinate.longitude);
    }
    return self;
}


/*
 Method:        addItem:
 
 Description:   This method adds a new item to the end shopping list. 
 
 */

-(void) addItem:(Item *) newItem{
    [items addObject:newItem];
}

/*
 Method:        addItem:
 
 Description:   This method adds a new item to the end shopping list. 
 
 */

-(void) addItem:(Item *) newItem atIndex: (NSUInteger) index{
    [items insertObject:newItem atIndex:index];
}

/*
 Method:        numItems
 
 Description:   Returns the number of items in the shopping list.
 */

-(NSUInteger) numItems{
    return [items count];
}


/*
 Method:        getItemAtIndex:
 
 Description:   This method will return the shopping item at a particular index.
 */

-(Item *) getItemAtIndex: (NSUInteger) index{
    return [items objectAtIndex:index];
}


/*
 Method:        removeItemAtIndex:
 
 Description:   This will remove a shopping item at a particular index.
 */

-(Item *) removeItemAtIndex: (NSUInteger) index{
    Item * temp = [self getItemAtIndex:index];
    [items removeObjectAtIndex:index];
    return temp;
}


//The following are attempts of mine to create functions that would sort the NSMutableArray items. I'm not sure if it works, but I'm going to figure this out later.
//Thanks goes to http://stackoverflow.com/questions/805547/how-to-sort-an-nsmutablearray-with-custom-objects-in-it for the code I kind of understand.

-(void) sortByName: (id) firstComp And: (id) secondComp{
    NSArray* sortedArray;
    sortedArray = [items sortedArrayUsingComparator:^(id a, id b){
        NSString *first = [(Item*) a name];
        NSString *second = [(Item*) b name];
        return [first compare:second];
    }];
    
    items = [sortedArray mutableCopy];
    return;
}

-(NSMutableArray *) getAllMembers{
    return [NSArray arrayWithArray:items];
}

-(NSString *) getNameAtIndex: (NSUInteger) index{
    return [[items objectAtIndex:index] name];
}

-(NSString *) getCategoryAtIndex: (NSUInteger) index{
    return [[items objectAtIndex:index] itemCategory];
}


+(ShoppingList *) mergeLists: (ShoppingList *) list1 andList:(ShoppingList *) list2 withNewName: (NSString *) newName{
    
    
    ShoppingList *newList = [[ShoppingList alloc] 
                             initWithName:newName 
                             andCoordinate:list1.coordinates 
                             andRadius:list1.radius];
    
    [newList.items addObjectsFromArray:list1.items];
        
    [newList.items addObjectsFromArray:list2.items];
    return newList;
}

@end
