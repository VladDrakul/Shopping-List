//
//  ControlActionSheetDelegate.m
//  TestingTables
//
//  Created by devin wakefield on 5/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ControlActionSheetDelegate.h"

@implementation ControlActionSheetDelegate

@synthesize myList, parent;

-(NSUInteger) compare:(NSString *) first with:(NSString *) second{
    return [first compare:second];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
            
            /*
             @"Never Mind" destructiveButtonTitle:nil otherButtonTitles:@"Sort List By Name", @"Sort List By Category", @"Sort list by checked", @"New Item!"
             0: sort list by name
             1: sort list by category
             2: sort list by checked
             3: new item!
             4: never mind
             */
        case 0:
            myList.items = [[NSMutableArray alloc] initWithArray:[myList.items sortedArrayUsingComparator:^(id a, id b) {
                NSString *first = [a name];
                NSString *second = [b name];
                return [first compare:second];
            }]];
            
          
           // [parent.tableView reloadData];
            break;
            
        case 1:
            NSLog(@"1");
            break;
            
        case 2:
            NSLog(@"2");
            break;
            
        case 3:
            NSLog(@"3");
            break;
            
        case 4:
            break;
            
        default:
            break;
    }
}

-(id) initWithShoppingList:(ShoppingList *)list{
    if(self=[super init]){
        myList=list;
    }
    return self;
}

@end
