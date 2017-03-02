//
//  ReceiptViewController.m
//  Receipts
//
//  Created by Dave Augerinos on 2017-03-02.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import "ReceiptViewController.h"
#import "ReceiptTableViewCell.h"

@interface ReceiptViewController ()

@property (weak, nonatomic) IBOutlet UITableView *receiptTableView;

@end

@implementation ReceiptViewController

static NSString *const reuseIdentifier = @"receiptCell";
static NSString *const addReceiptVCSegueIdentifier = @"addReceiptVC";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addReceiptButtonPressed:(UIButton *)sender {

    [self performSegueWithIdentifier:addReceiptVCSegueIdentifier sender:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1; // change to count
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ReceiptTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    return cell;
}

@end
