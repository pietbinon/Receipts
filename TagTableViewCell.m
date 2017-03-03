//
//  TagTableViewCell.m
//  Receipts
//
//  Created by Dave Augerinos on 2017-03-02.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import "TagTableViewCell.h"

@interface TagTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *tagLabel;
@property (strong, nonatomic) Tag *myTag;

@end

@implementation TagTableViewCell

- (void)configureTagCell:(Tag *)tag {
    
    self.myTag = tag;
    self.tagLabel.text = self.myTag.tagName;
}

@end
