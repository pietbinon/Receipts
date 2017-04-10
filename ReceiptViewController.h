//
//  ReceiptViewController.h
//  Receipts
//
//  Created by Pierre Binon on 2017-03-27.
//  Copyright © 2017 Pierre Binon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataManager.h"



@interface ReceiptViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) CoreDataManager *coreDataManager;

@end
