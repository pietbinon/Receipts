//
//  ReceiptTableViewCell.h
//  Receipts
//
//  Created by Dave Augerinos on 2017-03-02.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "Receipts+CoreDataModel.h"
#import "Tag+CoreDataClass.h"
#import "Receipt+CoreDataClass.h"

@interface ReceiptTableViewCell : UITableViewCell

- (void)configureReceiptCell:(Receipt *)receipt;

@end
