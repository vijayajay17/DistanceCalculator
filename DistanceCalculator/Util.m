//
//  Util.m
//  DistanceCalculator
//
//  Created by Vijay on 10/11/15.
//  Copyright © 2015 Vijay. All rights reserved.
//

#import "Util.h"

@implementation Util

////**************************************************************************
////Used to sort the customer list array
////Used NSSortDescriptor for sorting
////**************************************************************************

+(NSMutableArray *)sortCustomerListArray:(NSMutableArray *)customerDataArray
{
    NSArray *sortedCustomerArray = [NSArray array];
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"user_id"  ascending:YES];
    sortedCustomerArray=[customerDataArray sortedArrayUsingDescriptors:[NSArray arrayWithObjects:descriptor,nil]];
    NSMutableArray *sortedDataArray = [NSMutableArray arrayWithArray:sortedCustomerArray];
    return sortedDataArray;
}

@end
