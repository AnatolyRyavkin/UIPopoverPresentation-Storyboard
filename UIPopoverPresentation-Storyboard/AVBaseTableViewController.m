//
//  AVBaseTableViewController.m
//  UIPopoverPresentation-Storyboard
//
//  Created by Anatoly Ryavkin on 17/06/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import "AVBaseTableViewController.h"


@interface AVBaseTableViewController ()

@end

@implementation AVBaseTableViewController
-(id)init{
    self= [super init];
    self = [self.storyboard instantiateViewControllerWithIdentifier:@"AVBaseTableViewController"];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textFieldDateBirth.delegate=self;
    self.textFieldDateBirth.inputView = [UIView new];
    self.textFieldDegree.delegate=self;
    self.textFieldDegree.inputView = [UIView new];
    self.textFieldFirstName.delegate=self;
    self.textFieldLastName.delegate=self;
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self load];
}

-(void)load{
    self.textFieldDateBirth.text = [[NSUserDefaults standardUserDefaults] objectForKey:dateBirth];
    self.textFieldDegree.text = [[NSUserDefaults standardUserDefaults] objectForKey:degree];
    self.textFieldFirstName.text = [[NSUserDefaults standardUserDefaults] objectForKey:firstName];
    self.textFieldLastName.text = [[NSUserDefaults standardUserDefaults] objectForKey:lastName];
    self.segmentedGender.selectedSegmentIndex = [[NSUserDefaults standardUserDefaults] integerForKey:segmentedGender];

    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)saveUserDefauit{

    [[NSUserDefaults standardUserDefaults] setObject:self.textFieldFirstName.text forKey:firstName];
    [[NSUserDefaults standardUserDefaults] setObject:self.textFieldLastName.text forKey:lastName];
    [[NSUserDefaults standardUserDefaults] setInteger:self.segmentedGender.selectedSegmentIndex forKey:segmentedGender];
    [[NSUserDefaults standardUserDefaults] setObject:self.textFieldDateBirth.text forKey:dateBirth];
    [[NSUserDefaults standardUserDefaults] setObject:self.textFieldDegree.text forKey:degree];

    [[NSUserDefaults standardUserDefaults] synchronize];

}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller{
    return UIModalPresentationNone;
}

#pragma  mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"seguePopDate"]){
        UINavigationController*nc = segue.destinationViewController;
        AVViewControllerForDate*dvc = (AVViewControllerForDate*)(nc.topViewController);
        dvc.delegat = self;
        UIPopoverPresentationController*pc = nc.popoverPresentationController;
        pc.permittedArrowDirections = UIPopoverArrowDirectionUp;
        pc.sourceView = self.textFieldDateBirth;
        pc.sourceRect = CGRectMake(0, 0, CGRectGetWidth(self.textFieldDateBirth.frame), CGRectGetHeight(self.textFieldDateBirth.frame));
    }

    if([segue.identifier isEqualToString:@"seguePopDegree"]){
        UINavigationController*nc = segue.destinationViewController;
        AVViewControllerDegree*dvc = (AVViewControllerDegree*)nc.topViewController;
        dvc.delegat = self;
        UIPopoverPresentationController*pc = nc.popoverPresentationController;
        pc.permittedArrowDirections = UIPopoverArrowDirectionRight;
        pc.sourceView = self.textFieldDegree;
        pc.sourceRect = CGRectMake(0, 0, CGRectGetWidth(self.textFieldDegree.frame), CGRectGetHeight(self.textFieldDegree.frame));
    }

}

- (void)performSegueWithIdentifier:(NSString *)identifier sender:(nullable id)sender{
    [super performSegueWithIdentifier:identifier sender:sender]; // aviable overread
}

#pragma mark - Instal Data

-(void)instalDate:(NSDate*)date{
    NSDateFormatter*formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"dd/MMM/yyyy";
    self.textFieldDateBirth.text = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
}

-(NSDate*)instalDateFromTextFieldDate{
    NSDateFormatter*formatter = [[NSDateFormatter alloc]init];
    formatter.calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    formatter.dateFormat = @"dd/MMM/yyyy";

    NSDate*date = ([formatter dateFromString:self.textFieldDateBirth.text] != nil) ? [formatter dateFromString:self.textFieldDateBirth.text] : [NSDate date];
    return date;
}


-(void)instalDegree:(Degree)degree{
    switch (degree) {
        case DegreeHigher:
            self.textFieldDegree.text = @" Higher";
            break;
        case DegreePrimary:
            self.textFieldDegree.text = @" Primary";
            break;
        case DegreeSecondary:
            self.textFieldDegree.text = @" Secondary";
            break;
        case DegreeIncompleteHigher:
            self.textFieldDegree.text = @" Incomplete Higher";
            break;
        default:
            break;
    }

}

-(NSIndexPath*)instalDegreeFromTextField{
    NSIndexPath*indexPath=nil;
    if([self.textFieldDegree.text isEqualToString: @" Higher"]){
        indexPath = [NSIndexPath indexPathForRow:3 inSection:0];
    }
    if([self.textFieldDegree.text isEqualToString:  @" Primary"]){
        indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    }
    if([self.textFieldDegree.text isEqualToString: @" Secondary"]){
        indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    }
    if([self.textFieldDegree.text isEqualToString: @" Incomplete Higher"]){
        indexPath = [NSIndexPath indexPathForRow:2 inSection:0];
    }
    return indexPath;
}

- (IBAction)reasDatePicker:(UITextField *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    [self performSegueWithIdentifier:@"seguePopDate" sender:nil];

}

- (IBAction)reasTabDegree:(UITextField *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    [self performSegueWithIdentifier:@"seguePopDegree" sender:nil];

}

- (IBAction)actionSegmentGender:(id)sender {
    [self saveUserDefauit];
}

#pragma mark -inputName&NameFamily and TextFiledDelegat

- (void)textFieldDidBeginEditing:(UITextField *)textField;{

}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    [self saveUserDefauit];
}

-(NSString*)stringOldName: (NSString*)textFieldString stringNewName: (NSString*)string rangeInput: (NSRange)range{

    NSMutableString*stringTemp=[[NSMutableString alloc]initWithString:textFieldString];

    NSMutableCharacterSet *setControl = [NSMutableCharacterSet letterCharacterSet];
    [setControl invert];

    NSArray*arrayCheckAtNumber=[string componentsSeparatedByCharactersInSet:setControl];

    if(arrayCheckAtNumber.count==1){
        [stringTemp replaceCharactersInRange:range withString:string];
        return stringTemp;
    }else{
        return textFieldString;
    }
}

- (IBAction)actionClean:(id)sender {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:firstName];
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:firstName];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:lastName];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:dateBirth];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:degree];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:segmentedGender];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[NSUserDefaults standardUserDefaults] synchronize];

    });

    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self load];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{

    switch (textField.tag) {
        case 1:
            if(textField.text.length+string.length<20 && ![string isEqualToString:@""]){
                textField.text = [self stringOldName:textField.text stringNewName:string rangeInput:range];
                return NO;
            }else if([string isEqualToString:@""]){
                return YES;
            }
            break;
        case 2:
            if(textField.text.length+string.length<20 && ![string isEqualToString:@""]){
                textField.text = [self stringOldName:textField.text stringNewName:string rangeInput:range];
                return NO;
            }else if([string isEqualToString:@""]){
                return YES;
            }
            break;
        case 3:
            return NO;
            break;
        case 4:
           return NO;
            break;
        default:
            return NO;
            break;
    }
    return NO;
}


- (BOOL)textFieldShouldClear:(UITextField *)textField{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    switch (textField.tag) {
        case 1:
            [self.textFieldLastName becomeFirstResponder];
            break;
        case 2:
            [self.textFieldDateBirth becomeFirstResponder];
            break;
        case 3:
            [self.textFieldDegree becomeFirstResponder];
            break;
        case 4:
             [self dismissViewControllerAnimated:YES completion:nil];
            break;
        default:
            break;
    }
    return NO;
}


@end
