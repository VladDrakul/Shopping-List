//
//  Item.h
//  ShoppingListReminder
//
//  Created by devin wakefield on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 
 This class is to emulate what an item in a shopping list would be. The name would be what the item is, the ItemType denotes what kind of shopping item it is, and the isChecked booleon describes if the user has alreagy bought this item.
 
 */

@interface Item : NSObject <NSCoding>{
    NSString * name;
    
    NSString * itemCategory;
    
    BOOL isChecked;
    
}

- (id)initWithCoder:(NSCoder *)decoder;

- (void)encodeWithCoder:(NSCoder *)encoder;

@property (strong, nonatomic) NSString*  name;
@property (strong, nonatomic) NSString * itemCategory;
@property BOOL isChecked;

-(id) initWithName: (NSString *) newName 
      withCategory: (NSString *) category 
       withChecked: (BOOL) checked;

-(id) init;
-(NSComparisonResult) compareCategory: (Item *) otherItem;
-(NSComparisonResult) compareChecked: (Item *) otherItem;


@end
