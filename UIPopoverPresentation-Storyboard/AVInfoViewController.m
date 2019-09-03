//
//  AVInfoViewController.m
//  UIPopoverPresentation-Storyboard
//
//  Created by Anatoly Ryavkin on 17/06/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import "AVInfoViewController.h"

@interface AVInfoViewController ()

@end

@implementation AVInfoViewController

-(void)dealloc{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)actionCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
