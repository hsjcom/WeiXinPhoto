//
//  SGMPhotosViewController.h
//  WeiXinPhoto
//
//  Created by 苏贵明 on 15/9/4.
//  Copyright (c) 2015年 苏贵明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "FGalleryViewController.h"

typedef enum {
    AssetArrayType,
    SelectedArrayType
}ArrayType;

@interface SGMPhotosViewController : UIViewController

@property(nonatomic,retain)ALAssetsGroup *group;
@property(nonatomic,weak)SelectedBlock block;
@property int limitNum;

@end
