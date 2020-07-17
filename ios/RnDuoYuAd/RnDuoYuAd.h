//
//  RnDuoYuAd.h
//  RnDuoYuAd
//
//  Created by Menger on 2020/7/9.
//  Copyright © 2020 Menger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <React/RCTBridgeModule.h>

@interface RnDuoYuAd : NSObject<RCTBridgeModule>
// 初始化SDK
+ (void)initialSetting:(NSString*)appId secretKey:(NSString*)secretKey;

@end
