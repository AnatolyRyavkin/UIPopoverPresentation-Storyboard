//
//  AVViewControllerForDate.m
//  UIPopoverPresentation-Storyboard
//
//  Created by Anatoly Ryavkin on 18/06/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import "AVViewControllerForDate.h"

@interface AVViewControllerForDate ()

@end

@implementation AVViewControllerForDate

- (void)viewDidLoad {
    [super viewDidLoad];
    self.datePicer.date = [self.delegat instalDateFromTextFieldDate];
}

-(void)dealloc{
    [self.delegat.textFieldDateBirth resignFirstResponder];
}

- (IBAction)actionDatePiker:(UIDatePicker *)sender {
    [self.delegat instalDate:sender.date];
}

- (IBAction)actionSave:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
