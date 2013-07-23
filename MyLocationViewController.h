//
//  MyLocationViewController.h
//  Shopping_List
//
//  Created by devin wakefield on 6/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Address.h"
#import "SettingsViewController.h"

@interface MyLocationViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField      *addressField;
@property (strong, nonatomic) IBOutlet UISwitch         *useCurrLoc;
@property (strong, nonatomic) IBOutlet MKMapView        *mapView;
@property (strong, nonatomic) SettingsViewController    *parent;

@property CLLocationCoordinate2D    myCoordinates;

-(IBAction)handleSwitch:(id)sender;
-(IBAction)finishButton:(id)sender;
-(IBAction)textEntered:(UITextField *)sender;

@end
