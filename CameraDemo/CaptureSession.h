//
//  CaptureSession.h
//  CameraDemo
//
//  Created by shuhuan on 2020/1/13.
//  Copyright © 2020 shuhuan. All rights reserved.
//

#ifndef CaptureSession_h
#define CaptureSession_h


#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

typedef NS_ENUM (NSUInteger,CaptureSessionPreset){
    CaptureSessionPreset640x480,
    CaptureSessionPresetiFrame960x540,
    CaptureSessionPreset1280x720,
};

@protocol CaptureSessionDelegate <NSObject>
- (void)videoWithSampleBuffer:(CMSampleBufferRef)sampleBuffer;
@end

@interface CaptureSession : NSObject
@property (nonatomic ,strong) id<CaptureSessionDelegate>delegate;
@property (nonatomic ,strong) AVCaptureSession *session;
- (instancetype)initWithCaptureSessionPreset:(CaptureSessionPreset)preset;
- (void)start;
- (void)stop;
- (void)switchCamera;
@end


#endif /* CaptureSession_h */
