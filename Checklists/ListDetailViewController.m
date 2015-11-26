//
//  ListDetailViewController.m
//  Checklists
//
//  Created by penddy on 15/11/17.
//  Copyright © 2015年 penddy. All rights reserved.
//

#import "ListDetailViewController.h"
#import "Checklist.h"


@interface ListDetailViewController ()

@end

@implementation ListDetailViewController{

    NSString *_iconName;
}


-(id)initWithCoder:(NSCoder *)aDecoder{
    
    if((self = [super initWithCoder:aDecoder])){
        _iconName = @"Folder";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(self.checklistToEdit != nil){
        self.title = @"Edit Checklist";
        self.textField.text = self.checklistToEdit.name;
        self.doneBarButton.enabled = YES;
        _iconName = self.checklistToEdit.iconName;
//        NSLog(@"the button is %@",self.doneBarButton.enabled?@"YES":@"NO");
    }
    self.iconImageView.image = [UIImage imageNamed:_iconName];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.textField becomeFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(id)sender{
    [self.delegate listDetailViewControllerDidCancel:self];
}

- (IBAction)done:(id)sender{
    NSLog(@"Enter the done progress!");
    if(self.checklistToEdit == nil){
        Checklist *checklist = [[Checklist alloc]init];
        checklist.name = self.textField.text;
        checklist.iconName = _iconName;
        
        [self.delegate listDetailViewController:self didFinishAddingChecklist:checklist];
    }else{
        self.checklistToEdit.name = self.textField.text;
        self.checklistToEdit.iconName = _iconName;
        [self.delegate listDetailViewController:self didFinishEditingChecklist:self.checklistToEdit];
    }
}

-(NSIndexPath *)tableview:(UITableView *)tableview willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 1){
        return indexPath;
    }else{
        return nil;
    }
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(nonnull NSString *)string{
    NSString *newText = [textField.text stringByReplacingCharactersInRange:range withString:string];

//    self.doneBarButton.enabled = YES;
    self.doneBarButton.enabled = ([newText length] > 0);
//    NSLog(@"Change the text!the text is %@,the button is %@,the lenght is %d",newText,self.doneBarButton.enabled?@"YES":@"NO",[newText length]);
    return YES;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"PickIcon"]){
        
        IconPickerViewController *controller = segue.destinationViewController;
        controller.delegate = self;
    }
}

-(void)iconPicker:(IconPickerViewController *)picker didPickIcon:(NSString *)iconName{
    
    _iconName = iconName;
    
    self.iconImageView.image = [UIImage imageNamed:_iconName];
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
