//
//  PopLIstView.m
//  PopLIstView
//
//  Created by ap2 on 15/9/16.
//  Copyright (c) 2015年 ap2. All rights reserved.
//

#import "PopLIstView.h"

const NSInteger rowHeight = 42;

@implementation PopLIstView

+ (instancetype)popListView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"PopListView" owner:nil options:nil] lastObject];
}

- (void)awakeFromNib
{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    if (self.dataArr.count > indexPath.row) {
        
        id object = [self.dataArr objectAtIndex:indexPath.row];
        if ([object isKindOfClass: [NSString class]]) {
            cell.textLabel.text = object;
        }else if ([object isKindOfClass: [NSNumber class]]){
        
            cell.textLabel.text = [object stringValue];
        }
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return rowHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.block) {
        self.block(indexPath.row);
    }
}


+ (void)showWithArr:(NSArray *)arr didSelectBlock:(DidSelectAtIndex)block
{
    PopLIstView *view = [PopLIstView popListView];
    view.dataArr = arr;
    
    CGFloat screen_w = [UIScreen mainScreen].bounds.size.width;
    
    CGFloat w = screen_w - 30*2;
    
    if (arr.count > 6) {
        
        view.frame = CGRectMake(0, 0, w, rowHeight*7 + view.tableView.frame.origin.y);
    }else{
    
        view.frame = CGRectMake(0, 0, w, rowHeight*(arr.count+1) + view.tableView.frame.origin.y);
    }
    
    view.block = ^(NSInteger index){
    
        if (block) {
            block(index);
        }
        
        [PopLIstView dismiss];
    };
    
    [[KGModal sharedInstance] showWithContentView:view andAnimated:YES];
    [KGModal sharedInstance].closeButtonType = KGModalCloseButtonTypeNone;
}

+ (void)dismiss
{
    [[KGModal sharedInstance] hideAnimated:YES];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
