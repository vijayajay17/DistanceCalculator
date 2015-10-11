//
//  DistanceCalculationClass.m
//  DistanceCalculator
//
//  Created by Vijay on 10/10/15.
//  Copyright © 2015 Vijay. All rights reserved.
//

#import "DistanceCalculationClass.h"
#import "Constants.h"
#import "JSONDeserializer.h"

const double PIValue = 3.141592653589793;

@implementation DistanceCalculationClass

////**************************************************************************
////Used to calculate the distance between the latitude and longitude
////
////**************************************************************************

-(NSMutableArray *)calculateDistance
{
    NSMutableArray *customerDataArrayWithinRange = [NSMutableArray array];
    
    NSString *userDetailsContentData = [self readContentsOfFile];
    NSArray *customerListDataArray = [JSONDeserializer deserializedDataFromCalculationClass:userDetailsContentData];
    double userCurrentLatitude = [currentOfficeLatitude doubleValue];
    double userCurrentLongitude = [currentOfficeLongitude doubleValue];
    if(customerListDataArray.count>0)
    {
        for (NSInteger i=0; i< customerListDataArray.count; i++)
        {
            double customerLatitude = [[[customerListDataArray objectAtIndex:i] objectForKey:@"latitude"] doubleValue];
            double customerLongitude = [[[customerListDataArray objectAtIndex:i] objectForKey:@"longitude"] doubleValue];
            double distaneValue = [self GetDistance:userCurrentLatitude UserLogitude:userCurrentLongitude CustomerLatitude:customerLatitude CustomerLogitude:customerLongitude];
            if(distaneValue<100)
            {
                [customerDataArrayWithinRange addObject:[customerListDataArray objectAtIndex:i]];
            }
        }
        return customerDataArrayWithinRange;
    }
    return nil;
}

////**************************************************************************
////Used to calculate the distance from calculating the earths distance
////
////**************************************************************************

-(double)GetDistance:(double)userLatitude UserLogitude:(double)userLogitude CustomerLatitude:(double)customerLatitude CustomerLogitude:(double)CustomerLongitude {
    double radiansLatitude1 = [self rad:userLatitude];             ///Converting the latitude to radians
    double radiansLatitude2 = [self rad:customerLatitude];         ///Converting the longitude to radians
    double a = radiansLatitude1 - radiansLatitude2;
    double b = [self rad:userLogitude] -[self rad:CustomerLongitude];
    double s = 2 * asin(sqrt(pow(sin(a/2),2) + cos(radiansLatitude1)*cos(radiansLatitude2)*pow(sin(b/2),2)));
    s = s * EARTH_RADIUS;
    s = round(s * 10000) / 10000;
    return s;
}

-(double)rad:(double)d
{
    return d * PIValue / 180.0;
}


////**************************************************************************
////Used to contents of the file from the sandbox
////
////**************************************************************************

-(NSString *)readContentsOfFile
{
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"gistfile1"
                                                         ofType:@"txt"];
    NSString* contentsOfFile = [NSString stringWithContentsOfFile:filePath
                                                         encoding:NSUTF8StringEncoding
                                                            error:NULL];
    return contentsOfFile;
}

@end
