//
//  ItemDetailViewController.h
//  Checklists
//
//  Created by Duong Duc Hien on 2/21/14.
//  Copyright (c) 2014 m3hcoril. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ItemDetailViewController;
@class ChecklistsItem;

@protocol ItemDetailViewControllerDelegate <NSObject>

-(void) itemDetailViewControllerDidCancel:(ItemDetailViewController*)controller;
-(void) itemDetailViewController:(ItemDetailViewController *)controller didFinishAddingItem:(ChecklistsItem *)item;
- (void)itemDetailViewController:(ItemDetailViewController *)controller didFinishEditingItem:(ChecklistsItem *)item;
@end




@interface ItemDetailViewController : UITableViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;

@property (nonatomic, weak) id <ItemDetailViewControllerDelegate> delegate;

@property (nonatomic, strong) ChecklistsItem *itemToEdit;

-(IBAction) cancel;
-(IBAction) done;



@end
