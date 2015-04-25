//
//  NViewController.m
//  NTimer
//
//  Created by Naithar on 04/18/2015.
//  Copyright (c) 2014 Naithar. All rights reserved.
//

#import "NViewController.h"
#import <NHTimer.h>

@interface NViewController ()

@end

@implementation NViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    NHTimer *timer = [[NHTimer alloc] initWithRepeatCount:5
                                                 interval:1
                                               timerBlock:^(NHTimer *timer) {
        NSLog(@"timer tick %@", timer);
    }];

    [timer start];

    [[[[[NHTimer timer] repeat:2] interval:0.5] timerBlock:^(NHTimer *timer) {
        NSLog(@"action");
    }] start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
