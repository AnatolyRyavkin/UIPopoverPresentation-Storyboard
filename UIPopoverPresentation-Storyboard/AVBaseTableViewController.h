//
//  AVBaseTableViewController.h
//  UIPopoverPresentation-Storyboard
//
//  Created by Anatoly Ryavkin on 17/06/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVViewControllerInfo.m"
#import "AVViewControllerForDate.h"
#import "AVViewControllerDegree.h"

NS_ASSUME_NONNULL_BEGIN

static NSString*firstName = @"firstName";
static NSString*lastName= @"lastName";
static NSString*segmentedGender = @"segmentedGender";
static NSString*dateBirth = @"dateBirth";
static NSString*degree = @"degree";

@interface AVBaseTableViewController : UITableViewController<UIPopoverPresentationControllerDelegate,UIAdaptivePresentationControllerDelegate,getDateFromDatePicer,UITextFieldDelegate,getDegreeFromTableDegree,UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *labelFirstName;
@property (weak, nonatomic) IBOutlet UILabel *labelLastName;
@property (weak, nonatomic) IBOutlet UILabel *labelGender;
@property (weak, nonatomic) IBOutlet UILabel *labelDateBirth;
@property (weak, nonatomic) IBOutlet UILabel *labelDegree;


@property (weak, nonatomic) IBOutlet UITextField *textFieldFirstName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldLastName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldDegree;
@property (weak, nonatomic) IBOutlet UITextField *textFieldDateBirth;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedGender;

@property (weak, nonatomic) IBOutlet UINavigationItem *navigationItem;
@property (strong, nonatomic) IBOutlet UITableView *tableBase;

-(void)instalDate:(NSDate*)date;
-(void)instalDegree:(Degree)degree;

-(NSString*)stringOldName: (NSString*)textFieldString stringNewName: (NSString*)string rangeInput: (NSRange)range;

- (IBAction)actionClean:(id)sender;

- (IBAction)reasDatePicker:(UITextField *)sender;
- (IBAction)reasTabDegree:(UITextField *)sender;
- (IBAction)actionSegmentGender:(id)sender;



@end

NS_ASSUME_NONNULL_END
