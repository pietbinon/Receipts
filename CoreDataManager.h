//
//  CoreDataManager.h
//  Receipts
//
//  Created by Dave Augerinos on 2017-03-02.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataManager : NSObject

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

+ (instancetype)sharedInstance;
- (void)createTag;
- (NSArray *)fetchReceipts;
- (NSArray *)fetchTags;
- (NSArray *)fetchTagsWithPredicate:(NSPredicate *)predicate;

@end
