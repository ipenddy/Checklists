//
//  DataModel.m
//  Checklists
//
//  Created by penddy on 15/11/25.
//  Copyright © 2015年 penddy. All rights reserved.
//

#import "DataModel.h"
#import "Checklist.h"


@implementation DataModel

- (void) registerDefaults{

    NSDictionary *dictionary = @{@"ChecklistIndex":@-1,@"FirstTime":@YES,@"ChecklistItemId":@0};
    [[NSUserDefaults standardUserDefaults]registerDefaults:dictionary];
}

-(id)init{
    if((self = [super init])){
        [self loadChecklsits];
        [self registerDefaults];
        [self handleFistTime];
    }
    return self;
}

-(void)handleFistTime{
    BOOL firstTime = [[NSUserDefaults standardUserDefaults]boolForKey:@"FirstTime"];
    if(firstTime){
        
        Checklist *checklist = [[Checklist alloc]init];
        
        checklist.name = @"List";
        [self.lists addObject:checklist];
        [self setIndexOfSelectedChecklist:0];
        [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"FirstTime"];
    }
}
-(NSString *)documentsDirectory{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    NSString *documentsDirectory = [paths firstObject];
    
    return documentsDirectory;
}

-(NSString *)dataFilePath{
    return [[self documentsDirectory]stringByAppendingPathComponent:@"Checklists.plist"];
}

-(void)saveChecklists{
    
    NSMutableData *data = [[NSMutableData alloc]init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    [archiver encodeObject:self.lists forKey:@"Checklists"];
    [archiver finishEncoding];
    NSLog(@"The Path is %@",[self dataFilePath]);
    [data writeToFile:[self dataFilePath] atomically:YES];
}


-(void)loadChecklsits{
    
    NSString *path = [self dataFilePath];
    if([[NSFileManager defaultManager]fileExistsAtPath:path]){
        NSData *data = [[NSData alloc]initWithContentsOfFile:path];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
        
        self.lists = [unarchiver decodeObjectForKey:@"Checklists"];
        
        [unarchiver finishDecoding];
    }else{
        self.lists = [[NSMutableArray alloc]initWithCapacity:20];
    }
}

-(NSInteger) indexOfSelectedChecklist{

    return [[NSUserDefaults standardUserDefaults]integerForKey:@"ChecklistIndex"];
    
}
-(void)setIndexOfSelectedChecklist:(NSInteger)index{
    
    [[NSUserDefaults standardUserDefaults]setInteger:index forKey:@"ChecklistIndex"];
    
}

-(void)sortChecklists{
    [self.lists sortUsingSelector:@selector(compare:)];
}

+(NSInteger)nextChecklistId{
    
    NSUserDefaults *userDefaults= [NSUserDefaults standardUserDefaults];
                     
    NSInteger itemId = [userDefaults integerForKey:@"ChecklistItemId"];
    
    [userDefaults setInteger:itemId+1 forKey:@"ChecklistItemId"];
    [userDefaults synchronize];
    return itemId;
}
@end
