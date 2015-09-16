//
//  PopLIstView.h
//  PopLIstView
//
//  Created by ap2 on 15/9/16.
//  Copyright (c) 2015年 ap2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KGModal.h"

typedef void(^DidSelectAtIndex)(NSInteger index);

@interface PopLIstView : UIView<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *dataArr;
@property (copy, nonatomic) DidSelectAtIndex block;

/**
 *
 *
 *  @param arr   字符串数组
 *  @param block 回调
 */
+ (void)showWithArr:(NSArray *)arr didSelectBlock:(DidSelectAtIndex)block;
+ (void)dismiss;

@end
