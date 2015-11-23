//
//  Checklist.m
//  Checklists
//
//  Created by penddy on 15/11/16.
//  Copyright © 2015年 penddy. All rights reserved.
//

#import "Checklist.h"

@implementation Checklist

-(id) init{
    if((self = [super init])){
        self.items = [[NSMutableArray alloc]initWithCapacity:20];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    if((self = [super init])){
        self.name = [aDecoder decodeObjectForKey:@"Name"];
        self.name = [aDecoder decodeObjectForKey:@"Itmes"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"Name"];
    [aCoder encodeObject:self.items forKey:@"Items"];
}
@end

