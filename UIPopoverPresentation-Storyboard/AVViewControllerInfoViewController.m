//
//  AVViewControllerInfoViewController.m
//  UIPopoverPresentation-Storyboard
//
//  Created by Anatoly Ryavkin on 17/06/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import "AVViewControllerInfo.h"

@interface AVViewControllerInfo ()

@end

@implementation AVViewControllerInfo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"segue 2");
        //[(UIBarButtonItem*)sender setTitle:@"information"];
}



@end
