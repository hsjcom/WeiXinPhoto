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
-(void)doSelectedBlock:(SelectedBlock)bl;
@end
