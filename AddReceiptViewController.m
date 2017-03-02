//
//  AddReceiptViewController.m
//  Receipts
//
//  Created by Dave Augerinos on 2017-03-02.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import "AddReceiptViewController.h"

@interface AddReceiptViewController ()

@property (weak, nonatomic) IBOutlet UILabel *amountLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UITextField *amountTextField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UIDatePicker *receiptDatePicker;
@property (weak, nonatomic) IBOutlet UITableView *categoryTableView;


@end

@implementation AddReceiptViewController

- (void)configureView {
    
    self.amountTextField.layer.borderWidth = 0.5;
    self.descriptionTextView.layer.borderWidth = 0.5;
    self.receiptDatePicker.layer.borderWidth = 0.5;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveReceiptButtonPressed:(UIButton *)sender {

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
