//
//  AddReceiptViewController.h
//  Receipts
//
//  Created by Dave Augerinos on 2017-03-02.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "CoreDataManager.h"
#import "Receipt+CoreDataClass.h"

@interface AddReceiptViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) CoreDataManager *coreDataManager;

@end
