//
//  ListDetailViewController.h
//  Checklists
//
//  Created by penddy on 15/11/17.
//  Copyright © 2015年 penddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChecklistItem.h"
#import "IconPickerViewController.h"



@class ListDetailViewController;
@class Checklist;

@protocol ListDetailViewControllerDelegate <NSObject>

-(void)listDetailViewControllerDidCancel:(ListDetailViewController *)controller;
-(void)listDetailViewController:(ListDetailViewController *)controller didFinishAddingChecklist:(Checklist *)checklist;
-(void)listDetailViewController:(ListDetailViewController *)controller didFinishEditingChecklist:(Checklist *)checklist;
@end

@interface ListDetailViewController :UITableViewController <UITextFieldDelegate,IconPickerViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;

@property(nonatomic,weak)IBOutlet UITextField *textField;
//@property(nonatomic,weak)IBOutlet UIBarButtonItem *doneBarButton;
@property(nonatomic,weak)id <ListDetailViewControllerDelegate> delegate;

@property(nonatomic,strong)Checklist *checklistToEdit;

-(IBAction)cancel:(id)sender;
-(IBAction)done:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@end
