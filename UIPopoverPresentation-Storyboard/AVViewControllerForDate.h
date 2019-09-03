//
//  AVViewControllerForDate.h
//  UIPopoverPresentation-Storyboard
//
//  Created by Anatoly Ryavkin on 18/06/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol getDateFromDatePicer <NSObject>
@required
@property (weak, nonatomic) IBOutlet UITextField *textFieldDateBirth;
-(void)instalDate:(NSDate*)date;
-(NSDate*)instalDateFromTextFieldDate;
@end

@interface AVViewControllerForDate : UIViewController

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicer;
@property (strong) id <getDateFromDatePicer> delegat;

- (IBAction)actionDatePiker:(UIDatePicker *)sender;
- (IBAction)actionSave:(UIBarButtonItem *)sender;

@end

NS_ASSUME_NONNULL_END
