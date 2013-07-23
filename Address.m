//
//  Address.m
//  AltitudeCalculator
//
//  Created by Joshua Conner on 11/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Address.h"

@implementation Address

@synthesize title, subtitle, address, coordinate, altitude;

- (id)initWithCoder:(NSCoder *)decoder{
    if (self = [super init]) {
        title = [decoder decodeObjectForKey:@"title"];
        subtitle = [decoder decodeObjectForKey:@"subtitle"];
        address = [decoder decodeObjectForKey:@"address"];
        CLLocationCoordinate2D newb = {[decoder decodeDoubleForKey:@"latitude"], [decoder decodeDoubleForKey:@"longitude"]};
        coordinate = newb;
        altitude = [NSNumber numberWithDouble:[decoder decodeDoubleForKey:@"altitude"]];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:title forKey:@"title"];
    [encoder encodeObject:subtitle forKey:@"subtitle"];
    [encoder encodeObject:address forKey:@"address"];
    //[encoder encodeObject:coordinate forKey:@"coordinate"];
    [encoder encodeDouble:coordinate.latitude forKey:@"latitude"];
    [encoder encodeDouble:coordinate.longitude forKey:@"longitude"];
    [encoder encodeDouble:altitude.doubleValue forKey:@"altitude"];
    
}

- (id) initWithAddress: (NSString *) newAddress
            coordinate: (CLLocationCoordinate2D) newCoordinate
           andAltitude: (NSNumber *) newAltitude
{
    if (self = [super init]) {
        self.address = newAddress;
        coordinate = newCoordinate;
        self.altitude = newAltitude;
        self.title = newAddress;
        self.subtitle = [NSString stringWithFormat:@"%0.2f meters", [newAltitude floatValue]];
    }
    return self;
}

- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate {
    coordinate = newCoordinate;
}

@end
