//
//  ChecklistsViewController.m
//  Checklists
//
//  Created by Duong Duc Hien on 2/18/14.
//  Copyright (c) 2014 m3hcoril. All rights reserved.
//

#import "ChecklistsViewController.h"
#import "ChecklistsItem.h"

@interface ChecklistsViewController ()


@end

@implementation ChecklistsViewController


/*
NSString *_row0text;
NSString *_row1text;
NSString *_row2text;
NSString *_row3text;
NSString *_row4text;

bool _row0checked;
bool _row1checked;
bool _row2checked;
bool _row3checked;
bool _row4checked;
*/
ChecklistsItem *_row0item;
ChecklistsItem *_row1item;
ChecklistsItem *_row2item;
ChecklistsItem *_row4item;
ChecklistsItem *_row3item;

- (void)viewDidLoad
{
    [super viewDidLoad];
    /*
    _row0text = @"Walk the dog";
    _row1text = @"Brush teeth";
    _row2text = @"Learn iOS development";
    _row3text = @"Soccer practice";
    _row4text = @"Eat ice cream";
    _row1checked = TRUE;
    _row0checked = TRUE;
    _row2checked = TRUE;
    _row3checked = TRUE;
    _row4checked = TRUE;
    */
    
    _row0item = [[ChecklistsItem alloc] init];
    _row0item.text = @"Walk the dog";
    _row0item.checked = NO;
    
    _row1item = [[ChecklistsItem alloc] init];
    _row1item.text = @"Brush teeth";
    _row1item.checked = YES;
    
    
    _row2item = [[ChecklistsItem alloc] init];
    _row2item.text = @"Learn iOS development";
    _row2item.checked = YES;
    
    _row3item = [[ChecklistsItem alloc] init];
    _row3item.text = @"Soccer practice";
    _row3item.checked = YES;
    
    _row4item = [[ChecklistsItem alloc] init];
    _row4item.text = @"Eat the ice cream";
    _row4item.checked = NO;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChecklistItem"];
    
    UILabel *label = (UILabel*) [cell viewWithTag:1000];
    
    
    
    if (indexPath.row % 5 == 0) {
        label.text = _row0item.text;
    }
    else if (indexPath.row % 5 == 1) {
        label.text = _row1item.text;
    }
    else if (indexPath.row % 5 == 2) {
        label.text = _row2item.text;
    }
    else if (indexPath.row % 5 == 3) {
        label.text = _row3item.text;
    }
    else if (indexPath.row % 5 == 4) {
        label.text = _row4item.text;
    }
    
    [self configureCheckmarkForCell:cell atIndexPath:indexPath];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    //BOOL isChecked = FALSE;
    
    if (indexPath.row == 0) {
        _row0item.checked = !_row0item.checked;
    }
    else if (indexPath.row == 1) {
        _row1item.checked = !_row1item.checked;
    }
    else if (indexPath.row == 2) {
        _row2item.checked = !_row2item.checked;
    }
    else if (indexPath.row == 3) {
        _row3item.checked = !_row3item.checked;
    }
    else if (indexPath.row == 4) {
        _row4item.checked= !_row4item.checked;
    }
    
    /*
    if (isChecked) {
        cell.accessoryType = UITableViewCellAccessoryNone;
    } else {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
	
    }
     */
    
    [self configureCheckmarkForCell:cell atIndexPath:indexPath];

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void) configureCheckmarkForCell:(UITableViewCell*) cell atIndexPath:(NSIndexPath*) indexPath {
    
    BOOL isChecked = NO;
    
    if (indexPath.row == 0) {
        isChecked = _row0item.checked;
    }
    else if (indexPath.row == 1) {
        isChecked = _row1item.checked;
    }
    else if (indexPath.row == 2) {
        isChecked = _row2item.checked;
    }
    else if (indexPath.row == 3) {
        isChecked = _row3item.checked;
    }
    else if (indexPath.row == 4) {
        isChecked = _row4item.checked;
    }
    
    if (isChecked) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
}

@end










