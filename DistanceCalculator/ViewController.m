//
//  ViewController.m
//  DistanceCalculator
//
//  Created by Vijay on 10/10/15.
//  Copyright © 2015 Vijay. All rights reserved.
//

#import "ViewController.h"
#import "DistanceCalculationClass.h"
#import "Util.h"

@interface ViewController ()

@property(nonatomic) NSMutableArray *customerListArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    DistanceCalculationClass *distanceCalculationClass = [[DistanceCalculationClass alloc] init];
    NSMutableArray *unsortedCustomerListArray = [distanceCalculationClass calculateDistance];
    if(unsortedCustomerListArray.count>0)
    {
        self.customerListArray = [Util sortCustomerListArray:unsortedCustomerListArray];
    }
}

#pragma mark TableView Datasource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.customerListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomerListCustomCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    }
    UILabel *customerNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, cell.frame.size.width-20,30)];
    [customerNameLabel setText:[[self.customerListArray objectAtIndex:indexPath.row] objectForKey:@"name"]];
    [cell.contentView addSubview:customerNameLabel];
    
    UILabel *customerIdLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, cell.frame.size.width-20,30)];
    [customerIdLabel setText:[NSString stringWithFormat:@"User Id - %@",[[self.customerListArray objectAtIndex:indexPath.row] objectForKey:@"user_id"]]];
    customerIdLabel.font = [UIFont fontWithName:@"helvetica" size:12];
    [cell.contentView addSubview:customerIdLabel];

    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
