//
//  CoreDataManager.h
//  Receipts
//
//  Created by Pierre Binon on 2017-03-27.
//  Copyright © 2017 Pierre Binon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>



@interface CoreDataManager : NSObject

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

+ (instancetype) sharedInstance;
- (void) createTag;
- (NSArray *) fetchReceipts;
- (NSArray *) fetchTags;
- (NSArray *) fetchTagsWithPredicate: (NSPredicate *) predicate;

@end
