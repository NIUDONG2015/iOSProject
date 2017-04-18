//
//  LMJBaseViewController.m
//  PLMMPRJK
//
//  Created by NJHu on 2017/3/29.
//  Copyright © 2017年 GoMePrjk. All rights reserved.
//

#import "LMJNavUIBaseViewController.h"
#import "LMJNavigationBar.h"

@interface LMJNavUIBaseViewController ()

/** <#digest#> */
@property (weak, nonatomic) LMJNavigationBar *lmj_navgationBar;

@end

@implementation LMJNavUIBaseViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
}


#pragma mark - 生命周期
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
}


- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    [self.view bringSubviewToFront:self.lmj_navgationBar];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
}





#pragma mark - LMJNavUIBaseViewControllerDataSource
- (BOOL)navUIBaseViewControllerIsNeedNavBar:(LMJNavUIBaseViewController *)navUIBaseViewController
{
    return YES;
}



#pragma mark - DataSource
/**头部标题*/
- (NSMutableAttributedString*)lmjNavigationBarTitle:(LMJNavigationBar *)navigationBar
{
    return [self changeTitle:self.title];
}

/** 背景图片 */
//- (UIImage *)lmjNavigationBarBackgroundImage:(LMJNavigationBar *)navigationBar
//{
//    
//}

/** 背景色 */
//- (UIColor *)lmjNavigationBackgroundColor:(LMJNavigationBar *)navigationBar
//{
//    
//}

/** 是否显示底部黑线 */
//- (BOOL)lmjNavigationIsHideBottomLine:(LMJNavigationBar *)navigationBar
//{
//    return NO;
//}

/** 导航条的高度 */
- (CGFloat)lmjNavigationHeight:(LMJNavigationBar *)navigationBar
{
    return 64.0;
}


/** 导航条的左边的 view */
//- (UIView *)lmjNavigationBarLeftView:(LMJNavigationBar *)navigationBar
//{
//    
//}
/** 导航条右边的 view */
//- (UIView *)lmjNavigationBarRightView:(LMJNavigationBar *)navigationBar
//{
//    
//}
/** 导航条中间的 View */
//- (UIView *)lmjNavigationBarTitleView:(LMJNavigationBar *)navigationBar
//{
//    
//}
/** 导航条左边的按钮 */
//- (UIImage *)lmjNavigationBarLeftButtonImage:(UIButton *)leftButton navigationBar:(LMJNavigationBar *)navigationBar
//{
//    
//}
/** 导航条右边的按钮 */
//- (UIImage *)lmjNavigationBarRightButtonImage:(UIButton *)rightButton navigationBar:(LMJNavigationBar *)navigationBar
//{
//    
//}



#pragma mark - Delegate
/** 左边的按钮的点击 */
-(void)leftButtonEvent:(UIButton *)sender navigationBar:(LMJNavigationBar *)navigationBar
{
    LMJLog(@"%s", __func__);
}
/** 右边的按钮的点击 */
-(void)rightButtonEvent:(UIButton *)sender navigationBar:(LMJNavigationBar *)navigationBar
{
    LMJLog(@"%s", __func__);
}
/** 中间如果是 label 就会有点击 */
-(void)titleClickEvent:(UILabel *)sender navigationBar:(LMJNavigationBar *)navigationBar
{
    LMJLog(@"%s", __func__);
}


#pragma mark 自定义代码

-(NSMutableAttributedString *)changeTitle:(NSString *)curTitle
{
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:curTitle];
    
    [title addAttribute:NSForegroundColorAttributeName value:HEXCOLOR(0x333333) range:NSMakeRange(0, title.length)];
    
    [title addAttribute:NSFontAttributeName value:CHINESE_SYSTEM(16) range:NSMakeRange(0, title.length)];
    
    return title;
}


- (LMJNavigationBar *)lmj_navgationBar
{
    // 父类控制器必须是导航控制器
    if(!_lmj_navgationBar && [self.parentViewController isKindOfClass:[UINavigationController class]] && [self navUIBaseViewControllerIsNeedNavBar:self])
    {
        LMJNavigationBar *navigationBar = [[LMJNavigationBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0)];
        [self.view addSubview:navigationBar];
        _lmj_navgationBar = navigationBar;
        
        navigationBar.dataSource = self;
        navigationBar.lmjDelegate = self;
        
        
    }
    return _lmj_navgationBar;
}



-(void)changeNavigationBarTranslationY:(CGFloat)translationY
{
    self.lmj_navgationBar.transform = CGAffineTransformMakeTranslation(0, translationY);
}

-(void)changeNavgationTitle:(NSMutableAttributedString *)title
{
    self.lmj_navgationBar.title = title;
}

-(void)changeNavigationBarHeight:(CGFloat)height
{
    self.lmj_navgationBar.height = height;
}

-(void)changeNavgationBarBackgroundColor:(UIColor *)backgroundColor
{
    self.lmj_navgationBar.lmjBackgroundColor = backgroundColor;
}


@end










