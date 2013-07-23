//
//  AppDelegate.h
//  TableTest
//
//  Created by Joshua Conner on 5/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"
#import "ShoppingList.h"
#import "ShoppingLists.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
    
@property (strong, nonatomic) UIWindow                  *window;
@property (strong, nonatomic) UINavigationController    *navController;

@property (strong, nonatomic) ShoppingList              *shoppingList;
@property (strong, nonatomic) ShoppingLists             *allOfTheLists;
@property (strong, nonatomic) NSMutableArray            *categoryNames;
//@property (strong, nonatomic) NSMutableArray            *theShoppingLists;

@property (strong, nonatomic) NSMutableArray            *listLocations;

@property CLLocationCoordinate2D                        myCoordinates;
@property CLLocationDistance                            radius;


@end
