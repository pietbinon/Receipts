//
//  CoreDataManager.m
//  Receipts
//
//  Created by Dave Augerinos on 2017-03-02.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import "CoreDataManager.h"
//#import "Receipts+CoreDataModel.h"
#import "Tag+CoreDataClass.h"
#import "Receipt+CoreDataClass.h"

@implementation CoreDataManager

+ (instancetype)sharedInstance
{
    static CoreDataManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CoreDataManager alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

- (void)createTag {
    
    if([[self fetchTags] count] == 0 || [self fetchTags] == nil) {
        
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Tag" inManagedObjectContext:self.managedObjectContext];
        
        Tag *personal = [[Tag alloc] initWithEntity:entity insertIntoManagedObjectContext:self.managedObjectContext];
        
        personal.tagName = @"Personal";
        
        Tag *family = [[Tag alloc] initWithEntity:entity insertIntoManagedObjectContext:self.managedObjectContext];
        
        family.tagName = @"Family";
       
        Tag *business = [[Tag alloc] initWithEntity:entity insertIntoManagedObjectContext:self.managedObjectContext];
        
        business.tagName = @"Business";
        
        [self.managedObjectContext save:nil];
    }
}

- (NSArray *)fetchReceipts {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Receipt"];
    NSArray *receipts = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
    return receipts;
}


- (NSArray *)fetchTags {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Tag"];
    NSArray *tags = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];

    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"tagName" ascending:YES];

    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    return tags;
}


- (NSArray *)fetchTagsWithPredicate:(NSPredicate *)predicate {
 
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Tag"];
    NSArray *tagsArray = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    NSArray *resultsArray = [tagsArray filteredArrayUsingPredicate:predicate];
    
    return resultsArray;
}

@end
