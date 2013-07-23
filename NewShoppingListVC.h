//
//  NewShoppingListVC.h
//  Shopping_List
//
//  Created by devin wakefield on 5/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTableViewController.h"

@interface NewShoppingListVC : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *nameTextField;
@property (nonatomic, strong) IBOutlet UIButton    *doneButton;
@property (nonatomic, strong) MyTableViewController *parent;

@property CLLocationDistance            distance;
@property CLLocationCoordinate2D        coord;

- (IBAction)dismissKeyboard;
- (IBAction)handleDoneButton;
- (IBAction)newLocationButton;

@end
