//
//  ChecklistsViewController.m
//  Checklists
//
//  Created by Duong Duc Hien on 2/18/14.
//  Copyright (c) 2014 m3hcoril. All rights reserved.
//

#import "ChecklistsViewController.h"

@interface ChecklistsViewController ()

@end

@implementation ChecklistsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChecklistItem"];
    
    UILabel *label = (UILabel*) [cell viewWithTag:1000];
    
    if (indexPath.row % 5 == 0) {
        label.text = @"Walk the dog";
    }
    else if (indexPath.row % 5 == 1) {
        label.text = @"Brush my teeth";
    }
    else if (indexPath.row % 5 == 2) {
        label.text = @"Learn iOS development";
    }
    else if (indexPath.row % 5 == 3) {
        label.text = @"Soccer practice";
    }
    else if (indexPath.row % 5 == 4) {
        label.text = @"Eat ice cream";
    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (cell.accessoryType == UITableViewCellAccessoryNone) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end










