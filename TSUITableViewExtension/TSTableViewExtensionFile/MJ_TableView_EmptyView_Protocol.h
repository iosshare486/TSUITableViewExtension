//
//  MJ_TableView_EmptyView_Protocol.h
//  MJ_HL_TableViewEmpty
//
//  Created by 洪利 on 2018/6/12.
//  Copyright © 2018年 洪利. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol MJ_TableView_EmptyView_Protocol <NSObject>

@optional
- (UIView *)provideEmptyView;
- (UIView *)provideLostNetConnectView;

@end
