//
//  JSONDeserializer.m
//  DistanceCalculator
//
//  Created by Vijay on 10/10/15.
//  Copyright © 2015 Vijay. All rights reserved.
//

#import "JSONDeserializer.h"

@implementation JSONDeserializer


////**************************************************************************
////Used to read the data from the text file
////Used NSJSONSerializer for reading the json data
////**************************************************************************

+(NSArray *)deserializedDataFromCalculationClass:(NSString *)customerListString
{
    NSError *jsonError;
    NSData *customerListData = [customerListString dataUsingEncoding:NSUTF8StringEncoding];
    NSArray *customerListArray = [NSJSONSerialization JSONObjectWithData:customerListData
                                                    options:NSJSONReadingMutableContainers
                                                      error:&jsonError];
    return customerListArray;
}

@end
