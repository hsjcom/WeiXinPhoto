# WeiXinPhoto
模仿微信朋友圈选择照片模块，查看图片用[FGallery](https://github.com/gdavis/FGallery-iPhone)库改的。

![图片](https://github.com/AndyFightting/WeiXinPhoto/blob/master/WeiXinPhoto/sample.png)
使用：
```
SGMAlbumViewController* viewVC = [[SGMAlbumViewController alloc] init];
    viewVC.assetsLibrary =assetLibrary;
    [viewVC doSelectedBlock:^(NSMutableArray *assetDicArray) { //包含 {@"asset":ALAsset,@"assetIndex":0,@"select":@YES}
        [selectedPhotoArray addObjectsFromArray:assetDicArray];
        [mainTable reloadData];
    }];
    
    UINavigationController* nav = [[UINavigationController alloc]initWithRootViewController:viewVC];
    [self presentViewController:nav animated:YES completion:nil];
