//
//  ReceiptTableViewCell.m
//  Receipts
//
//  Created by Dave Augerinos on 2017-03-02.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import "ReceiptTableViewCell.h"

@interface ReceiptTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *amountLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) Receipt *myReceipt;

@end

@implementation ReceiptTableViewCell

- (void)configureReceiptCell:(Receipt *)receipt {
    
    self.myReceipt = receipt;
    
    // Set labels with object property values
    NSNumberFormatter *formatDollars = [[NSNumberFormatter alloc] init];
    [formatDollars setNumberStyle:NSNumberFormatterCurrencyStyle];
    
    self.amountLabel.text = [formatDollars stringFromNumber:self.myReceipt.amount];

    self.descriptionLabel.text = self.myReceipt.note;
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"MMMM dd, yyyy"];
    NSString *date = [format stringFromDate:self.myReceipt.timeStamp];
    self.dateLabel.text = date;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
