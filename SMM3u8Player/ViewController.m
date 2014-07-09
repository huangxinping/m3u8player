//
//  ViewController.m
//  SMM3u8Player
//
//  Created by huangxinping on 7/9/14.
//  Copyright (c) 2014 ShareMerge. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()


@end

@implementation ViewController
{
	MPMoviePlayerController *moviePlayer;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];

	moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:@"http://web-play.pptv.com/web-m3u8-300157.m3u8?type=mpptv&playback=0&kk=d6d9bac5ac07c166fa2ecc3c5f7aa043-8b45-53bceba5&o=m.pptv.com"]];
	if (moviePlayer) {
		moviePlayer.scalingMode = MPMovieScalingModeAspectFit; // 铺满屏幕、100%、50%之类的
		//moviePlayer.controlStyle = MPMovieControlStyleNone;
		moviePlayer.backgroundView.backgroundColor = [UIColor redColor];
		moviePlayer.view.hidden = NO;
		moviePlayer.shouldAutoplay = YES;
		moviePlayer.view.backgroundColor = [UIColor redColor];
		[self.view addSubview:moviePlayer.view];
		moviePlayer.view.frame = CGRectMake(0, 0, 320, 200);
	}
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerPlaybackDidFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:moviePlayer];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerNowPlaying:) name:MPMoviePlayerNowPlayingMovieDidChangeNotification object:moviePlayer];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerLoadState:) name:MPMoviePlayerLoadStateDidChangeNotification object:moviePlayer];
}

- (void)playerPlaybackDidFinish:(NSNotification *)notification {
	NSLog(@"%@", notification);
}

- (void)playerNowPlaying:(NSNotification *)notification {
	NSLog(@"%@", notification);
}

- (void)playerLoadState:(NSNotification *)notification {
	NSLog(@"%@", notification);
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
