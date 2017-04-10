//
//  ReceiptTableViewCell.h
//  Receipts
//
//  Created by Pierre Binon on 2017-03-27.
//  Copyright © 2017 Pierre Binon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tag+CoreDataClass.h"
#import "Receipt+CoreDataClass.h"




@interface ReceiptTableViewCell : UITableViewCell

- (void)configureReceiptCell:(Receipt *)receipt;

@end
