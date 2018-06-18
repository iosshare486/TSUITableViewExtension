//
//  MJ_TableView_Empty_DefaultView.m
//  MJ_HL_TableViewEmpty
//
//  Created by 洪利 on 2018/6/14.
//  Copyright © 2018年 洪利. All rights reserved.
//

#import "MJ_TableView_Empty_DefaultView.h"


//获取屏幕 宽度、高度
#define MJ_HL_SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define MJ_HL_SCREEN_SCALE (MJ_HL_SCREEN_WIDTH / 350.0f)

#define MJ_HL_SCALE(a) (a * MJ_HL_SCREEN_SCALE)

typedef NS_ENUM(NSUInteger, MJ_Empty_view_style) {
    imageOnly,
    image_text,
    image_button,
    text_button,
    image_text_button
};


@interface MJ_TableView_Empty_DefaultView()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel     *contentLabel;
@property (nonatomic, strong) UIButton    *tishiBtn;
@property (nonatomic, assign) MJ_Empty_view_style contetnStyle;
@property (nonatomic, copy) void (^ btnClick)(void);


@end


@implementation MJ_TableView_Empty_DefaultView

#pragma mark - 空数据提示图
/**
 只有图片

 @param imageName 图片名字
 @return 返回空数据view
 */
+ (instancetype)createEmptyViewWithImage:(NSString *)imageName{
    MJ_TableView_Empty_DefaultView *view = [[MJ_TableView_Empty_DefaultView alloc] init];
    [view configSubviewsWithStyle:imageOnly];
    view.imageView.image = [UIImage imageNamed:imageName];
    return view;
}




/**
 图片+文字

 @param imageName 图片名字
 @param contentStr 提示内容
 @return 。。。
 */
+ (instancetype)createEmptyViewWithImage:(NSString *)imageName
                              contentStr:(NSString *)contentStr{
    MJ_TableView_Empty_DefaultView *view = [[MJ_TableView_Empty_DefaultView alloc] init];
    [view configSubviewsWithStyle:image_text];
    view.imageView.image = [UIImage imageNamed:imageName];
    view.contentLabel.text = contentStr;
    return view;
}


/**
 图片+按钮

 @param imageName 。。
 @param btnTitle 按钮
 @param clickAction 按钮点击回调
 @return 。。
 */
+ (instancetype)createEmptyViewWithImage:(NSString *)imageName
                                btnTitle:(NSString *)btnTitle
                                  action:(void (^)(void))clickAction{
    MJ_TableView_Empty_DefaultView *view = [[MJ_TableView_Empty_DefaultView alloc] init];
    [view configSubviewsWithStyle:image_button];
    view.imageView.image = [UIImage imageNamed:imageName];
    [view.tishiBtn setTitle:btnTitle forState:UIControlStateNormal];
    view.btnClick = clickAction;
    return view;
}


/**
 文字+按钮

 @param contentStr 。。
 @param btnTitle 。。
 @param clickAction 。。
 @return 。。
 */
+ (instancetype)createEmptyViewWithContentStr:(NSString *)contentStr
                                     btnTitle:(NSString *)btnTitle
                                       action:(void (^)(void))clickAction{
    MJ_TableView_Empty_DefaultView *view = [[MJ_TableView_Empty_DefaultView alloc] init];
    [view configSubviewsWithStyle:text_button];
    view.contentLabel.text = contentStr;
    [view.tishiBtn setTitle:btnTitle forState:UIControlStateNormal];
    view.btnClick = clickAction;
    return view;
}



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
                                  action:(void (^)(void))clickAction{
    MJ_TableView_Empty_DefaultView *view = [[MJ_TableView_Empty_DefaultView alloc] init];
    [view configSubviewsWithStyle:image_text_button];
    view.imageView.image = [UIImage imageNamed:imageName];
    view.contentLabel.text = contentStr;
    [view.tishiBtn setTitle:btnTitle forState:UIControlStateNormal];
    view.btnClick = clickAction;
    return view;
}





#pragma makr-  无网络提示图
+ (instancetype)createLostNetConnectViewWithImage:(NSString *)imageName
                                       contentStr:(NSString *)contentStr
                                         btnTitle:(NSString *)btnTitle
                                           action:(void (^)(void))clickAction{
    
    
    MJ_TableView_Empty_DefaultView *view = [[MJ_TableView_Empty_DefaultView alloc] init];
    [view configSubviewsWithStyle:image_text_button];
    view.imageView.image = [UIImage imageNamed:imageName];
    view.contentLabel.text = contentStr;
    [view.tishiBtn setTitle:btnTitle forState:UIControlStateNormal];
    view.btnClick = clickAction;
    return view;
    
}




#pragma mark - ConfigSubviews

- (void)configSubviewsWithStyle:(MJ_Empty_view_style)style{
//    imageOnly,
//    image_text,
//    image_button,
//    text_button,
//    image_text_button
    self.backgroundColor = [UIColor purpleColor];
    self.contetnStyle = style;
    if (style == imageOnly) {
        [self addSubview:self.imageView];

        self.imageView.center = self.center;
        CGRect frame = self.imageView.frame;
        frame.size = CGSizeMake(80, 80);
        self.imageView.frame = frame;
        
    }
    if (style == image_text) {
        [self addSubview:self.imageView];
        [self addSubview:self.contentLabel];

        self.imageView.center = CGPointMake(self.center.x, self.frame.size.height/2.0 - 15);
        CGRect frame = self.imageView.frame;
        frame.size = CGSizeMake(80, 80);
        self.imageView.frame = frame;
        
        
        CGRect frameContent = self.contentLabel.frame;
        frameContent.origin.y = CGRectGetMaxY(self.imageView.frame);
        frameContent.origin.x = 0;
        frameContent.size = CGSizeMake([UIScreen mainScreen].bounds.size.width, 30);
        self.contentLabel.frame = frameContent;

    }
    if (style == image_button) {
        [self addSubview:self.imageView];
        [self addSubview:self.tishiBtn];
       
        self.imageView.center = CGPointMake(self.center.x, self.frame.size.height/2.0 - MJ_HL_SCALE(45)/2.0);
        CGRect frame = self.imageView.frame;
        frame.size = CGSizeMake(80, 80);
        self.imageView.frame = frame;

        CGRect frameContent = self.tishiBtn.frame;
        frameContent.origin.y = CGRectGetMaxY(self.imageView.frame)+MJ_HL_SCALE(10);
        frameContent.origin.x = [UIScreen mainScreen].bounds.size.width/2.0 - MJ_HL_SCALE(50);
        frameContent.size = CGSizeMake(MJ_HL_SCALE(100), MJ_HL_SCALE(35));
        self.tishiBtn.frame = frameContent;
    }
    if (style == text_button) {
        [self addSubview:self.contentLabel];
        [self addSubview:self.tishiBtn];
        
        self.contentLabel.center = CGPointMake(self.center.x, self.frame.size.height/2.0 - MJ_HL_SCALE(45)/2.0);
        CGRect frame = self.contentLabel.frame;
        frame.size = CGSizeMake([UIScreen mainScreen].bounds.size.width, 30);
        self.contentLabel.frame = frame;
        
        CGRect frameContent = self.tishiBtn.frame;
        frameContent.origin.y = CGRectGetMaxY(self.contentLabel.frame)+MJ_HL_SCALE(10);
        frameContent.origin.x = [UIScreen mainScreen].bounds.size.width/2.0 - MJ_HL_SCALE(50);
        frameContent.size = CGSizeMake(MJ_HL_SCALE(100), MJ_HL_SCALE(35));
        self.tishiBtn.frame = frameContent;
    }
    if (style == image_text_button) {
        [self addSubview:self.imageView];
        [self addSubview:self.contentLabel];
        [self addSubview:self.tishiBtn];
        
        
        
        self.imageView.center = CGPointMake(self.center.x, self.frame.size.height/2.0 - (MJ_HL_SCALE(145)+20)/2.0);
        CGRect frame = self.imageView.frame;
        frame.size = CGSizeMake(MJ_HL_SCALE(80), MJ_HL_SCALE(80));
        self.imageView.frame = frame;
        
        
        CGRect frameContent = self.contentLabel.frame;
        frameContent.origin.y = CGRectGetMaxY(self.imageView.frame);
        frameContent.origin.x = 0;
        frameContent.size = CGSizeMake([UIScreen mainScreen].bounds.size.width, MJ_HL_SCALE(30));
        self.contentLabel.frame = frameContent;
        
        
        CGRect frameBtn = self.tishiBtn.frame;
        frameBtn.origin.y = CGRectGetMaxY(self.contentLabel.frame)+MJ_HL_SCALE(10);
        frameBtn.origin.x = [UIScreen mainScreen].bounds.size.width/2.0 - MJ_HL_SCALE(50);
        frameBtn.size = CGSizeMake(MJ_HL_SCALE(100), MJ_HL_SCALE(35));
        self.tishiBtn.frame = frameBtn;
        
    }
    
}
- (void)mj_hl_reloadSubviews{
    if (self.contetnStyle == imageOnly) {
        self.imageView.center = self.center;
        CGRect frame = self.imageView.frame;
        frame.size = CGSizeMake(80, 80);
        self.imageView.frame = frame;
        
    }
    if (self.contetnStyle == image_text) {
        self.imageView.center = CGPointMake(self.center.x, self.frame.size.height/2.0 - 15);
        CGRect frame = self.imageView.frame;
        frame.size = CGSizeMake(80, 80);
        self.imageView.frame = frame;
        
        
        CGRect frameContent = self.contentLabel.frame;
        frameContent.origin.y = CGRectGetMaxY(self.imageView.frame);
        frameContent.origin.x = 0;
        frameContent.size = CGSizeMake([UIScreen mainScreen].bounds.size.width, 30);
        self.contentLabel.frame = frameContent;
        
    }
    if (self.contetnStyle == image_button) {
        self.imageView.center = CGPointMake(self.center.x, self.frame.size.height/2.0 - MJ_HL_SCALE(45)/2.0);
        CGRect frame = self.imageView.frame;
        frame.size = CGSizeMake(80, 80);
        self.imageView.frame = frame;
        
        CGRect frameContent = self.tishiBtn.frame;
        frameContent.origin.y = CGRectGetMaxY(self.imageView.frame)+MJ_HL_SCALE(10);
        frameContent.origin.x = [UIScreen mainScreen].bounds.size.width/2.0 - MJ_HL_SCALE(50);
        frameContent.size = CGSizeMake(MJ_HL_SCALE(100), MJ_HL_SCALE(35));
        self.tishiBtn.frame = frameContent;
    }
    if (self.contetnStyle == text_button) {
        self.contentLabel.center = CGPointMake(self.center.x, self.frame.size.height/2.0 - MJ_HL_SCALE(45)/2.0);
        CGRect frame = self.contentLabel.frame;
        frame.size = CGSizeMake([UIScreen mainScreen].bounds.size.width, 30);
        self.imageView.frame = frame;
        
        CGRect frameContent = self.tishiBtn.frame;
        frameContent.origin.y = CGRectGetMaxY(self.contentLabel.frame)+MJ_HL_SCALE(10);
        frameContent.origin.x = [UIScreen mainScreen].bounds.size.width/2.0 - MJ_HL_SCALE(50);
        frameContent.size = CGSizeMake(MJ_HL_SCALE(100), MJ_HL_SCALE(35));
        self.tishiBtn.frame = frameContent;
    }
    if (self.contetnStyle == image_text_button) {
        
        self.imageView.center = CGPointMake(self.center.x, self.frame.size.height/2.0 - MJ_HL_SCALE(145)/2.0);
        CGRect frame = self.imageView.frame;
        frame.size = CGSizeMake(MJ_HL_SCALE(80), MJ_HL_SCALE(80));
        self.imageView.frame = frame;
        
        
        CGRect frameContent = self.contentLabel.frame;
        frameContent.origin.y = CGRectGetMaxY(self.imageView.frame);
        frameContent.origin.x = 0;
        frameContent.size = CGSizeMake([UIScreen mainScreen].bounds.size.width, MJ_HL_SCALE(30));
        self.contentLabel.frame = frameContent;
        
        
        CGRect frameBtn = self.tishiBtn.frame;
        frameBtn.origin.y = CGRectGetMaxY(self.contentLabel.frame)+MJ_HL_SCALE(10);
        frameBtn.origin.x = [UIScreen mainScreen].bounds.size.width/2.0 - MJ_HL_SCALE(50);
        frameBtn.size = CGSizeMake(MJ_HL_SCALE(100), MJ_HL_SCALE(35));
        self.tishiBtn.frame = frameBtn;
        
    }
}




#pragma mark - btnClick
- (void)tishiBtnClick:(id)sender{
    if (self.btnClick) {
        self.btnClick();
    }
}



#pragma mark - Getter

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [UIImageView new];
    }
    return _imageView;
}

- (UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [UILabel new];
        _contentLabel.textColor = [UIColor lightGrayColor];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.font = [UIFont systemFontOfSize:MJ_HL_SCALE(15)];
    }
    return _contentLabel;
}

- (UIButton *)tishiBtn{
    if (!_tishiBtn) {
        _tishiBtn = [UIButton new];
        _tishiBtn.backgroundColor = [UIColor colorWithRed:84/255.0 green:148/255.0 blue:255/255.0 alpha:1];
        _tishiBtn.layer.masksToBounds = YES;
        [_tishiBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _tishiBtn.layer.cornerRadius = 4;
        [_tishiBtn addTarget:self action:@selector(tishiBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tishiBtn;
}

@end
