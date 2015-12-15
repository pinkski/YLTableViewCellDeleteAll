//
//  ViewController.m
//  YLTableViewCellDeleteAll
//
//  Created by xuanlin.zhu on 15/12/15.
//  Copyright © 2015年 xuanlin.zhu. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *selectAllBtn;
@property (weak, nonatomic) IBOutlet UIButton *selectedBtn;

@property (weak, nonatomic) IBOutlet UITableView *llTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Action

- (IBAction)selectAllBtnClick:(id)sender {
    
    //    [self.tableView reloadData];
    
    for (int i = 0; i < 10; i ++) {
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        [self.llTableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
        
//        [self.deleteArr addObjectsFromArray:self.dataArray];
        
    }
    
//    NSLog(@"self.deleteArr:%@", self.deleteArr);
}


- (IBAction)selectedBtn:(id)sender {
    
    //支持同时选中多行
    
    self.llTableView.allowsMultipleSelectionDuringEditing = YES;
    [self.llTableView setEditing:(!self.llTableView.editing) animated:YES];
    
    if (self.llTableView.editing) {
        
        _selectAllBtn.hidden = NO;
        
        [sender setTitle:@"完成" forState:UIControlStateNormal];
        
    }else{
        
        _selectAllBtn.hidden = YES;
        
        [sender setTitle:@"删除" forState:UIControlStateNormal];
        
    }

}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"TableViewCell" owner:nil options:nil];
    TableViewCell *cell = [nibs lastObject];
    
//    cell.textLabel.text = @"大家好";
//    cell.imageView.image = [UIImage imageNamed:@"tt"];
    
//    UITableViewCell * cell = [self.llTableView cellForRowAtIndexPath:indexPath];
//    
//    NSLog(@"%@",cell.subviews);
//    UIView * view1 = cell.subviews[0];
//    NSLog(@"%@",view1.subviews);
//    
//    UIView * CellEditControl = view1.subviews[2];//按输出顺序来，就是这样向下查找，知道找到你想要的那个view
//    
//    UIImageView * imgView = [[[[cell.subviews[0] subviews] objectAtIndex:2] subviews] objectAtIndex:0];
//    
//    UIImageView * testImgView = [[UIImageView alloc]initWithImage:imgView.image];
//    
//    testImgView.frame = CGRectMake(60, 0, 30, 25);
//    
//    [cell.contentView addSubview:testImgView];
    
    return cell;
}

#pragma mark - UITableViewDelegate

//是否可以编辑  默认的时YES

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;
    
}

//选择编辑的方式,按照选择的方式对表进行处理

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {//删除
        
        //真正项目中做删除
        
        //1.将表中的cell删除
        
        //2.将本地的数组中数据删除
        
        //3.最后将服务器端的数据删除
        
    }
    
}

//选择你要对表进行处理的方式  默认是删除方式

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
    
}

//选中时将选中行的在self.dataArray 中的数据添加到删除数组self.deleteArr中

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    [self.deleteArr addObject:[self.dataArray objectAtIndex:indexPath.row]];
    
    UITableViewCell * cell = [self.llTableView cellForRowAtIndexPath:indexPath];
    
    NSLog(@"111%@",cell.subviews);
    UIView * view1 = cell.subviews[0];
    NSLog(@"222%@",view1.subviews);
    
    
    
}

//取消选中时 将存放在self.deleteArr中的数据移除

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath  {
    
//    [self.deleteArr removeObject:[self.dataArray objectAtIndex:indexPath.row]];
    
}

//实现完tableview的代理方法 下面处理各个按钮的响应事件
//
//1 首先是选择按钮的响应事件 在按钮事件里面要有self.tableView.allowsMultipleSelectionDuringEditing = YES; 允许支持同时选中多行
//
//然后在点击的时候让tableview.editing = !tableview.editing 点击此按钮可切换tableview的编辑状态


@end
