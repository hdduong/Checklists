//
//  AddItemViewController.m
//  Checklists
//
//  Created by Duong Duc Hien on 2/21/14.
//  Copyright (c) 2014 m3hcoril. All rights reserved.
//

#import "AddItemViewController.h"
#import "ChecklistsItem.h"

@interface AddItemViewController ()

@end

@implementation AddItemViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel {
    //[self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    [self.delegate addItemViewControllerDidCancel:self];
}

- (IBAction)done {
    
    //NSLog(@"Contents of the text field %@",self.textField);

    //[self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    
    ChecklistsItem *item = [[ChecklistsItem alloc] init];
    item.text = self.textField.text;
    item.checked = NO;
    
    [self.delegate addItemViewController: self didFinishAddingItem:item];
}


- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}


-(void) viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self.textField becomeFirstResponder];
}


- (BOOL)textField:(UITextField *)theTextField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *newText = [theTextField.text stringByReplacingCharactersInRange:range withString:string];
    
    /*
    if ([newText length] > 0) {
        self.doneBarButton.enabled = YES;
    }
    else { self.doneBarButton.enabled = NO;
    
    }
     */
    
    self.doneBarButton.enabled = ([newText length] > 0);

    return YES;

}

@end
