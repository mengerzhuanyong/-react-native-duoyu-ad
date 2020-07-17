//
//  RnDuoYuAd.m
//  RnDuoYuAd
//
//  Created by Menger on 2020/7/9.
//  Copyright © 2020 Menger. All rights reserved.
//

#import "RnDuoYuAd.h"
#import <React/RCTBridge.h>
#import "DyAdApi.h"

NSString const *successfullTips = @"Jump game list successful on ios!";

@implementation RnDuoYuAd
//- (dispatch_queue_t)methodQueue{
//    return dispatch_get_main_queue();
//}
RCT_EXPORT_MODULE(RnDuoYuAdModule)


+ (void)initialSetting:(NSString*)appId secretKey:(NSString*)secretKey {
    [DyAdApi registerWithMediaId: appId appKey: secretKey];
}

RCT_EXPORT_METHOD(entryGameList:(NSString*)uid advertType:(NSInteger*)advertType callback:(RCTResponseSenderBlock)callback) {
//    NSLog(@"LOG RnDuoYuAd uid = %@", uid);
//    NSLog(@"LOG RnDuoYuAd advertType = %d", advertType);
    dispatch_async(dispatch_get_main_queue(), ^{
        UIViewController *currentVC = [RnDuoYuAd getCurrentViewController];
        
        [DyAdApi presentListViewController: currentVC userId:uid advertType: advertType];
        callback(@[successfullTips]);
    });
}

+ (UIViewController *)getCurrentViewController {
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    if (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
        return topVC;
    }
    return topVC;
}

@end
