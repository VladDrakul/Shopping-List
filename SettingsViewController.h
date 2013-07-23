//
//  SettingsViewController.h
//  Shopping_List
//
//  Created by devin wakefield on 6/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTableViewController.h"

@interface SettingsViewController : UIViewController

@property (strong, nonatomic) MyTableViewController *parent;
@property CLLocationCoordinate2D myNewCoordinates;
@property CLLocationDistance     myNewRadius;
@property (strong, nonatomic) IBOutlet UIButton     *myNewLocation;
@property (strong, nonatomic) IBOutlet UIButton     *done;


@end
