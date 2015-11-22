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
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    return cell;
}


-(void) tableView:(UITableView *)tableview didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Some row is selected!");      
    Checklist *checklist = _lists[indexPath.row];
    NSLog(@"checklist name is %@",checklist.name);
    [self performSegueWithIdentifier:@"ShowChecklist" sender:checklist];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"ShowChecklist"]){
        
        ChecklistViewController *controller = segue.destinationViewController;
        controller.checklist = sender;
    }else if([segue.identifier isEqualToString:@"AddChecklist"]){
        UINavigationController *navigationController = segue.destinationViewController;
        
        ListDetailViewController *controller = (ListDetailViewController *)navigationController.topViewController;
        
        controller.delegate = self;
        controller.checklistToEdit = nil;
    }
}

-(void)listDetailViewControllerDidCancel:(ListDetailViewController *)controller{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)listDetailViewController:(ListDetailViewController *)controller didFinishAddingChecklist:(Checklist *)checklist{
    
    NSInteger newRowIndex=[_lists count];
    [_lists addObject:checklist];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    
    NSArray *indexPaths = @[indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)listDetailViewController:(ListDetailViewController *)controller didFinishEditingChecklist:(Checklist *)checklist{
    NSInteger index = [_lists indexOfObject:checklist];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.text = checklist.name;
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [_lists removeObjectAtIndex:indexPath.row];
    
    NSArray *indexPaths = @[indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    UINavigationController *navigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"ListNavigationController"];
    ListDetailViewController *controller = (ListDetailViewController *)navigationController.topViewController;
    controller.delegate = self;
    Checklist *checklist = _lists[indexPath.row];
    controller.checklistToEdit  = checklist;
    
    [self presentViewController:navigationController animated:YES completion:nil];
    
}


@end
