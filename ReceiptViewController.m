//
//  ReceiptViewController.m
//  Receipts
//
//  Created by Pierre Binon on 2017-03-27.
//  Copyright © 2017 Pierre Binon. All rights reserved.
//

#import "ReceiptViewController.h"
#import "ReceiptTableViewCell.h"
//#import "Receipts+CoreDataModel.h"
#import "Tag+CoreDataClass.h"
#import "Receipt+CoreDataClass.h"




@interface ReceiptViewController ()

@property (weak, nonatomic) IBOutlet UITableView *receiptTableView;
@property (strong, nonatomic) NSMutableArray *receiptsByTagsArray;

@end




@implementation ReceiptViewController

static NSString *const reuseIdentifier = @"receiptCell";
static NSString *const addReceiptVCSegueIdentifier = @"addReceiptVC";


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.coreDataManager = [CoreDataManager sharedInstance];
    self.receiptsByTagsArray = [[NSMutableArray alloc] init];
}


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    
    self.receiptsByTagsArray = [NSMutableArray array];
    
    NSArray *tagsArray = [self.coreDataManager fetchTags];
    
    for (Tag *myTag in tagsArray) {
        
        NSSet *receiptsSet = myTag.tagToReceipt;
        NSMutableArray *receiptsArray = [[receiptsSet allObjects] mutableCopy];
        
        NSSortDescriptor* sortByDate = [NSSortDescriptor sortDescriptorWithKey:@"timeStamp" ascending:YES];
        [receiptsArray sortUsingDescriptors:[NSArray arrayWithObject:sortByDate]];
        
        [self.receiptsByTagsArray addObject:receiptsArray];
    }
    
    [self.receiptTableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)addReceiptButtonPressed:(UIButton *)sender {

    [self performSegueWithIdentifier:addReceiptVCSegueIdentifier sender:self];
}


#pragma mark <UICollectionViewDataSource>

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [[self.coreDataManager fetchTags] count];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.receiptsByTagsArray[section] count];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSArray *tags = [self.coreDataManager fetchTags];
    Tag *tag = tags[section];
    return tag.tagName;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ReceiptTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
 
    NSArray *receiptsArray = self.receiptsByTagsArray[indexPath.section];
 
    Receipt *myReceipt = receiptsArray[indexPath.row];
    
    [cell configureReceiptCell:myReceipt];
    
    return cell;
}

@end
