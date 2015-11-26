//
//  IconPickerViewController.h
//  Checklists
//
//  Created by penddy on 15/11/26.
//  Copyright © 2015年 penddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IconPickerViewController;

@protocol IconPickerViewControllerDelegate <NSObject>

-(void)iconPicker:(IconPickerViewController *)picker didPickIcon:(NSString *)iconName;

@end

@interface IconPickerViewController : UITableViewController

@property(nonatomic,weak)id <IconPickerViewControllerDelegate> delegate;

@end
