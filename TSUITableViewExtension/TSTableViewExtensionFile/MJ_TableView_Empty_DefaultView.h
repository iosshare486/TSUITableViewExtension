//
//  MJ_TableView_Empty_DefaultView.h
//  MJ_HL_TableViewEmpty
//
//  Created by 洪利 on 2018/6/14.
//  Copyright © 2018年 洪利. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MJ_TableView_Empty_DefaultView : UIView


#pragma mark - 空数据提示图
/**
 只有图片

 @param imageName 图片名字
 @return 返回空数据view
 */
+ (instancetype)createEmptyViewWithImage:(NSString *)imageName;




/**
 图片+文字

 @param imageName 图片名字
 @param contentStr 提示内容
 @return 。。。
 */
+ (instancetype)createEmptyViewWithImage:(NSString *)imageName
                              contentStr:(NSString *)contentStr;


/**
 图片+按钮

 @param imageName 。。
 @param btnTitle 按钮
 @param clickAction 按钮点击回调
 @return 。。
 */
+ (instancetype)createEmptyViewWithImage:(NSString *)imageName
                                btnTitle:(NSString *)btnTitle
                                  action:(void (^)(void))clickAction;


/**
 文字+按钮

 @param contentStr 。。
 @param btnTitle 。。
 @param clickAction 。。
 @return 。。
 */
+ (instancetype)createEmptyViewWithContentStr:(NSString *)contentStr
                                     btnTitle:(NSString *)btnTitle
                                       action:(void (^)(void))clickAction;



/**
 图片+文字+按钮

 @param imageName 。。
 @param contentStr 。。
 @param btnTitle 。。
 @param clickAction 。。
 @return 。。
 */
+ (instancetype)createEmptyViewWithImage:(NSString *)imageName
                              contentStr:(NSString *)contentStr
                                btnTitle:(NSString *)btnTitle
                                  action:(void (^)(void))clickAction;





#pragma makr-  无网络提示图
+ (instancetype)createLostNetConnectViewWithImage:(NSString *)imageName
                              contentStr:(NSString *)contentStr
                                btnTitle:(NSString *)btnTitle
                                  action:(void (^)(void))clickAction;










//重置子视图位置
- (void)mj_hl_reloadSubviews;

@end
