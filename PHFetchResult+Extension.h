//
//  PHFetchResult+Extension.h
//  sunbohong
//
//  Created by sunbohong on 16/4/21.
//  Copyright © 2016年 sunbohong. All rights reserved.
//

#import <Photos/Photos.h>

@interface PHFetchResult (Extension)

/**
 *  用指定的image创建一个<code>PHAsset</code>
 *  @param image                          image
 *  @param shouldMoveToAppAssetCollection 是否需要移动到以应用名命名的相册内
 *
 *  @return 创建的<code>PHAsset</code>，如果失败，则返回nil
 */
+ (PHFetchResult<PHAsset *> *)createdAssetsWithImage:(UIImage *)image shouldMoveToAppAssetCollection:(BOOL)shouldMoveToAppAssetCollection;

@end
