//
//  TagTableViewCell.h
//  Receipts
//
//  Created by Dave Augerinos on 2017-03-02.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Receipts+CoreDataModel.h"

@interface TagTableViewCell : UITableViewCell

- (void)configureTagCell:(Tag *)tag;

@end
