//
//  ViewController.m
//  UIScrollView
//
//  Created by  高帆 on 2017/2/22.
//  Copyright © 2017年 GF. All rights reserved.
//

#import "ViewController.h"

#define FJScreenW [UIScreen mainScreen].bounds.size.width
#define FJScreenH [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UIScrollViewDelegate>

/**
 *  <#注释#>
 */
@property (nonatomic, strong) UIScrollView *sv;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *sv = [[UIScrollView alloc] init];
    
    sv.frame = CGRectMake(0, 0, FJScreenW, FJScreenH - 44);
    
    // 是否整页滑动
    sv.pagingEnabled = NO;
    // 是否可以开启滚动效果
    sv.scrollEnabled = YES;
    sv.contentSize = CGSizeMake(FJScreenW, (FJScreenH - 44) * 5);
    // 是否可以边缘弹动效果
    sv.bounces = NO;
    // 开启横向弹动
    sv.alwaysBounceHorizontal = YES;
    // 开启纵向弹过效果
    sv.alwaysBounceVertical = YES;
    // 是否显示横向滚动条
    sv.showsHorizontalScrollIndicator = YES;
    // 是否显示纵向滚动条
    sv.showsVerticalScrollIndicator = YES;
    
    // 是否开启点击事件
    sv.userInteractionEnabled = YES;
    // 滚动视图画布的移动位置
    sv.contentOffset = CGPointMake(0, 0);
    
    sv.delegate = self;
    
    sv.backgroundColor = [UIColor whiteColor];
    
    for (int i = 1; i < 6; i++) {
        NSString *str = [NSString stringWithFormat:@"%d%d%d.jpeg", i, i, i];
        
        UIImage *image = [UIImage imageNamed:str];
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        
        imageView.frame = CGRectMake(0, (FJScreenH - 44) * (i - 1), FJScreenW, FJScreenH - 44);
        
        [sv addSubview:imageView];
    }
    
    self.sv = sv;
    
    [self.view addSubview:sv];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    self.sv.contentOffset = CGPointMake(0, 0);
    
    // 带动画的移动到指定位置
    [self.sv scrollRectToVisible:CGRectMake(0, 0, FJScreenW, FJScreenH - 44) animated:YES];
}

#pragma mark - scrollView delegate
// 当滚动视图移动时,只要offset坐标发生变化,都会调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"y = %f", scrollView.contentOffset.y);
}

// 当滚动视图即将开始时调用
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"视图即将开始滚动");
}

// 当视图即将结束拖动时调用
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    NSLog(@"视图即将结束拖动");
}

// 当滚动视图结束拖动时调用此函数
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"已结束拖动");
}

// 当视图即将减速时调用
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    NSLog(@"视图即将减速");
}

// 当视图停止的瞬间调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"视图停止移动");
}





@end
