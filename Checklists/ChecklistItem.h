//
//  ChecklistItem.h
//  Checklists
//
//  Created by penddy on 15/11/14.
//  Copyright © 2015年 penddy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChecklistItem : NSObject<NSCoding>

@property(nonatomic,copy)NSString *text;
@property(nonatomic,assign)BOOL checked;

@property(nonatomic,copy)NSDate *dueDate;
@property(nonatomic,assign)BOOL shouldRemind;
@property(nonatomic,assign)NSInteger itemId;

-(void) toggleChecked;
-(void) scheduleNotification;


@end
