//
//  SGMAlbumViewController.h
//  WeiXinPhoto
//
//  Created by 苏贵明 on 15/9/4.
//  Copyright (c) 2015年 苏贵明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SGMPhotosViewController.h"


@interface SGMAlbumViewController : UIViewController

@property(nonatomic,retain)ALAssetsLibrary *assetsLibrary;
@property int limitNum;//限制选择张数，不设置(<1)即不限制
-(void)doSelectedBlock:(SelectedBlock)bl;
@end
