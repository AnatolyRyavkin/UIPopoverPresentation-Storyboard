//
//  AVViewControllerInfo.h
//  UIPopoverPresentation-Storyboard
//
//  Created by Anatoly Ryavkin on 17/06/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AVViewControllerInfo : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButtonExit;
- (IBAction)actionExit:(UIBarButtonItem *)sender;

@end

NS_ASSUME_NONNULL_END
