//
//  TagTableViewCell.m
//  Receipts
//
//  Created by Pierre Binon on 2017-03-27.
//  Copyright © 2017 Pierre Binon. All rights reserved.
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
