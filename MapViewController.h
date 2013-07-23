//
//  MapViewController.h
//  Shopping_List
//
//  Created by devin wakefield on 6/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Address.h"
#import "NewShoppingListVC.h"

@interface MapViewController : UIViewController <CLLocationManagerDelegate>{
    Address *currAddress;
    MKCircle * area;
}

@property (strong, nonatomic) IBOutlet UIButton     *locationChosen;
@property (strong, nonatomic) IBOutlet UISwitch     *useCurrLocation;
@property (strong, nonatomic) IBOutlet UITextField  *enteredLocation;
@property (strong, nonatomic) IBOutlet MKMapView    *mapView;
@property (strong, nonatomic) IBOutlet UISlider     *slider;
@property (strong, nonatomic) NewShoppingListVC     *parent;
@property (strong, nonatomic) CLLocationManager     *manager;
@property (strong, nonatomic) CLLocation            *currentPoint;


@property CLLocationCoordinate2D    listLocation;
@property CLLocationDistance        radius;

-(IBAction)handleSwitch:(id)sender;
-(IBAction)finishButton:(id)sender;
-(IBAction)textEntered:(UITextField *)sender;
-(IBAction)radiusSet:(id)sender;

@end
