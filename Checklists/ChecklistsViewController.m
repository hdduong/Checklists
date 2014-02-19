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

- (void)viewDidLoad
{
    [super viewDidLoad];
    _row0text = @"Walk the dog";
    _row1text = @"Brush teeth";
    _row2text = @"Learn iOS development";
    _row3text = @"Soccer practice";
    _row4text = @"Eat ice cream";
    _row1checked = TRUE;
    _row0checked = TRUE;
   // _row2checked = TRUE;
    //_row3checked = TRUE;
    _row4checked = TRUE;
    
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
        label.text = _row0text;
    }
    else if (indexPath.row % 5 == 1) {
        label.text = _row1text;
    }
    else if (indexPath.row % 5 == 2) {
        label.text = _row2text;
    }
    else if (indexPath.row % 5 == 3) {
        label.text = _row3text;
    }
    else if (indexPath.row % 5 == 4) {
        label.text = _row4text;
    }
    
    [self configureCheckmarkForCell:cell atIndexPath:indexPath];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    BOOL isChecked = FALSE;
    
    if (indexPath.row == 0) {
        isChecked = _row0checked;
        _row0checked = !_row0checked;
    }
    else if (indexPath.row == 1) {
        isChecked = _row1checked;
        _row1checked = !_row1checked;
    }
    else if (indexPath.row == 2) {
        isChecked = _row2checked;
        _row2checked = !_row2checked;
    } else if (indexPath.row == 3) {
        isChecked = _row3checked;
        _row3checked = !_row3checked;
    } else if (indexPath.row == 4) {
        isChecked = _row4checked;
        _row4checked = !_row4checked;
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
        isChecked = _row0checked;
    }
    else if (indexPath.row == 1) {
        isChecked = _row1checked;
    } else if (indexPath.row == 2) {
        
        isChecked = _row2checked;
    } else if (indexPath.row == 3) {
        isChecked = _row3checked;
    } else if (indexPath.row == 4) {
        isChecked = _row4checked;
    }
    
    if (isChecked) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
}

@end










