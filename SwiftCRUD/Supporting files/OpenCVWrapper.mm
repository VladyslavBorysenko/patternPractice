//
//  OpenCVWrapper.m
//  OpenCVTest
//
//  Created by Владислав on 15/04/20.
//  Copyright © 2020 Владислав All rights reserved.
//

#import <opencv2/opencv.hpp>
#import "OpenCVWrapper.h"
#import <opencv2/imgcodecs/ios.h>
#import <UIKit/UIKit.h>

@implementation OpenCVWrapper


+ (NSString *)openCVVersionString {
    return [NSString stringWithFormat:@"OpenCV Version %s",  CV_VERSION];
}

+ (NSString *)getQRCodeInformation:(UIImage *)image {
    cv:: Mat inputImage;
    UIImageToMat(image, inputImage);
    cv:: QRCodeDetector qrDetector = cv::QRCodeDetector();
    cv:: Mat bbox, rectifiedImage;
    std::string data = qrDetector.detectAndDecode(inputImage, bbox, rectifiedImage);
    if (data.length()>0) {
        NSString * qrCodeData = @(data.c_str());
        return qrCodeData;
        
    }
    else {
        NSString * qrCodeData = @""; 
        return qrCodeData;
    }
    return 0;
}
@end
