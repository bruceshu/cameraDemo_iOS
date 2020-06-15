//
//  ViewController.m
//  CameraDemo
//
//  Created by shuhuan on 2020/1/13.
//  Copyright © 2020 shuhuan. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import <Foundation/Foundation.h>

#import "ViewController.h"
#import "CaptureSession.h"

@interface ViewController () <CaptureSessionDelegate>
@property (nonatomic,strong) CaptureSession *captureSession;
@property (nonatomic,strong) AVCaptureVideoPreviewLayer *previewLayer;
@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)onClickButtonOpenCamera:(id)sender {
    NSLog(@"bruce >>> openCamera");
    _captureSession = [[CaptureSession alloc] initWithCaptureSessionPreset:CaptureSessionPreset640x480];
    _captureSession.delegate = self;
    _previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:_captureSession.session];
    _previewLayer.frame = CGRectMake(0.f, 200.f, self.view.bounds.size.width, self.view.bounds.size.height);
    _previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [self.view.layer addSublayer:_previewLayer];
    [_captureSession start];
}

- (IBAction)onClickButtonCloseCamera:(id)sender {
    NSLog(@"bruce >>> closeCamera");
    [_captureSession stop];
    [_previewLayer removeFromSuperlayer];
}

- (IBAction)onClickButtonSwitchCamera:(id)sender {
    NSLog(@"bruce >>> switchCamera");
    [_captureSession switchCamera];
}

@end
