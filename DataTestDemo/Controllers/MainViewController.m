//
//  MainViewController.m
//  DataTestDemo
//
//  Created by chengxun on 16/1/4.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "MainViewController.h"
#import "NonConcurrentOperation.h"
#import "ConcurrentOperation.h"
#import <PureLayout.h>
#import "UIColor+Image.h"
#import <objc/message.h>
#import "Person.h"
#import "UIImage+Image.h"
#import "Person+Property.h"
#import "Book.h"
#import "Publish.h"
#import "SecondViewController.h"
@interface MainViewController ()<SecondViewControllerDelegate>
@property (nonatomic,strong)Book * myBook;
@property (nonatomic,strong)SecondViewController * secondVc;
@end


@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.secondVc = [[SecondViewController alloc]init];
    self.secondVc.delegate = self;

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.navigationController pushViewController:self.secondVc animated:YES];
}
- (void)secondViewController:(SecondViewController *)secondVc inputMessage:(NSString *)message{
    NSLog(@"%s%@",__func__,message);
}


/**  notificationCenter的测试  */
- (void)notificationTest{
    self.myBook = [[Book alloc]init];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(action:) name:NotificationControler object:NULL];

}

- (void)action:(NSNotification*)noti{
    NSLog(@"我被通知了%@",noti);
    int num = [noti.object intValue];
    if(num<6){
        [[NSNotificationCenter defaultCenter]removeObserver:self name:NotificationControler object:nil];
    }
}
/**  属性观察的设置kvo  */
- (void)KVOTest{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"clickMe" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(100, 100, 100, 100)];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(hitMe) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    _myBook = [[Book alloc] init];
    NSDictionary *dic = @{ @"bookName":@"名称是什么", @"price" : @"10"};
    [_myBook setValuesForKeysWithDictionary:dic];

    [_myBook
     addObserver:self
     forKeyPath:@"price"
     options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew
     context:NULL];
    NSLog(@"mybook.bookName-%@ mybook.price %.2f",_myBook.bookName,_myBook.price);
}

/**  系统会自动调用这个方法观察属性值的变化  */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    float newValue = [[change objectForKey:NSKeyValueChangeNewKey]floatValue];
    float oldValue = [[change objectForKey:NSKeyValueChangeOldKey]floatValue];
    NSArray *array = [NSArray arrayWithObjects:[UIColor orangeColor],[UIColor cyanColor], [UIColor yellowColor], nil];
    int random = arc4random()%3;
    if(newValue != oldValue){
         NSLog(@"priceHasChange?price%.2f",newValue);
        self.view.backgroundColor = [array objectAtIndex:random];
    }

}

- (void)dealloc{
    [_myBook removeObserver:self forKeyPath:@"price"];
}

- (void)hitMe{
    int num =  arc4random()%100;
    [_myBook setValue:@(num) forKey:@"price"];
}
/**  kvc 赋值测试  */
- (void)KVCTest{
    Publish * publish = [[Publish alloc]init];
    Book * myBook = [[Book alloc]init];
    publish.book = myBook;
    // keyPath赋值：
    [publish setValue:@"<11月的肖邦>" forKeyPath:@"book.bookName"];
    [publish setValue:@"私有属性被我设置" forKey:@"testStr"];
    NSLog(@"--- %@", [publish valueForKey:@"testStr"]);
    NSLog(@"--- %@", [publish valueForKeyPath:@"book.bookName"]);
    [publish logTestStr];
}
/**  调用其他控制器中的方法  */
- (void)performSelectorWithAnotherController{
 [self performSelector:@selector(secondeVCMethod)];
}
/**  动态添加方法  */
- (void)dynamicMethod{
    [self performSelector:@selector(dosomething)];
}

- (id)forwardingTargetForSelector:(SEL)aSelector{
    Class class = NSClassFromString(@"SecondViewController");
    UIViewController * vc = class.new;
    if(aSelector == NSSelectorFromString(@"secondeVCMethod")){
        NSLog(@"SecondVC do it");
        return vc;
    }
    return nil;
}
void dynamicMethodIMP (id self, SEL _cmd) {

    NSLog(@"doSomething SEL");
}
int newMethod(id self ,SEL _cmd,NSString * str){
    return 100;
}
/**  如果在这个方法里面没哟找到方法，就会去forwardTarget中看是否可以执行这个方法  */
+ (BOOL)resolveInstanceMethod:(SEL)sel{
    if (sel == @selector(dosomething)) {
        NSLog(@"add method here");
        class_addMethod([self class], @selector(dynamicMethodIMP), (IMP)dynamicMethodIMP, "v@:");
       // class_addMethod([self class], @selector(newMethod), (IMP)newMethod, @"i@:@");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

/**  动态绑定属性  */
- (void)addPropertyWithCategory{
    Person * person = [[Person alloc]init];
    person.work = @"Coding Man";
    NSLog(@"%@",person.work);
}

/**  增加方法实现  */
- (void)class_addMethod{
    Person * p = [[Person alloc]init];
    [p performSelector:@selector(eat)];

}

/**  交换方法实现  */
- (void)exchangeMethodImplement{
    UIImageView * exchangeImageView = [[UIImageView alloc]init];
    [self.view addSubview:exchangeImageView];
    [exchangeImageView autoCenterInSuperview];
    [exchangeImageView autoSetDimensionsToSize:CGSizeMake(100, 100)];
    exchangeImageView.image = [UIImage imageNamed:@"123"];
}

/**  用纯色画图片  */
- (void)createImageWithColor{
    UIImageView * imageView = [[UIImageView alloc]init];
    [self.view addSubview:imageView];
    [imageView autoCenterInSuperview];
    [imageView autoSetDimensionsToSize:CGSizeMake(100, 100)];
    imageView.image = [UIColor createImageWith:[UIColor yellowColor]];

}

/**  异步执行这个操作  */
- (void)concurrentOperation{
    NSOperationQueue * queue = [[NSOperationQueue alloc]init];
    ConcurrentOperation * operation = [[ConcurrentOperation alloc]init];
    [queue addOperation:operation];
}

- (void)nonConcurrentOperation{
    NonConcurrentOperation * operation = [[NonConcurrentOperation alloc]init];
    [operation start];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
