//
//  ViewController.h
//  DistanceCalculator
//
//  Created by Vijay on 10/10/15.
//  Copyright © 2015 Vijay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property(nonatomic) IBOutlet UITableView *customerListTable;

@end

