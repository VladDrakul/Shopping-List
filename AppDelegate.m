//
//  AppDelegate.m
//  TableTest
//
//  Created by Joshua Conner on 5/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "Item.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize shoppingList, allOfTheLists;
@synthesize navController;
@synthesize categoryNames;
@synthesize myCoordinates;
@synthesize radius;
@synthesize listLocations;
//@synthesize theShoppingLists;

- (void) initializeMediaLibrary
{
 
    shoppingList = [[ShoppingList alloc] init];
    allOfTheLists = [[ShoppingLists alloc] init];
    categoryNames = [[NSMutableArray alloc] init];
    
    Item * test1a = [[Item alloc] init];
    Item * test1b = [[Item alloc] init];
    Item * test1c = [[Item alloc] init];
    Item * test1d = [[Item alloc] init];
    
    Item * test2a = [[Item alloc] init];
    Item * test2b = [[Item alloc] init];
    Item * test2c = [[Item alloc] init];
    Item * test2d = [[Item alloc] init];
    
    Item * test3a = [[Item alloc] init];
    Item * test3b = [[Item alloc] init];
    Item * test3c = [[Item alloc] init];
    Item * test3d = [[Item alloc] init];
    
    Item * test4a = [[Item alloc] init];
    Item * test4b = [[Item alloc] init];
    Item * test4c = [[Item alloc] init];
    Item * test4d = [[Item alloc] init];
    
    Item * test5a = [[Item alloc] init];
    Item * test5b = [[Item alloc] init];
    Item * test5c = [[Item alloc] init];
    Item * test5d = [[Item alloc] init];
    
    test1a.name = @"Avocado";
    test1a.itemCategory = @"Food";
    test1a.isChecked = NO;
    
    test1b.name = @"Cucumber";
    test1b.itemCategory = @"Food";
    test1b.isChecked = NO;
    
    test1c.name = @"Banana";
    test1c.itemCategory = @"Food";
    test1c.isChecked = NO;
    
    test1d.name = @"Potato";
    test1d.itemCategory = @"Food";
    test1d.isChecked = NO;
    
    [categoryNames addObject:@"Food"];
    
    test2a.name = @"Staples";
    test2a.itemCategory = @"Business";
    test2a.isChecked = NO; 
    
    test2b.name = @"Keyboards";
    test2b.itemCategory = @"Business";
    test2b.isChecked = NO;    
    
    test2c.name = @"Baby Carriage";
    test2c.itemCategory = @"Business";
    test2c.isChecked = NO;   
    
    test2d.name = @"Hammer";
    test2d.itemCategory = @"Business";
    test2d.isChecked = NO;
    
    
        [categoryNames addObject:@"Business"];
    
    test3a.name = @"Jorts";
    test3a.itemCategory = @"Clothing";
    test3a.isChecked = NO;
    
    test3b.name = @"Shorts";
    test3b.itemCategory = @"Clothing";
    test3b.isChecked = NO;
    
    test3c.name = @"Skort";
    test3c.itemCategory = @"Clothing";
    test3c.isChecked = NO;
    
    test3d.name = @"Wig";
    test3d.itemCategory = @"Clothing";
    test3d.isChecked = NO;

    
        [categoryNames addObject:@"Clothing"];
    
    test4a.name = @"Diamond Necklace";
    test4a.itemCategory = @"Luxury";
    test4a.isChecked = NO;  
    
    test4b.name = @"Eye Shadow";
    test4b.itemCategory = @"Luxury";
    test4b.isChecked = NO;  
    
    test4c.name = @"Gold Flaked lotion";
    test4c.itemCategory = @"Luxury";
    test4c.isChecked = NO;  
    
    test4d.name = @"Pearl Tiara";
    test4d.itemCategory = @"Luxury";
    test4d.isChecked = NO;
    
        [categoryNames addObject:@"Luxury"];
    
    
    test5a.name = @"Couch";
    test5a.itemCategory = @"Housing";
    test5a.isChecked = NO;
    
    test5b.name = @"Drapery";
    test5b.itemCategory = @"Housing";
    test5b.isChecked = NO;
    
    test5c.name = @"Toilet Seats";
    test5c.itemCategory = @"Housing";
    test5c.isChecked = NO;
    
    test5d.name = @"Upholstery";
    test5d.itemCategory = @"Housing";
    test5d.isChecked = NO;
    
        [categoryNames addObject:@"Housing"];
    

    allOfTheLists = [[ShoppingLists alloc] initWithName:@"test!"];
    CLLocationDistance distance = 0;
    CLLocationCoordinate2D aCoordinate = {0,0};

    shoppingList = [shoppingList initWithName:@"Devin Goes Shopping" andCoordinate:aCoordinate andRadius:distance];
    
    [shoppingList addItem:test1a];
    [shoppingList addItem:test1b];
    [shoppingList addItem:test1c];
    [shoppingList addItem:test1d];
    
    [allOfTheLists addList:shoppingList];
    
    //shoppingList = [[ShoppingList alloc] initWithName:@"@"Business" Items"];
    [shoppingList addItem:test2a];
    [shoppingList addItem:test2b];
    [shoppingList addItem:test2c];
    [shoppingList addItem:test2d];
    
   // [allOfTheLists addList:shoppingList];
    
    
   // shoppingList = [[ShoppingList alloc] initWithName:@"@"Clothing" Items"];
    [shoppingList addItem:test3a];
    [shoppingList addItem:test3b];
    [shoppingList addItem:test3c];
    [shoppingList addItem:test3d];
    
   // [allOfTheLists addList:shoppingList];
    
    
   // shoppingList = [[ShoppingList alloc] initWithName:@"@"Luxury" Items"];
    [shoppingList addItem:test4a];
    [shoppingList addItem:test4b];
    [shoppingList addItem:test4c];
    [shoppingList addItem:test4d];
    
    //[allOfTheLists addList:shoppingList];
    
    
    //shoppingList = [[ShoppingList alloc] initWithName:@"@"Housing" Items"];
    [shoppingList addItem:test5a];
    [shoppingList addItem:test5b];
    [shoppingList addItem:test5c];
    [shoppingList addItem:test5d];
    
    //[allOfTheLists addList:shoppingList];
    
    
    
}

- (NSString *) savedDataPath {
    NSArray *paths =
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filename = [documentsDirectory
                          stringByAppendingPathComponent:@"savedData"];
    return filename;
}

/*
 this SHOULD be doing persistent data, but it doesn't work. I've just got so many SIGABRTS from things that worked perfectly before that I've given up on this. Ugh.
 */

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    /*if ([[NSFileManager defaultManager] fileExistsAtPath:[self savedDataPath]]) {
        NSData *inputData = [[NSData alloc] initWithContentsOfFile:[self savedDataPath]];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:inputData];
        allOfTheLists = [unarchiver decodeObjectForKey:@"allofthelists"];
        categoryNames = [unarchiver decodeObjectForKey:@"categorynames"];
        if ([allOfTheLists numLists]==0 ) {
            allOfTheLists = [[ShoppingLists alloc] init];
        }
        if ([categoryNames count] == 0) {
            categoryNames = [[NSMutableArray alloc] init];
        }
    } else */{
        [self initializeMediaLibrary];
    }    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
    NSMutableData *outputData = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:outputData];
    [archiver encodeObject:allOfTheLists forKey:@"allofthelists"];
    [archiver encodeObject:categoryNames forKey:@"categorynames"];
    [archiver finishEncoding];
    [outputData writeToFile:[self savedDataPath] atomically:YES];
    /*
     
     NSMutableData *outputData = [[NSMutableData alloc] init];
     NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:outputData];
     [archiver encodeObject:mediaLibrary forKey:@"Media Library"];
     [archiver finishEncoding];
     [outputData writeToFile:[self savedDataPath] atomically:YES];
     
     */
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.

    
}

@end
