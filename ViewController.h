//
//  ViewController.h
//  Checklists
//
//  Created by penddy on 15/11/16.
//  Copyright © 2015年 penddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListDetailViewController.h"

@class DataModel;

@interface ViewController : UITableViewController <ListDetailViewControllerDelegate,UINavigationControllerDelegate>


@property(nonatomic,strong)DataModel *dataModel;

@end
