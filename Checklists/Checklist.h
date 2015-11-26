//
//  Checklist.h
//  Checklists
//
//  Created by penddy on 15/11/16.
//  Copyright © 2015年 penddy. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Checklist : NSObject<NSCoding>

@property(nonatomic,strong)NSMutableArray *items;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *iconName;

-(int) countUncheckedItems;

@end
