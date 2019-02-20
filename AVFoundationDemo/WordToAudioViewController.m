//
//  WordToAudioViewController.m
//  AVFoundationDemo
//
//  Created by Cary on 2018/11/13.
//  Copyright © 2018 Cary. All rights reserved.
//

#import "WordToAudioViewController.h"
#import "Header.h"
#import <AVFoundation/AVFoundation.h>

@interface WordToAudioViewController ()

@property (nonatomic,strong)UITextView *textView;
@end

@implementation WordToAudioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"文字转语音";
    
    _textView = [[UITextView alloc]init];
    _textView.frame = CGRectMake(30, 100, xScreenWidth-60, 150);
    _textView.backgroundColor = [UIColor lightGrayColor];
    _textView.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:_textView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(xScreenWidth/2-30, xScreenHeight/2-15, 60, 30);
    [button addTarget:self action:@selector(wordToAudio) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"转换" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    
}

- (void)wordToAudio {

    AVSpeechSynthesizer *synthesizer = [[AVSpeechSynthesizer alloc]init];
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc]initWithString:_textView.text];
    //语种类型  "zh-CN" 中文(普通话)  "en-US" 英语(美国)  "en-GB" 英语(英国)  "zh-TW" 中文(台湾)  "zh-HK" 中文(香港)粤语
    AVSpeechSynthesisVoice *language = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];
    utterance.voice = language;
    //播放语音的速率
    utterance.rate = 0.4;
    //声音的音调
    utterance.pitchMultiplier = 0.8;
    //音量调节
    utterance.volume = 1;
    
    [synthesizer speakUtterance:utterance];  //开始播放
    //[synthesizer continueSpeaking]; // 停止播放
    //[synthesizer pauseSpeakingAtBoundary:AVSpeechBoundaryWord];//暂停
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.view endEditing:YES];
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
