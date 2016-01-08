//
//  SecondViewController.m
//  DataTestDemo
//
//  Created by chengxun on 16/1/6.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "UIImageView+RoundRect.h"
#import <PureLayout.h>
#import "CustomView.h"
typedef void(^MsgBlock)(NSString*message);
@interface SecondViewController ()
@property (nonatomic,copy)MsgBlock msgblock;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CustomView * customV  = [[CustomView alloc]init];
     [self.view addSubview:customV];
    [customV autoPinEdgesToSuperviewEdges];
    

    [self testRoundRect];
    [self setUpUI];
    // Do any additional setup after loading the view.
}
/**  测试roundRect的渲染  */
- (void)testRoundRect{

    UIImageView * imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"logo"];
    [self.view addSubview:imageView];
    imageView.frame = CGRectMake(10, 74, 50, 50);
    /**  自动布局的情况下,ImageView的frame值是0,0,0,0的,所以得要传递进去给绘制的实际尺寸才可以  */
    //[imageView autoCenterInSuperview];
    //[imageView autoSetDimensionsToSize:CGSizeMake(50, 50)];
    [imageView showWithRoundRectRadius:10];
}
- (void)setUpUI{
    UIButton * button = [[UIButton alloc]init];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button setTitle:@"click Me" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(clickMe2:) forControlEvents:UIControlEventTouchUpInside];

    UIButton * anotherButton  = [UIButton buttonWithType:UIButtonTypeCustom];
    anotherButton.frame = CGRectMake(200, 200, 50, 50);
    anotherButton.backgroundColor = [UIColor yellowColor];
    [anotherButton setTitle:@"Push Me" forState:UIControlStateNormal];
    [anotherButton addTarget:self action:@selector(pushMeToAnotherController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:anotherButton];

    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)pushMeToAnotherController{
    ThirdViewController * thirdVc = [[ThirdViewController alloc]init];
    [self.navigationController pushViewController:thirdVc animated:YES];
}

- (void)blockWithMessage:(void (^)(NSString *))messageBlock{
    self.msgblock = messageBlock;
}
- (void)clickMe2:(UIButton*)btn{
    self.messageBlock(btn.titleLabel.text);
    self.msgblock(btn.titleLabel.text);
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)clickMe:(UIButton*)btn{
  if (self.delegate &&
      [self.delegate
          respondsToSelector:@selector(secondViewController:inputMessage:)]) {
          [self.delegate secondViewController:self inputMessage:btn.titleLabel.text];
          [self.navigationController popViewControllerAnimated:YES];
          ;
  }

}
- (void)secondeVCMethod{
    NSLog(@"This is secondVc Method");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
