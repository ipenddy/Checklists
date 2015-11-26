//
//  DataModel.h
//  Checklists
//
//  Created by penddy on 15/11/25.
//  Copyright © 2015年 penddy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property(nonatomic,strong)NSMutableArray *lists;

-(void)saveChecklists;
-(void)sortChecklists;
-(NSInteger)indexOfSelectedChecklist;
-(void)setIndexOfSelectedChecklist:(NSInteger)index;

@end
