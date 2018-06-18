//
//  UITableView+EmptyControl.m
//  TableViewEmptyView
//
//  Created by 洪利 on 2018/6/12.
//  Copyright © 2018年 洪利. All rights reserved.
//



/*
 
 使用：
 extension ViewController:MJ_TableView_EmptyView_Protocol{
 
     func provideEmptyView() -> UIView! {
     let emptyView = MJ_TableView_Empty_DefaultView.createEmpty(withImage: "wg_award_coin",
     btnTitle: "刷新此页面") {
     NSLog("hahahah")
     }
     //        let emptyView = MJ_TableView_Empty_DefaultView.createEmpty(withImage: "wg_award_coin")
     //        let emptyView = MJ_TableView_Empty_DefaultView.createEmpty(withImage: "wg_award_coin",
     //                                                                   contentStr: "刷新此页面")
     //        let emptyView = MJ_TableView_Empty_DefaultView.createEmpty(withContentStr: "暂无数据",
     //                                                                   btnTitle: "刷新页面") {
     //
     //        }
     //        let emptyView = MJ_TableView_Empty_DefaultView.createLostNetConnect(withImage: "wg_award_coin",
     //                                                                            contentStr: "暂无数据",
     //                                                                            btnTitle: "刷新页面") {
     //
     //        }
 
     return emptyView
     }
     func provideLostNetConnectView() -> UIView! {
     let emptyView = MJ_TableView_Empty_DefaultView.createLostNetConnect(withImage: "wg_award_coin",
     contentStr: "无网络连接",
     btnTitle: "刷新页面",
     action: {
     NSLog("hahahah")
     })
     return emptyView
     }
 
 */





#import "UITableView+EmptyControl.h"
#import <objc/runtime.h>
#import "MJ_TableView_EmptyView_Protocol.h"

@implementation UITableView (EmptyControl)


/**
 标记当前tableView 需要展示的空数据提示View类型

 @param style empty_data_source 空数据 lost_net_connect 无网络连接
 */
- (void)mj_tableView_empty_style:(MJ_TableViewEmpty_Style)style{
    if (style == empty_data_source) {
        self.tableView_empty_style = @"E";
    }
    if (style == lost_net_connect) {
        self.tableView_empty_style = @"L";
    }
}

- (void)mj_hl_reloadData{
    
    [self mj_hl_reloadData];
    // 检查数据是否为空
    if([self checkNoData]){
        // 判断网络状态
        if([self.tableView_empty_style isEqualToString:@"E"]){
            //需要展示空数据类型View
//            UIView *view = [self prov];
            if ([self.delegate respondsToSelector:@selector(provideEmptyView)]) {
                UIView *emptyView = [self.delegate performSelector:@selector(provideEmptyView)];
                [self addSubview:emptyView];
                [emptyView setFrame:CGRectMake(0, self.contentSize.height, self.frame.size.width, self.frame.size.height - self.contentSize.height)];
                if ([emptyView respondsToSelector:NSSelectorFromString(@"mj_hl_reloadSubviews")]) {
                    [emptyView performSelector:NSSelectorFromString(@"mj_hl_reloadSubviews")];
                }
            }
        }else{
            //需要展示无网络连接类型View
            if ([self.delegate respondsToSelector:@selector(provideLostNetConnectView)]) {
                UIView *emptyView = [self.delegate performSelector:@selector(provideLostNetConnectView)];
                [self addSubview:emptyView];
                [emptyView setFrame:CGRectMake(0, self.contentSize.height, self.frame.size.width, self.frame.size.height - self.contentSize.height)];
                if ([emptyView respondsToSelector:NSSelectorFromString(@"mj_hl_reloadSubviews")]) {
                    [emptyView performSelector:NSSelectorFromString(@"mj_hl_reloadSubviews")];
                }
            }
          
        }
    }else{
        if ([self.delegate respondsToSelector:@selector(provideEmptyView)]) {
            UIView *emptyView = [self.delegate performSelector:@selector(provideEmptyView)];
            if (emptyView.superview != nil) {
                [emptyView removeFromSuperview];
            }
        }
        if ([self.delegate respondsToSelector:@selector(provideEmptyView)]) {
            UIView *emptyView = [self.delegate performSelector:@selector(provideEmptyView)];
            if (emptyView.superview != nil) {
                [emptyView removeFromSuperview];
            }
        }
    }
    
}

- (BOOL)checkNoData{
    NSInteger sections = 1;
    NSInteger row = 0;
    BOOL isEmpty = YES;
    if ([self.dataSource respondsToSelector:@selector(numberOfSectionsInTableView:)]) {
        sections = [self.dataSource numberOfSectionsInTableView:self];
    }
    for (NSInteger section = 0; section < sections; section++) {
        if ([self.dataSource respondsToSelector:@selector(tableView:numberOfRowsInSection:)]) {
            row = [self.dataSource tableView:self numberOfRowsInSection:section];
            if (row) {
                // 只要有值都不是空
                isEmpty = NO;
                break;
            }
            else{
                isEmpty = YES;
            }
        }
    }
    return isEmpty;
}



































#pragma makr  -  low
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 交换方法
        [self mj_hl_methodSwizzlingWithOriginalSelector:@selector(reloadData) bySwizzledSelector:@selector(mj_hl_reloadData)];
        
    });
}

+ (void)mj_hl_methodSwizzlingWithOriginalSelector:(SEL)originalSelector bySwizzledSelector:(SEL)swizzledSelector{
    Class class = [self class];
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    BOOL didAddMethod = class_addMethod(class,originalSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class,swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    }
    else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}


static char *static_emptyStyle_key = "static_emptyStyle_key";
@dynamic tableView_empty_style;
- (void)setTableView_empty_style:(NSString *)tableView_empty_style{
    objc_setAssociatedObject(self, &static_emptyStyle_key, tableView_empty_style, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}
- (NSString *)tableView_empty_style{
    if (!objc_getAssociatedObject(self, &static_emptyStyle_key))[self setTableView_empty_style:@"E"];
    return objc_getAssociatedObject(self, &static_emptyStyle_key);
}
@end
