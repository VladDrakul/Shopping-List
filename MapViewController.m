//
//  MapViewController.m
//  Shopping_List
//
//  Created by devin wakefield on 6/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MapViewController.h"
#import "SBJson.h"

@implementation MapViewController

@synthesize locationChosen, useCurrLocation, enteredLocation, mapView, slider, listLocation, parent, radius, manager, currentPoint;


-(IBAction)handleSwitch:(id)sender{
    if (useCurrLocation.on) {
        [enteredLocation setEnabled:NO];
        
        [manager startUpdatingLocation];
        
        if (currAddress!=nil) {
            [mapView removeAnnotation:currAddress];
            currAddress = nil;
            if(area!=nil){
                [mapView removeOverlay:area];
                area = nil;
            }
        }
        
        
        listLocation = currentPoint.coordinate;
        currAddress = [[Address alloc] initWithAddress:@"My Location" coordinate:currentPoint.coordinate andAltitude: [NSNumber numberWithDouble:currentPoint.altitude]];
        
        [self.mapView addAnnotation:currAddress];

        
        //CLLocationCoordinate2D myLocation = {manager.coordinate.latitude, manager.coordinate.longitude};
    }else{
        [enteredLocation setEnabled:YES];
        [manager stopUpdatingLocation];
        
        if (currAddress!=nil) {
            [mapView removeAnnotation:currAddress];
            currAddress = nil;
            if(area!=nil){
                [mapView removeOverlay:area];
                area = nil;
            }
        }
    }
}

- (NSNumber *) getAltitudeFromLatitude:(NSNumber *)latitude andLongitude:(NSNumber *)longitude {
    NSString *urlString = [NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/elevation/json?locations=%f,%f&sensor=false", [latitude floatValue], [longitude floatValue]];
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSStringEncoding encoding;
    
    NSString *result = [NSString stringWithContentsOfURL:url usedEncoding:&encoding error:NULL];
    
    
    
    NSDictionary *resultDictionary = [result JSONValue];
    NSArray *results = [resultDictionary objectForKey:@"results"];
    NSDictionary *item0 = [results objectAtIndex:0];
    NSNumber *elevation = [item0 objectForKey:@"elevation"];
    
    return elevation;
}

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id < MKOverlay >)overlay{
    
    
     MKCircleView *areaCircle = [[MKCircleView alloc] initWithCircle:overlay];
    
    areaCircle.lineWidth = 3.0;
    
    areaCircle.fillColor = [[UIColor cyanColor] colorWithAlphaComponent:0.2];
    areaCircle.strokeColor = [[UIColor blueColor] colorWithAlphaComponent:0.7];
    
    return areaCircle;
    
}

-(IBAction)radiusSet:(id)sender{
    
    
    if (area!=nil) {
        [mapView removeOverlay:area];
        area = nil;
    }
    
    area = [[MKCircle alloc] init];
    
    area = [MKCircle circleWithCenterCoordinate:listLocation radius:slider.value * 1000];
    
    radius = slider.value * 1000;
    
    //listLocation;    
    //MKCircleView *areaCircle = [[MKCircleView alloc] initWithCircle:area];
    
    [mapView addOverlay:area];
    //[mapView addSubview:areaCircle];
    
    
}

-(IBAction)finishButton:(id)sender{
    
    parent.coord = listLocation;
    parent.distance = radius;
    [self.presentingViewController dismissModalViewControllerAnimated:YES];
}

-(IBAction)textEntered:(UITextField *)sender{
    
    if (currAddress!=nil) {
        [mapView removeAnnotation:currAddress];
        currAddress = nil;
        if(area!=nil){
            [mapView removeOverlay:area];
            area = nil;
        }
    }
    
    
    NSString *addressString = sender.text;
    NSString *URLFriendlyAddress = [addressString stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    
    NSString *urlString = [NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/geocode/json?address=%@&sensor=false", URLFriendlyAddress];
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSError *error;
    
    // Synchronous network request
    NSString *geocodeResult = [NSString stringWithContentsOfURL:url
                                                       encoding:NSUTF8StringEncoding
                                                          error:&error];
    
    NSArray *geocodeResultsArr = [[geocodeResult JSONValue] objectForKey:@"results"];
    
    if ([geocodeResultsArr count] == 0) {
        // geocode failed
        enteredLocation.text = @"Not Found";
    } else {
        
        
        NSDictionary *geocodeDictionary =
        [geocodeResultsArr objectAtIndex:0];
        
        NSDictionary *locationDictionary =
        [[geocodeDictionary objectForKey:@"geometry"] objectForKey:@"location"];
        
        NSNumber *latitude = [locationDictionary objectForKey:@"lat"];
        NSNumber *longitude = [locationDictionary objectForKey:@"lng"];
        
        NSNumber *altitude = [self getAltitudeFromLatitude:latitude andLongitude:longitude];
        
        //altitudeDisplay.text = [NSString stringWithFormat:@"%0.2f Meters", [altitude floatValue]];
        
        // Add address to our global address list
        //UIApplication *app = [UIApplication sharedApplication];
        //AppDelegate *appDelegate = (AppDelegate *) app.delegate;
        CLLocationCoordinate2D coordinate = { .latitude = [latitude floatValue],
            .longitude = [longitude floatValue] };
        
        listLocation = coordinate;
        currAddress = [[Address alloc] initWithAddress:addressString coordinate:coordinate andAltitude:altitude];
        //[appDelegate addAddress:newAddress];
        
        [self.mapView addAnnotation:currAddress];
         
        
    }

    
    
    [sender resignFirstResponder];
}



- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [useCurrLocation setOn:NO];
    
    manager = [[CLLocationManager alloc] init];
    
    manager.delegate = self;
    manager.desiredAccuracy = kCLLocationAccuracyBest;
    [manager startUpdatingLocation];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark CLLocationManagerDelegate Methods
-(void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    self.currentPoint = newLocation;
}

-(void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSString *errorType = (error.code == kCLErrorDenied) ? @"Access Denied" : @"Unknown Error";
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error getting Location" message:errorType delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
    [alert show];
}

@end
