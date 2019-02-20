//
//  PlayVideoViewController.m
//  AVFoundationDemo
//
//  Created by Cary on 2019/2/20.
//  Copyright © 2019 Cary. All rights reserved.
//

#import "PlayVideoViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "Header.h"

@interface PlayVideoViewController () {
    
    BOOL  isPause;
    UIButton *buttonPlay;
}

@property (nonatomic,strong)AVPlayer *myPlayer;
@property (nonatomic,strong)AVPlayerItem *item;
@property (nonatomic,strong)AVPlayerLayer *playerLayer;

@end

@implementation PlayVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"播放视频";
    isPause = NO;
    
    NSURL *theUrl = [NSURL URLWithString:@"https://www.apple.com/105/media/us/iphone-x/2017/01df5b43-28e4-4848-bf20-490c34a926a7/films/feature/iphone-x-feature-tpl-cc-us-20170912_1280x720h.mp4"];
    self.item = [AVPlayerItem playerItemWithURL:theUrl];
    self.myPlayer = [AVPlayer playerWithPlayerItem:self.item];
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.myPlayer];
    self.playerLayer.frame = CGRectMake(0, 0, self.view.bounds.size.width, 500);
    [self.view.layer addSublayer:self.playerLayer];
    [self.myPlayer play];
    
    buttonPlay  = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonPlay.frame = CGRectMake(xScreenWidth/2-30, xScreenHeight/2, 60, 30);
    [buttonPlay addTarget:self action:@selector(playorPause) forControlEvents:UIControlEventTouchUpInside];
    [buttonPlay setTitle:@"暂停" forState:UIControlStateNormal];
    [buttonPlay setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:buttonPlay];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [self.myPlayer pause];
    self.myPlayer = nil;
}

- (void)playorPause {
    
    if (isPause == NO) {
         [buttonPlay setTitle:@"播放" forState:UIControlStateNormal];
        [self.myPlayer pause];
    }
    else {
        [buttonPlay setTitle:@"暂停" forState:UIControlStateNormal];
        [self.myPlayer play];
    }
    isPause = !isPause;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
