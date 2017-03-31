//
//  ViewController.m
//  EBH
//
//  Created by fg on 2017/3/21.
//  Copyright © 2017年 XSL. All rights reserved.
//

#import "ViewController.h"

#import <IJKMediaFramework/IJKMediaFramework.h>
#import "LFLivePreview.h"

@interface ViewController ()

@property (nonatomic, strong) IJKFFMoviePlayerController *player;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    UIView *back = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height / 2)];
//    back.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:back];
//    LFLivePreview *liveView = [[LFLivePreview alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height / 2) withController:self];
//    [self.view addSubview:liveView];
//    [liveView startLive];
    
    IJKFFOptions *options = [IJKFFOptions optionsByDefault];
//    NSURL *url = [NSURL URLWithString:@"rtmp://ebhrtmpplay.satacdn.com/ebhlive/2"];
//    NSURL *url = [NSURL URLWithString:@"http://hls.quanmin.tv/live/333/playlist.m3u8"];
    //缓冲设置
    //最大缓存大小3KB
    [options setPlayerOptionIntValue:(310241024) forKey:@"max-buffer-size"];
    //无限读
    [options setPlayerOptionIntValue:1 forKey:@"infbuf"];
    //媒体流的构成和基本信息设置，针对视频分辨率小的设置（视频分辨率较大的时候可能会异常）
    [options setFormatOptionIntValue:2048 forKey:@"probesize"];
    [options setFormatOptionIntValue:1000 forKey:@"analyzeduration"];
    NSURL *url = [NSURL URLWithString:@"rtmp://live.hkstv.hk.lxdns.com/live/hks"];
    self.player = [[IJKFFMoviePlayerController alloc] initWithContentURL:url withOptions:options];
    self.player.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.player.view.frame = CGRectMake(0, self.view.bounds.size.height / 2, self.view.bounds.size.width, self.view.bounds.size.height / 2);
    self.player.scalingMode = IJKMPMovieScalingModeAspectFit;
    self.player.shouldAutoplay = YES;
    
    self.view.autoresizesSubviews = YES;
    [self.view addSubview:self.player.view];
    
    [self.player prepareToPlay];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.player shutdown];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
