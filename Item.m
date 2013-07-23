//
//  Item.m
//  ShoppingListReminder
//
//  Created by devin wakefield on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Item.h"

@implementation Item

@synthesize name, itemCategory, isChecked;

- (id)initWithCoder:(NSCoder *)decoder{
    if (self = [super init]) {
        name = [decoder decodeObjectForKey:@"name"];
        itemCategory = [decoder decodeObjectForKey:@"itemcategory"];
        isChecked = [decoder decodeBoolForKey:@"ischecked"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:name forKey:@"name"];
    [encoder encodeObject:itemCategory forKey:@"itemcategory"];
    [encoder encodeBool:isChecked forKey:@"ischecked"];
    
}

-(id) initWithName: (NSString *) newName 
      withCategory: (NSString *) category
       withChecked: (BOOL) check{
    
    if(self = [super init]){
        
        self.name = newName;
    	self.itemCategory = category;
    	self.isChecked = check;
    }
    return self;
}

-(id) init{
    if (self = [super init]) {
        self = [self initWithName:@"newItem" withCategory:@"Other" withChecked:NO];
    }
    return self;
}

-(NSComparisonResult) compareCategory: (Item *) otherItem{
    return [self.itemCategory compare:otherItem.itemCategory];
}

-(NSComparisonResult) compareChecked: (Item *) otherItem{
    if (self.isChecked) {
        if (otherItem.isChecked) {
            return 0;
        }else{
            return -1;
        }
    }else{
        if(otherItem.isChecked){
            return 1;
        }else{
            return 0;
        }
    }
}

@end
