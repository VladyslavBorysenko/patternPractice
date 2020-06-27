//
//  OpenCVWrapper.h
//  OpenCVTest
//
//  Created by Владислав on 15/04/20.
//  Copyright © 2020 Владислав All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OpenCVWrapper : NSObject

+ (NSString *)openCVVersionString;
+ (NSString *)getQRCodeInformation:(UIImage *)image;

@end

NS_ASSUME_NONNULL_END
