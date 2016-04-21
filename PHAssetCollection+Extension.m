//
//  PHAssetCollection+Extension.m
//  sunbohong
//
//  Created by sunbohong on 16/4/21.
//  Copyright © 2016年 sunbohong. All rights reserved.
//

#import "PHAssetCollection+Extension.h"

#import "NSBundle+Extension.h"

@implementation PHAssetCollection (Extension)

/**
 *  获取一个以应用名命名的<code>PHAssetCollection</code>，如果没有，则会自动创建
 *
 *  @return 以应用名命名的<code>PHAssetCollection</code>
 */
+ (PHAssetCollection *)appAssetCollection
{
    // 获取软件的名字作为相册的标题
    NSString *appName = [NSBundle appName];
    // 直接创建新的album
    [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
        [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:appName];
    } error:nil];
    
    PHAssetCollection *appAssetcollection = nil;
    
    PHFetchResult<PHAssetCollection *> *collections = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    for (PHAssetCollection *collection in collections) {
        if ([collection.localizedTitle isEqualToString:appName]) {
            appAssetcollection = collection;
            break;
        }
    }
    return appAssetcollection;
}

+ (PHAssetCollection *)appAssetCollection_v2 {
    
    // 获取软件的名字作为相册的标题
    NSString *appName = [NSBundle appName];
    
    // 获得所有的自定义相册
    PHFetchResult<PHAssetCollection *> *collections = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    for (PHAssetCollection *collection in collections) {
        if ([collection.localizedTitle isEqualToString:appName]) {
            return collection;
        }
    }
    
    // 代码执行到这里，说明还没有自定义相册
    __block NSString *createdCollectionId = nil;
    
    // 创建一个新的相册
    [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
        createdCollectionId = [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:appName].placeholderForCreatedAssetCollection.localIdentifier;
    } error:nil];
    
    if (createdCollectionId == nil) return nil;
    
    // 创建完毕后再取出相册
    return [PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:@[createdCollectionId] options:nil].firstObject;
}

@end
