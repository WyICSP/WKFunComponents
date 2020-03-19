//
//  WFViewController.m
//  WKFunComponents
//
//  Created by wyxlh on 07/03/2019.
//  Copyright (c) 2019 wyxlh. All rights reserved.
//

#import "WFViewController.h"
#import "UITextField+RYNumberKeyboard.h"
#import "WFTitleBaseViewController.h"
#import "WFWebViewController.h"

#import "WFHorseRaceLamp.h"

@interface WFViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic, weak) WFHorseRaceLamp *marqueeControl;
@end

@implementation WFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    [self.textField setMoneyKeyboard];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10.f, 160.f, 200, 30.f)];
    label.text = @"NSString类型：";
    [self.view addSubview:label];
    
    NSString *string = @"我是跑马灯，我只能不停的滚跑马灯，我只能不停的滚跑马灯，我只能不停的滚动才能";
    self.marqueeControl.marqueeLabel.text = string;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    WFWebViewController *title = [[WFWebViewController alloc] init];
    [self.navigationController pushViewController:title animated:YES];
}

#pragma mark - Getter
- (WFHorseRaceLamp *)marqueeControl {
    if (!_marqueeControl) {
        WFHorseRaceLamp *control = [[WFHorseRaceLamp alloc] initWithFrame:CGRectMake(10.f, 200.f, 300, 40.f)];
        control.backgroundColor = [UIColor redColor];
        [self.view addSubview:control];
        
        _marqueeControl = control;
    }
    
    return _marqueeControl;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textField:(id)sender {
    
}
@end
