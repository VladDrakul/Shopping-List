//
//  NewShoppingItemViewController.h
//  TestingTables
//
//  Created by devin wakefield on 5/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"
#import "ItemsTableController.h"

@interface NewShoppingItemViewController : UIViewController{

}


@property (nonatomic, strong) IBOutlet UIButton *doneButton;
@property (nonatomic, strong) IBOutlet UITextField *nameTextField;
@property (nonatomic, strong) IBOutlet UITextField *categoryTextField;
@property (nonatomic, strong) IBOutlet UIStepper *stepper;
@property (nonatomic, strong) ItemsTableController *parent;
@property NSUInteger parameter;
@property NSUInteger index;

-(IBAction) handleDoneButton;
-(IBAction) handleStepper;
-(IBAction) handleTextEntered;
-(IBAction) textFieldTouched:(id)sender;

@end
