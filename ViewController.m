//
//  ViewController.m
//  Checklists
//
//  Created by penddy on 15/11/16.
//  Copyright © 2015年 penddy. All rights reserved.
//

#import "ViewController.h"
#import "Checklist.h"
#import "ChecklistViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    NSMutableArray *_lists;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    if((self = [super initWithCoder:aDecoder])){
        _lists = [[NSMutableArray alloc]initWithCapacity:20];
        Checklist *list;
        
        list = [[Checklist alloc]init];
        list.name = @"娱乐";
        [_lists addObject:list];
        
        list = [[Checklist alloc]init];
        list.name = @"工作";
        [_lists addObject:list];
        
        list = [[Checklist alloc]init];
        list.name = @"学习";
        [_lists addObject:list];

        list = [[Checklist alloc]init];
        list.name = @"家庭";
        [_lists addObject:list];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_lists count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *Cellidentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Cellidentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Cellidentifier];
    }
    Checklist *checklist = _lists[indexPath.row];
    cell.textLabel.text = checklist.name;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}


-(void) talbeView:(UITableView *)tableview didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Some row is selected!");      
    Checklist *checklist = _lists[indexPath.row];
    NSLog(@"checklist name is %@",checklist.name);
    [self performSegueWithIdentifier:@"ShowChecklist" sender:checklist];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"ShowChecklist"]){
        
        ChecklistViewController *controller = segue.destinationViewController;
        controller.checklist = sender;
    }
}

@end
