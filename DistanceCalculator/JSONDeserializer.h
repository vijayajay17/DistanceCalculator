//
//  JSONDeserializer.h
//  DistanceCalculator
//
//  Created by Vijay on 10/10/15.
//  Copyright © 2015 Vijay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONDeserializer : NSObject
+(NSArray *)deserializedDataFromCalculationClass:(NSString *)customerListString;
@end
