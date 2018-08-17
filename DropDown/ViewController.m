//
//  ViewController.m
//  DropDown
//
//  Created by Masum Biswas on 16/8/18.
//  Copyright © 2018 Masum Biswas. All rights reserved.
//

#import "ViewController.h"

#define dropdownheightConstant 300

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *dropDownList;
@property (weak, nonatomic) IBOutlet UIButton *dropDownButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *dropDownListHeightConstraint;
@property (weak, nonatomic) IBOutlet UIImageView *dropDownArrowImageView;
@property (assign , nonatomic) BOOL isDropDownOpened;
@property (strong , nonatomic) NSMutableArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isDropDownOpened = NO;
    self.dropDownListHeightConstraint.constant = 0;
    self.dataSource = [NSMutableArray arrayWithCapacity:0];
    [self.dataSource addObject:@"Hello my friend "];
    [self.dataSource addObject:@"Hello my friend "];
    [self.dataSource addObject:@"Hello my friend "];
    [self.dataSource addObject:@"Hello my friend "];
    [self.dataSource addObject:@"Hello my friend "];
    [self.dataSource addObject:@"Hello my friend "];
    [self.dataSource addObject:@"Hello my friend "];
    [self.dataSource addObject:@"Hello my friend "];
    [self.dataSource addObject:@"Hello my friend "];
    [self.dataSource addObject:@"Hello my friend "];
    [self.dataSource addObject:@"Hello my friend "];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)dropDownButtonPressed:(id)sender {
    [self showHideDropDownList];
}

- (void)showHideDropDownList
{
    
    CGRect frame = self.dropDownList.frame;
    
    [UIView animateWithDuration:0.4 animations:^{
        
        if (self.isDropDownOpened) {
            self.dropDownList.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 0);
        }else{
            self.dropDownList.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, dropdownheightConstant);
        }
        
        [self.dropDownList layoutIfNeeded];

    } completion:^(BOOL finished) {
        if (self.isDropDownOpened) {
            self.dropDownArrowImageView.image = [UIImage imageNamed:@"customPopViewDownArrow"];
        }else{
            self.dropDownArrowImageView.image = [UIImage imageNamed:@"customPopViewUpArrow"];
        }
        
        self.isDropDownOpened = !self.isDropDownOpened;
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@_%ld",[self.dataSource objectAtIndex:indexPath.row],indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self showHideDropDownList];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"You Select" message:[NSString stringWithFormat:@"%@_%ld",[self.dataSource objectAtIndex:indexPath.row],indexPath.row] preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
                         {
                             
                         }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancel];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
    
}

@end
