//
//  AddItemViewController.h
//  Checklists
//
//  Created by Duong Duc Hien on 2/21/14.
//  Copyright (c) 2014 m3hcoril. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddItemViewController;
@class ChecklistsItem;

@protocol AddItemViewControllerDelegate <NSObject>

-(void) addItemViewControllerDidCancel:(AddItemViewController*)controller;
-(void) addItemViewController:(AddItemViewController *)controller didFinishAddingItem:(ChecklistsItem *)item;

@end




@interface AddItemViewController : UITableViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;

@property (nonatomic, weak) id <AddItemViewControllerDelegate> delegate;

-(IBAction) cancel;
-(IBAction) done;



@end
