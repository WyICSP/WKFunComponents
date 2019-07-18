//
//  WFViewController.m
//  WKFunComponents
//
//  Created by wyxlh on 07/03/2019.
//  Copyright (c) 2019 wyxlh. All rights reserved.
//

#import "WFViewController.h"
#import "UITextField+RYNumberKeyboard.h"

@interface WFViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@end

@implementation WFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.textField setMoneyKeyboard];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textField:(id)sender {
}
@end
