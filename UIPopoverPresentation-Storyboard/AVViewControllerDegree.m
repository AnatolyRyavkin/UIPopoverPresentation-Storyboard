//
//  AVViewControllerDegree.m
//  UIPopoverPresentation-Storyboard
//
//  Created by Anatoly Ryavkin on 18/06/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import "AVViewControllerDegree.h"

@interface AVViewControllerDegree ()

@end

@implementation AVViewControllerDegree

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%ld баг - без этой строки не работает",(long)[self.tableView numberOfRowsInSection:0]);
    NSIndexPath*indexPath = [self.delegat instalDegreeFromTextField];
    if(indexPath){
        UITableViewCell*cell = [self.tableView cellForRowAtIndexPath:indexPath];
        UILabel*label = [cell.contentView.subviews objectAtIndex:0];
        [label setBackgroundColor:[[UIColor blueColor]colorWithAlphaComponent:0.5]];
        self.didIndexPath = indexPath;
    }
}

-(void)dealloc{
    [self.delegat.textFieldDegree resignFirstResponder];
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {

    [self.delegat instalDegree:(Degree)indexPath.row];
    UITableViewCell*cell;
    UILabel*label;
    if(self.didIndexPath){
        cell =  [tableView cellForRowAtIndexPath:self.didIndexPath];
        label = [cell.contentView.subviews objectAtIndex:0];
        [label setBackgroundColor:[UIColor whiteColor]];
    }
    cell =  [tableView cellForRowAtIndexPath:indexPath];
    label = [cell.contentView.subviews objectAtIndex:0];
    [label setBackgroundColor:[[UIColor blueColor]colorWithAlphaComponent:0.5]];
    self.didIndexPath = indexPath;
    return NO;

}


- (IBAction)actionSave:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
