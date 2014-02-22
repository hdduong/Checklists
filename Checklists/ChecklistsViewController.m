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

NSMutableArray *_items;


- (void)viewDidLoad
{
    [super viewDidLoad];
   
    _items = [[NSMutableArray alloc] initWithCapacity:20];
    
    ChecklistsItem *item;
    
    item = [[ChecklistsItem alloc] init];
    item.text = @"Walk the dog";
    item.checked = NO;
    [_items addObject:item];
    
    item = [[ChecklistsItem alloc] init];
    item.text = @"Brush my teeth";
    item.checked = YES;
    [_items addObject:item];
    
    item = [[ChecklistsItem alloc] init];
    item.text = @"Learn iOS development";
    item.checked = YES;
    [_items addObject:item];
    
    item = [[ChecklistsItem alloc] init];
    item.text = @"Soccer practice";
    item.checked = NO;
    [_items addObject:item];
    
    item = [[ChecklistsItem alloc] init];
    item.text = @"Eat ice cream";
    item.checked = YES;
    [_items addObject:item];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _items.count;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChecklistItem"];
    
    ChecklistsItem *item = _items[indexPath.row];
    
    [self configureTextForCell:cell withChecklistItem:item];
    [self configureCheckmarkForCell:cell withChecklistItem:item];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    ChecklistsItem *item = _items[indexPath.row];
    [item toggleChecked];
    
    [self configureCheckmarkForCell:cell withChecklistItem:item];

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void) configureCheckmarkForCell:(UITableViewCell*) cell withChecklistItem:(ChecklistsItem*) item {

    if (item.checked) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
}


- (void)configureTextForCell:(UITableViewCell *)cell withChecklistItem:(ChecklistsItem *)item
{
    UILabel *label = (UILabel *)[cell viewWithTag:1000];
    label.text = item.text;
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_items removeObjectAtIndex:indexPath.row];
    
    NSArray *indexPaths = @[indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths
                                       withRowAnimation:UITableViewRowAnimationAutomatic];

}


- (void)addItemViewControllerDidCancel: (AddItemViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)addItemViewController: (AddItemViewController *)controller didFinishAddingItem:(ChecklistsItem *)item {
    
    NSInteger newRowIndex = [_items count];
    [_items addObject:item];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    NSArray *indexPaths = @[indexPath]; [self.tableView insertRowsAtIndexPaths:indexPaths
                                                              withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddItem"]) {
        // 1
        UINavigationController *navigationController = segue.destinationViewController;
        
        // 2
        AddItemViewController *controller = (AddItemViewController *)navigationController.topViewController;
        controller.delegate = self;
    }
}


@end










