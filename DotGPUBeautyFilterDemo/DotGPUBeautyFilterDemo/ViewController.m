//
//  ViewController.m
//  DotGPUBeautyFilterDemo
//
//  Created by xiang on 09/01/2017.
//  Copyright © 2017 dotEngine. All rights reserved.
//

#import "ViewController.h"

#import <GPUImage.h>

#import "DotGPUImageBeautyFilter.h"

@interface ViewController ()
{
    
    GPUImageView *cameraView;
    GPUImageVideoCamera *videoCamera;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    videoCamera = [[GPUImageVideoCamera alloc] initWithSessionPreset:AVCaptureSessionPreset640x480 cameraPosition:AVCaptureDevicePositionFront];
    videoCamera.outputImageOrientation = UIInterfaceOrientationPortrait;
    
    videoCamera.horizontallyMirrorFrontFacingCamera = YES;
    
    cameraView = [[GPUImageView alloc] initWithFrame:CGRectMake(0, 0, 360, 360)];
    
    DotGPUImageBeautyFilter *filter = [[DotGPUImageBeautyFilter alloc] init];
    
    filter.beautyLevel = 1.0;
    
    filter.toneLevel = 0.8;
    
    
    GPUImageCropFilter *cropfilter = [[GPUImageCropFilter alloc] initWithCropRegion:CGRectMake(0, 0, 1, 0.75)];
    
    //[filter forceProcessingAtSize:cameraView.sizeInPixels];
    
    
    [videoCamera addTarget:filter];
    
    [filter addTarget:cropfilter];
    
    [cropfilter addTarget:cameraView];
    
    [self.view addSubview:cameraView];
    
    
    [videoCamera startCameraCapture];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
