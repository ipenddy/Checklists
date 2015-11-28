//
//  AddItemViewController.h
//  Checklists
//
//  Created by penddy on 15/11/14.
//  Copyright © 2015年 penddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ItemDetailViewController;
@class ChecklistItem;
@protocol ItemDetailViewControllerDelegate <NSObject>
-(void)itemDetailViewControllerDidCancel:(ItemDetailViewController *)controller;

-(void)itemDetailViewController:(ItemDetailViewController *)controller didFinishAddingItem:(ChecklistItem *)item;

-(void)itemDetailViewController:(ItemDetailViewController *)controller didFinishEditingItem:(ChecklistItem *)item;

@end

@interface ItemDetailViewController : UITableViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property(nonatomic,weak)IBOutlet UISwitch *switchControl;


@property (weak, nonatomic) IBOutlet UILabel *dueDateLabel;



@property (weak,nonatomic) id <ItemDetailViewControllerDelegate> delegate;

@property (nonatomic,strong) ChecklistItem *itemToEdit;
@end
