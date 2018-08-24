//
//  UITableView+EmptyControl.h
//  TableViewEmptyView
//
//  Created by 洪利 on 2018/6/12.
//  Copyright © 2018年 洪利. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "MJ_TableView_EmptyView_Protocol.h"
typedef NS_ENUM(NSUInteger, MJ_TableViewEmpty_Style) {
    empty_data_source = 0,
    lost_net_connect
};



@interface UITableView (EmptyControl)
/**
 空数据View展示的前置条件，是无数据还是无网络连接
 */
@property (nonatomic, strong) NSString *tableView_empty_style;
//@property (nonatomic, assign) id<MJ_TableView_EmptyView_Protocol>empty_delegate;
@property (nonatomic, strong)NSString *canShowEmptyView;  //第一次默认不展示空数据


- (void)mj_tableView_empty_style:(MJ_TableViewEmpty_Style)style;



@end
