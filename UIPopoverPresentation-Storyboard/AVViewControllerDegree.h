//
//  AVViewControllerDegree.h
//  UIPopoverPresentation-Storyboard
//
//  Created by Anatoly Ryavkin on 18/06/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum{
    DegreePrimary = 0,
    DegreeSecondary,
    DegreeIncompleteHigher,
    DegreeHigher
}Degree;

@protocol getDegreeFromTableDegree <NSObject>
@required
@property (weak, nonatomic) IBOutlet UITextField *textFieldDegree;
-(NSIndexPath*)instalDegreeFromTextField;
-(void)instalDegree:(Degree)degree;
@end

@interface AVViewControllerDegree : UITableViewController

@property (strong, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) IBOutlet UITableView *tViev;
@property UITableViewCell*cellForDid;
@property NSIndexPath*didIndexPath;

@property id <getDegreeFromTableDegree>  delegat;

- (IBAction)actionSave:(id)sender;

@end

NS_ASSUME_NONNULL_END
