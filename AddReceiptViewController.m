//
//  AddReceiptViewController.m
//  Receipts
//
//  Created by Dave Augerinos on 2017-03-02.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import "AddReceiptViewController.h"
#import "ReceiptViewController.h"
#import "TagTableViewCell.h"
#import "Tag+CoreDataClass.h"
#import "Receipt+CoreDataClass.h"

@interface AddReceiptViewController ()

@property (weak, nonatomic) IBOutlet UILabel *amountLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UITextField *amountTextField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UIDatePicker *receiptDatePicker;
@property (weak, nonatomic) IBOutlet UITableView *tagTableView;
@property (strong, nonatomic) NSMutableArray *cellSelected;
@property (strong, nonatomic) NSMutableSet *tagSelected;

@end

@implementation AddReceiptViewController

- (void)configureView {
    
    self.amountTextField.layer.borderWidth = 0.5;
    self.descriptionTextView.layer.borderWidth = 0.5;
    self.receiptDatePicker.layer.borderWidth = 0.5;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.coreDataManager = [CoreDataManager sharedInstance];
    self.cellSelected = [NSMutableArray array];
    self.tagSelected = [NSMutableSet set];
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveReceiptButtonPressed:(UIButton *)sender {

    [self addNewReceipt];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addNewReceipt {
    
    if(![self.amountTextField.text isEqualToString: @""] && ![self.descriptionTextView.text isEqualToString: @""] ) {
        
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Receipt" inManagedObjectContext:self.coreDataManager.managedObjectContext];
        
        Receipt *receipt = [[Receipt alloc] initWithEntity:entity insertIntoManagedObjectContext:self.coreDataManager.managedObjectContext];
        
        NSDecimalNumber *amount = [[NSDecimalNumber alloc] initWithString: self.amountTextField.text];
        NSDate *date = [self.receiptDatePicker date];
        
        [receipt setValue:amount forKey:@"amount"];
        [receipt setValue:self.descriptionTextView.text forKey:@"note"];
        [receipt setValue:date forKey:@"timeStamp"];
        
        NSPredicate *myPredicate;
        NSMutableArray *tagsArray = [[NSMutableArray alloc] init];
        
        for (NSString *tagName in self.tagSelected) {
            
            myPredicate = [NSPredicate predicateWithFormat:@"tagName = %@", tagName];
            [tagsArray addObjectsFromArray:[[self.coreDataManager fetchTagsWithPredicate: myPredicate] mutableCopy]];
        }
        
        for (Tag *myTag in tagsArray) {

            [receipt addReceiptToTagObject:myTag];
        }
        
        [self.coreDataManager.managedObjectContext save:nil];
    }
}


#pragma mark - Table View -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[self.coreDataManager fetchTags] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TagTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tagCell" forIndexPath:indexPath];
    
    NSArray *tagsArray = [self.coreDataManager fetchTags];
    
    Tag *myTag = tagsArray[indexPath.row];
    
    [cell configureTagCell:myTag];
    
    if ([self.cellSelected containsObject:indexPath])
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    NSArray *tagsArray = [self.coreDataManager fetchTags];
    
    Tag *myTag = tagsArray[indexPath.row];
    
    if ([self.cellSelected containsObject:indexPath])
    {
        [self.tagSelected removeObject:myTag.tagName];
        [self.cellSelected removeObject:indexPath];
    }
    else
    {
        [self.tagSelected addObject:myTag.tagName];
        [self.cellSelected addObject:indexPath];
    }

    [self.tagTableView reloadData];
}


#pragma mark - TextField -

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addNewReceipt) name:UITextFieldTextDidChangeNotification object:nil];
    
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    [self.view endEditing:YES];
    
    [self addNewReceipt];
    
    return NO;
}


- (void)keyboardWillShow:(NSNotification *)notification
{
    [self.view setFrame:CGRectMake(0,-110,self.view.frame.size.width,self.view.frame.size.height)];
    
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    [self.view setFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height)];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.amountTextField resignFirstResponder];
    [self.descriptionTextView resignFirstResponder];
}

@end
