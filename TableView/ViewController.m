//
//  ViewController.m
//  TableView
//
//  Created by 王克博 on 2017/8/21.
//  Copyright © 2017年 wkb. All rights reserved.
//

#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"
#import "MyTableViewCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView * tableView;   //主角
@property (strong, nonatomic) NSMutableArray * imageArray;   //存放头像数据
@property (strong, nonatomic) NSMutableArray * nameArray;    //存放名字数组

@end

@implementation ViewController

- (void)dealloc
{
    NSLog(@"%s",__func__);  //当vc被销毁时，走了dealloc就会打印vc的类名。如果页面pop，没有打印，就说明dealloc没走，说明循环引用了-需要查找错误的地方。
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"tableView简单运用-dev分支-新的节点";
    
    _nameArray = [NSMutableArray arrayWithObjects:@"李意",@"王尔",@"张伞",@"刘思",@"陈舞",@"杨留",@"赵琪",@"黄霸",@"周鸠",@"吴石",@"十一",@"十二",@"十三",@"十四",@"十五",nil];
    _imageArray = [NSMutableArray arrayWithCapacity:15];
    //构建数据
    for (int i = 0; i<15; i++) {
        int number = (arc4random() % 4) + 1; //随机1-4数字
        NSString * imageName = [NSString stringWithFormat:@"image%d",number];
        [_imageArray addObject:imageName];
    }
    
    self.view.backgroundColor = [UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:1.0];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.bounces = NO;
    [self.view addSubview:_tableView];
    
}

//返回tableview多少个分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//返回row高度，可以通过indexPath.section来设置不同section中row的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        //返回第一个分区中row的高度,因为我设置只有一个分区所以只走这里面的60
        return 60;
    }
    return 100;
}

//返回每个分区对应的行数 （row的数量）
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        //第一个section返回10行
        return 15;
    }
    return  5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString  * identifier = @"cell";
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell)
    {
        cell = [[MyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    //设置头像和名字
    if (indexPath.row < _imageArray.count) {
        cell.headImageView.image = [UIImage imageNamed:_imageArray[indexPath.row]];
    }
    if (indexPath.row < _nameArray.count) {
        cell.nameLabel.text = _nameArray[indexPath.row];
    }
    
    return cell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //点击对应row 要做什么.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
