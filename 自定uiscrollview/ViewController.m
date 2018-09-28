//
//  ViewController.m
//  自定uiscrollview
//
//  Created by 冼 on 2017/11/30.
//  Copyright © 2017年 冼嘉慰. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@property (nonatomic,strong) UIScrollView *scrollview;

@end

@implementation ViewController
//就是用make.leading.equalTo(_red1.mas_trailing);括号里面也必须是trailing／leading。
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *v6 = [[UIView alloc] init];
    v6.backgroundColor = [UIColor greenColor];
    

    
    //导航栏
    
    
    /**
     有人会问为什么没看到你设置ContenSize 的大小.为什么会滚动呢
     
     其实当你把v1添加到scrollView上时,,他的大小就是scrollView的contenSize的大小了
     
     你会注意上面的代码 [v1 mas_makeConstraints…]使用了两次..
     
     这是没有错的..虽然v1对象是一样的..但约束是不一样的.第一个是对scrollview 的..第二个是对btn2的.
     
     PS:v1这个视图是来设置scrollView的contenSize的大小的.引用它来实现scrollView的滚动
     */
    
    self.scrollview = [[UIScrollView alloc] init];
    self.scrollview.backgroundColor = [UIColor clearColor];
    
    self.scrollview.showsVerticalScrollIndicator = NO;

    //增加额外的滚动区域
    self.scrollview.contentInset  = UIEdgeInsetsMake(-20, 0, 44, 0);
    // 去掉弹簧效果
//    self.scrollview.bounces = NO;

    [self.view addSubview:self.scrollview];
    
    // UIScrollView 对四边left top bottom right 进行约束，值均为0，作为view 的子视图存在
    [self.scrollview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];

    

    
    //大背景
    //UIScrollView 新增一个名为contentView 视图UIView，同样对其四边约束，添加width 相对父视图进行宽度约束。（关键的一步。需要为UIScrollView 添加一个子视图）
    //contentView 的高度内容，决定 这个滚动条会不会滚动，影响contentSize
    UIView *v1 = [[UIView alloc] init];
    v1.backgroundColor = [UIColor grayColor];
    [self.scrollview addSubview:v1];

    [v1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollview);
        //上下滚动
        make.width.equalTo(self.scrollview);
        /*
         和下面的效果一样
        make.top.mas_equalTo(self.scrollView.mas_top).offset(0);
        make.left.mas_equalTo(self.scrollView.mas_left).offset(0);
        make.right.mas_equalTo(self.scrollView.mas_right).offset(0);
        make.bottom.mas_equalTo(self.scrollView.mas_bottom).offset(0);
        

         */

    }];
    
    
    
    
    //鲸鱼背景
    UIImageView *v2 = [[UIImageView alloc] init];
    v2.backgroundColor = [UIColor redColor];
    v2.image = [UIImage imageNamed:@"用户个性背景"];
    [v1 addSubview:v2];
    
    [v2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(v1.mas_top);
        make.right.mas_equalTo(v1.mas_right);
        make.left.mas_equalTo(v1.mas_left);
        make.height.mas_equalTo(v1.mas_height).multipliedBy(0.4);
        
        
    }];
    
    
    
    UIView *v3 = [[UIView alloc] init];
    v3.backgroundColor = [UIColor orangeColor];
    
    [v1 addSubview:v3];
    
    [v3 mas_makeConstraints:^(MASConstraintMaker *make) {
        //接在v2后面
        make.top.mas_equalTo(v2.mas_bottom);
        
        make.left.mas_equalTo(v2.mas_left);
        make.right.mas_equalTo(v2.mas_right);
        make.height.mas_equalTo(v1.mas_height).multipliedBy(0.1);
        
    }];
    
    

    //头像
    UIImageView *v4 = [[UIImageView alloc] init];
    v4.backgroundColor = [UIColor greenColor];
    v4.image = [UIImage imageNamed:@"头像图片"];
    v4.layer.cornerRadius = 40;
    v4.layer.masksToBounds = YES;
    [v1 addSubview:v4];
    
    [v4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(v2.mas_left).offset(50);
        make.bottom.mas_equalTo(v3.mas_bottom).offset(-30);
        make.width.and.height.mas_equalTo(80);
        
    }];
    
    
    
    
    UILabel *laba1 = [[UILabel alloc] init];
    laba1.text = @"软件园协会";
    laba1.textColor = [UIColor whiteColor];
    laba1.font = [UIFont systemFontOfSize:13];
    [v1 addSubview:laba1];
    
    [laba1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(v4.mas_right).offset(10);
        make.top.mas_equalTo(v2.mas_bottom).offset(10);
   
    }];
    
    
    UILabel *laba2 = [[UILabel alloc] init];
    laba2.text = @"关注软件园编程很简单";
    laba2.font = [UIFont systemFontOfSize:14];
    [v1 addSubview:laba2];
    
    
    [laba2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(laba1.mas_left);
        make.top.mas_equalTo(laba1.mas_bottom).offset(3);
    }];
    
    
    
    UIButton *btn = [[UIButton alloc] init];
    
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setTitle:@"+ 关注 " forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor grayColor];
    
    btn.layer.cornerRadius = 10;
    btn.layer.masksToBounds = YES;
    
    [v1 addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(v3.mas_right).offset(-20);
        make.top.mas_equalTo(laba1);
   
    }];
    
    
    UILabel *laba3 = [[UILabel alloc] init];
    laba3.text = @"软件园创新创意大赛";
    laba3.textColor = [UIColor whiteColor];
    laba3.font = [UIFont systemFontOfSize:17];
    [v1 addSubview:laba3];
    
    [laba3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(v3.mas_bottom).offset(60);
        make.centerX.mas_equalTo(v1.mas_centerX);
    }];
    
    
    UILabel *labe4 = [[UILabel alloc] init];
    labe4.text = @"  时间:";
    labe4.textColor = [UIColor whiteColor];
    labe4.font = [UIFont systemFontOfSize:11];
    [v1 addSubview:labe4];
    
    [labe4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(laba3.mas_bottom).offset(50);
        make.left.mas_equalTo(laba3);
    }];
    
    
    UILabel *laba5 = [[UILabel alloc] init];
    laba5.text = @"2017年11月30号-13号";
    laba5.textColor = [UIColor whiteColor];
    laba5.font = [UIFont systemFontOfSize:11];
    [v1 addSubview:laba5];
    
    [laba5 mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(labe4);
        make.left.mas_equalTo(labe4.mas_right).offset(3);
        
    }];
    
    
    UILabel *laba6 = [[UILabel alloc] init];
    laba6.text = @"地点:";
    laba6.textColor = [UIColor whiteColor];
    laba6.font = [UIFont systemFontOfSize:11];
    [v1 addSubview:laba6];
    
    
    
    [laba6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(laba5.mas_bottom).offset(30);
        make.left.mas_equalTo(labe4).offset(30);
    }];
    
    
    UILabel *laba7 = [[UILabel alloc] init];
    laba7.text = @"博雅报告厅";
    laba7.textColor = [UIColor whiteColor];
    laba7.font = [UIFont systemFontOfSize:11];

    [v1 addSubview:laba7];
    
    [laba7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(laba6);
        make.left.mas_equalTo(laba6.mas_right).offset(3);
        
        
    }];
    
    
    UILabel *laba8 = [[UILabel alloc] init];
    laba8.text = @"内容:";
//    laba8.text = @"给无处放置的想法一个展现的平台，将生活简易化,使生活更加美好.";
    laba8.textColor = [UIColor whiteColor];
    laba8.font = [UIFont systemFontOfSize:11];
//    laba8.numberOfLines = 0;
    [v1 addSubview:laba8];
    
    
    
    UILabel *laba9 = [[UILabel alloc] init];
    laba9.text = @"给无处放置的想法一个展现的平台，将生活简易化,使生活更加美好。";
    laba9.textColor = [UIColor whiteColor];
    laba9.font = [UIFont systemFontOfSize:11];
       laba9.numberOfLines = 0;
    [v1 addSubview:laba9];
    
    
    
    [laba8 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(laba7.mas_bottom).offset(30);
        make.left.mas_equalTo(laba3).offset(-20);
    }];
    
    [laba9 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(laba8);
        make.left.mas_equalTo(laba8.mas_right).offset(3);
        make.width.mas_equalTo(180);
        
    }];
    
    
  


    
    
    
    UIButton *btn2 = [[UIButton alloc] init];
    btn2.titleLabel.textColor = [UIColor whiteColor];
    btn2.backgroundColor = [UIColor blackColor];
    [btn2 setTitle:@"点击报名" forState:UIControlStateNormal];
    
    [v1 addSubview:btn2];
    
    
//    //导航栏
//    UIView *v6 = [[UIView alloc] init];
//    v6.backgroundColor = [UIColor greenColor];
//    [v1 addSubview:v6];
//
//
//
//
//    [v6 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(v1.mas_left);
//        make.right.mas_equalTo(v1.mas_right);
//        make.bottom.mas_equalTo(v1.mas_bottom);
//    }];
////
//
    

    
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(laba9.mas_bottom).offset(50);
        make.centerX.mas_equalTo(v1);
        make.width.and.height.mas_equalTo(80);
        
    }];
    
    
    
    
    
    [self.view addSubview:v6];
    
    [v6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view.mas_bottom);
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.height.mas_equalTo(44);
    }];
    
    
    
    
    
    //使自定义View底部等于最后一个控件设置的底部约束。
    [v1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(btn2.mas_bottom);
    }];

    
    
    
    
    
    
    
  
    
    
    
    
    
    
    
}







-(void)text1{
    //    UIView *v3 = [[UIView alloc] init];
    //    v3.backgroundColor = [UIColor grayColor];
    //    [self.view addSubview:v3];
    //
    //
    //    [v3 mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.top.mas_equalTo(self.view.mas_top).offset(20);
    //        make.left.mas_equalTo(self.view).offset(20);
    //        make.right.mas_equalTo(self.view).offset(-20);
    //        make.bottom.mas_equalTo(self.view).offset(-20);
    //    }];
    //

}

-(void)text{
    UIView *gary1 = [[UIView alloc] init];
    gary1.backgroundColor = [UIColor grayColor];
    [self.view addSubview:gary1];
    
    
    UIView *gary2 = [[UIView alloc] init];
    gary2.backgroundColor = [UIColor grayColor];
    [self.view addSubview:gary2];
    
    
    UIView *gary3 = [[UIView alloc] init];
    gary3.backgroundColor = [UIColor grayColor];
    [self.view addSubview:gary3];
    
    UIView *red1 = [[UIView alloc] init];
    red1.backgroundColor = [UIColor redColor];
    [self.view addSubview:red1];
    
    UIView *red2 = [[UIView alloc] init];
    red2.backgroundColor = [UIColor redColor];
    [self.view addSubview:red2];
    
    
    [gary1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(20);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.bottom.equalTo(red1.mas_bottom);
        
    }];
    
    
    [red1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
        make.left.equalTo(gary1.mas_right);
        make.bottom.equalTo(self.view.mas_bottom).offset(-50);
    }];
    
    
    [gary2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.and.width.mas_equalTo(gary1);
        make.left.equalTo(red1.mas_right);
        make.bottom.equalTo(red1.mas_bottom);
        
    }];
    
    
    [red2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.and.width.equalTo(red1);
        make.left.equalTo(gary2.mas_right);
        make.bottom.equalTo(red1.mas_bottom);
    }];
    
    
    [gary3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.and.width.equalTo(gary1);
        make.left.equalTo(red2.mas_right);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(red1.mas_bottom);
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






@end
