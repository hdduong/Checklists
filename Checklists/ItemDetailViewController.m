//
//  ItemDetailViewController.m
//  Checklists
//
//  Created by Duong Duc Hien on 2/21/14.
//  Copyright (c) 2014 m3hcoril. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "ChecklistsItem.h"

@interface ItemDetailViewController ()

@end

@implementation ItemDetailViewController

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


    if (self.itemToEdit != nil) {
        self.title = @"Edit Item";
        self.textField.text = self.itemToEdit.text;
        self.doneBarButton.enabled = YES;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel {
    //[self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    [self.delegate itemDetailViewControllerDidCancel:self];
}

- (IBAction)done {
    
    //NSLog(@"Contents of the text field %@",self.textField);

    //[self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    
    if (self.itemToEdit == nil) {
        ChecklistsItem *item = [[ChecklistsItem alloc] init];
        item.text = self.textField.text;
        item.checked = NO;
    
        [self.delegate itemDetailViewController: self didFinishAddingItem:item];
    } else {
        self.itemToEdit.text = self.textField.text;
        //self.itemToEdit.text = @"This is edited item";
        
        [self.delegate itemDetailViewController:self didFinishEditingItem:self.itemToEdit]; //same reference item. Change here means change the reuturn
    }
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
