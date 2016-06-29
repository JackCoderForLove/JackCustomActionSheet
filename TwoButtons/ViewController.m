//
//  ViewController.m
//  TwoButtons
//
//  Created by 李策 on 15/11/27.
//  Copyright © 2015年 clh-yasn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic)UITableView * jackTable;
@property (strong,nonatomic)NSMutableArray *  jackData;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.jackData = [NSMutableArray arrayWithObjects:@"玛丽莲梦露",@"angelababy",@"耶稣",@"无敌打球仔", nil];
    [self layoutMyUI];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)layoutMyUI
{
    self.jackTable = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.jackTable.delegate = self;
    self.jackTable.dataSource = self;
    [self.view addSubview:self.jackTable];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.jackData.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * jackID = @"jack";
    UITableViewCell * jackCell = [tableView dequeueReusableCellWithIdentifier:jackID];
    if (!jackCell) {
        jackCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:jackID];
    }
    jackCell.textLabel.text = [self.jackData objectAtIndex:indexPath.row];
    return jackCell;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
        UITableViewRowAction *rowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault
                                                                             title:@"删除"
                                                                           handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
                                                                               NSLog(@"删除");
                                                                           }];
    rowAction.backgroundColor = [UIColor lightGrayColor];
        UITableViewRowAction *rowActionSec = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault
                                                                                title:@"标记"
                                                                              handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
                                                                                  NSLog(@"标记");
                                                                              }];
        rowActionSec.backgroundColor = [UIColor greenColor];
        NSArray *arr = @[rowAction,rowActionSec];
        return arr;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
