//
//  ViewController.m
//  AVFoundationDemo
//
//  Created by Cary on 2018/9/17.
//  Copyright © 2018年 Cary. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
#import "WordToAudioViewController.h"
#import "AVAudioPlayerViewController.h"
#import "PlayVideoViewController.h"

static  NSString* const xMainCell = @"mainCell";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
    NSArray *array;
}

@property (nonatomic,strong) AVAudioPlayer *player;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"AVFoundation";
    array = @[@"AVSpeechUtterance文字转语音",@"AVAudioPlayer播放音频",@"AVPlayerViewController播放视频",@"AVPlayer+AVPlayerLayer播放视频"];
    UITableView *mainTableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    mainTableView.delegate = self;
    mainTableView.dataSource = self;
    mainTableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:mainTableView];
    [mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:xMainCell];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:xMainCell];
    cell.textLabel.text = array[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    switch (indexPath.row) {
        case 0:
        [self wordToAudio];
        break;
        case 1:
        [self AVAudioPlayerToplayVideo];
        break;
        case 2:
        [self playVideo];
        break;
        case 3:
        [self toPlayVideo];
        break;
        default:
        break;
    }
}


- (void)wordToAudio {

    WordToAudioViewController *vc = [[WordToAudioViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}


- (void)AVAudioPlayerToplayVideo {
    
    AVAudioPlayerViewController *vc = [[AVAudioPlayerViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)playVideo {
    
     NSURL *fileUrl = [[NSBundle mainBundle] URLForResource:@"2" withExtension:@"mp4"];
    AVPlayerViewController *vc = [[AVPlayerViewController alloc]init];
    vc.player = [AVPlayer playerWithURL:fileUrl];
    [self presentViewController:vc animated:YES completion:nil];
    [vc.player play];
}

- (void)toPlayVideo {
    
    PlayVideoViewController *vc = [[PlayVideoViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
