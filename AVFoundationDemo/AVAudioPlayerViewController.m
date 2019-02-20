//
//  AVAudioPlayerViewController.m
//  AVFoundationDemo
//
//  Created by Cary on 2018/11/13.
//  Copyright © 2018 Cary. All rights reserved.
//

#import "AVAudioPlayerViewController.h"
#import "Header.h"
#import <AVFoundation/AVFoundation.h>

@interface AVAudioPlayerViewController ()

@property (nonatomic,strong) AVAudioPlayer *player;

@end

@implementation AVAudioPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"播放音频";
    
    UIButton *buttonPlay = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonPlay.frame = CGRectMake(xScreenWidth/2-30, xScreenHeight/2-60, 60, 30);
    [buttonPlay addTarget:self action:@selector(playAudio) forControlEvents:UIControlEventTouchUpInside];
    [buttonPlay setTitle:@"播放" forState:UIControlStateNormal];
    [buttonPlay setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:buttonPlay];
    
    UIButton *buttonPause = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonPause.frame = CGRectMake(xScreenWidth/2-30, xScreenHeight/2-15, 60, 30);
    [buttonPause addTarget:self action:@selector(pauseAudio) forControlEvents:UIControlEventTouchUpInside];
    [buttonPause setTitle:@"暂停" forState:UIControlStateNormal];
    [buttonPause setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:buttonPause];
    
    NSURL *fileUrl = [[NSBundle mainBundle] URLForResource:@"1" withExtension:@"mp3"];
    self.player = [[AVAudioPlayer alloc]initWithContentsOfURL:fileUrl error:nil];
    //使用立体声播放 -1.0（极左） 1.0（极右） 默认0.0（居中）
    //self.player.pan = 0.0;
    //调整播放率
    //self.player.rate = 2.0;
    [self.player prepareToPlay];
    
}

- (void)playAudio {
    
    [self.player play];
    
}

- (void)pauseAudio {
    [self.player pause];
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
