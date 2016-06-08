//
//  PHFetchResult+Extension.m
//  sunbohong
//
//  Created by sunbohong on 16/4/21.
//  Copyright © 2016年 sunbohong. All rights reserved.
//

#import "PHFetchResult+Extension.h"
#import "PHAssetCollection+Extension.h"

@implementation PHFetchResult (Extension)

/**
 *  用指定的image创建一个<code>PHAsset</code>
 *  @param image                          image
 *  @param shouldMoveToAppAssetCollection 是否需要移动到以应用名命名的相册内
 *
 *  @return 创建的<code>PHAsset</code>，如果失败，则返回nil
 */
+ (PHFetchResult<PHAsset *> *)createdAssetsWithImage:(UIImage *)image shouldMoveToAppAssetCollection:(BOOL)shouldMoveToAppAssetCollection {
    __block NSString *createdAssetId = nil;

    // 添加图片到【相机胶卷】
    [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
         createdAssetId = [PHAssetChangeRequest creationRequestForAssetFromImage:image].placeholderForCreatedAsset.localIdentifier;
     } error:nil];

    if (createdAssetId == nil) return nil;


    __block PHFetchResult<PHAsset *> *fetchResult;

    PHAssetCollection *appAssetCollection = [PHAssetCollection appAssetCollection];

    [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{

         // 在保存完毕后取出图片
         fetchResult = [PHAsset fetchAssetsWithLocalIdentifiers:@[createdAssetId] options:nil];
         if (shouldMoveToAppAssetCollection) {
             PHAssetCollectionChangeRequest *request = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:appAssetCollection];
             [request insertAssets:fetchResult atIndexes:[NSIndexSet indexSetWithIndex:0]];
         }
     } error:nil];

    return fetchResult;
}

@end
