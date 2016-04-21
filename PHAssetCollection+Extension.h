//
//  PHAssetCollection+Extension.h
//  sunbohong
//
//  Created by sunbohong on 16/4/21.
//  Copyright © 2016年 sunbohong. All rights reserved.
//

#import <Photos/Photos.h>

@interface PHAssetCollection (Extension)

/**
 *  获取一个以应用名命名的<code>PHAssetCollection</code>，如果没有，则会自动创建
 *
 *  @return 以应用名命名的<code>PHAssetCollection</code>
 */
+ (PHAssetCollection *)appAssetCollection;

@end
