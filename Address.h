//
//  Address.h
//  AltitudeCalculator
//
//  Created by Joshua Conner on 11/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MKAnnotation.h>

@interface Address : NSObject <MKAnnotation, NSCoding>

- (id)initWithCoder:(NSCoder *)decoder;

- (void)encodeWithCoder:(NSCoder *)encoder;

- (id) initWithAddress: (NSString *) newAddress
            coordinate: (CLLocationCoordinate2D) newCoordinate
           andAltitude: (NSNumber *) newAltitude;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) NSNumber *altitude;

- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate;

@end
