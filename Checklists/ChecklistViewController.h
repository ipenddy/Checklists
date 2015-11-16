//
//  ViewController.h
//  Checklists
//
//  Created by penddy on 15/11/8.
//  Copyright © 2015年 penddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemDetailViewController.h"

@class Checklist;

@interface ChecklistViewController : UITableViewController <ItemDetailViewControllerDelegate>

@property(nonatomic,strong)Checklist *checklist;

@end

