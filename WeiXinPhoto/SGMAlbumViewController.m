//
//  SGMAlbumViewController.m
//  WeiXinPhoto
//
//  Created by 苏贵明 on 15/9/4.
//  Copyright (c) 2015年 苏贵明. All rights reserved.
//

#import "SGMAlbumViewController.h"


@interface SGMAlbumViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation SGMAlbumViewController{

    UITableView* mainTable;
    NSMutableArray* groupArray;
    
    SelectedBlock block;

}
@synthesize assetsLibrary;

-(void)doSelectedBlock:(SelectedBlock)bl{
    block = bl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"照片";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"取消"
                                                                    style:UIBarButtonItemStyleDone
                                                                   target:self
                                                                   action:@selector(cancelBtTap)];
    [self.navigationItem setRightBarButtonItem:rightButton];
    
    self.navigationItem.backBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"返回"
                                     style:UIBarButtonItemStylePlain
                                    target:self
                                    action:nil];
    
    
    groupArray = [[NSMutableArray alloc]init];
    
    mainTable = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    mainTable.dataSource = self;
    mainTable.delegate = self;
    mainTable.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:mainTable];
    
    [self readPhotoGroup];

}

-(void)readPhotoGroup{
    
    [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
       //相册
        if (group != nil) {
            [groupArray addObject:group];
        }else{
            [mainTable reloadData];
        }
    } failureBlock:^(NSError *error) {
        NSLog(@"相册获取失败");
    }];
}

-(void)cancelBtTap{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return groupArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 70;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* identify = @"cell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identify];
    }
    
    ALAssetsGroup *group = [groupArray objectAtIndex:indexPath.row];
    
    cell.imageView.image = [UIImage imageWithCGImage:group.posterImage];
    cell.textLabel.text = [group valueForProperty:ALAssetsGroupPropertyName];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d",(int)[group numberOfAssets]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SGMPhotosViewController* viewVC = [[SGMPhotosViewController alloc]init];
    viewVC.group =[groupArray objectAtIndex:indexPath.row];
    viewVC.block = block;
    [self.navigationController pushViewController:viewVC animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
