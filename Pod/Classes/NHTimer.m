//
//  NTimer.m
//  Pods
//
//  Created by Naithar on 18.04.15.
//
//

#import "NHTimer.h"

@interface NHTimer ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, copy) NHTimerBlock timerTickBlock;
@property (nonatomic, copy) NHTimerBlock startTimerBlock;
@property (nonatomic, copy) NHTimerBlock stopTimerBlock;

@property (nonatomic, assign) NSInteger repeatCount;
@property (nonatomic, assign) NSTimeInterval timerInterval;

@property (nonatomic, assign) NSInteger currentRepeatCount;

@property (nonatomic, assign) BOOL isRunning;

@end

@implementation NHTimer

- (instancetype)init {
    return [self initWithRepeatCount:-1
                            interval:0
                          startBlock:nil
                          timerBlock:nil
                      stopTimerBlock:nil];
}

- (instancetype)initWithInterval:(NSTimeInterval)interval
                      timerBlock:(NHTimerBlock)timerBlock {
    return [self initWithInterval:interval
                       startBlock:nil
                       timerBlock:timerBlock];
}

- (instancetype)initWithInterval:(NSTimeInterval)interval
                      startBlock:(NHTimerBlock)startBlock
                      timerBlock:(NHTimerBlock)timerBlock {
    return [self initWithRepeatCount:-1
                            interval:interval
                          startBlock:startBlock
                          timerBlock:timerBlock
                      stopTimerBlock:nil];
}

- (instancetype)initWithRepeatCount:(NSInteger)count
                           interval:(NSTimeInterval)interval
                         timerBlock:(NHTimerBlock)timerBlock {
    return [self initWithRepeatCount:count
                            interval:interval
                          startBlock:nil
                          timerBlock:timerBlock
                      stopTimerBlock:nil];
}

- (instancetype)initWithRepeatCount:(NSInteger)count
                           interval:(NSTimeInterval)interval
                         startBlock:(NHTimerBlock)startBlock
                         timerBlock:(NHTimerBlock)timerBlock
                     stopTimerBlock:(NHTimerBlock)stopBlock {
    self = [super init];
    if (self) {
        _repeatCount = count;
        _timerInterval = interval;
        _startTimerBlock = startBlock;
        _timerTickBlock = timerBlock;
        _stopTimerBlock = stopBlock;
    }
    return self;
}

+ (instancetype)timer {
    return [[NHTimer alloc] init];
}

- (instancetype)repeat:(NSInteger)count {
    if (!self.isRunning) {
        self.repeatCount = count;
    }
    return self;
}

- (instancetype)interval:(NSTimeInterval)interval {
    if (!self.isRunning) {
        self.timerInterval = interval;
    }
    return self;
}

- (instancetype)startBlock:(NHTimerBlock)block {
    if (!self.isRunning) {
        self.startTimerBlock = block;
    }
    return self;
}

- (instancetype)timerBlock:(NHTimerBlock)block {
    if (!self.isRunning) {
        self.timerTickBlock = block;
    }
    return self;
}

- (instancetype)stopBlock:(NHTimerBlock)block {
    if (!self.isRunning) {
        self.stopTimerBlock = block;
    }
    return self;
}

- (void)start {
    if (self.timerInterval <= 0
        || self.isRunning) {
        return;
    }

    self.isRunning = YES;

    self.currentRepeatCount = self.repeatCount;

    self.timer = [NSTimer timerWithTimeInterval:self.timerInterval
                                         target:self
                                       selector:@selector(timerMain:)
                                       userInfo:nil repeats:YES];

    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];

    if (self.startTimerBlock) {
        self.startTimerBlock(self);
    }
}

- (void)stop {
    self.isRunning = NO;
    [self.timer invalidate];
    self.timer = nil;

    if (self.stopTimerBlock) {
        self.stopTimerBlock(self);
    }
}

- (void)timerMain:(id)sender {
    if (self.currentRepeatCount > 0) {
        self.currentRepeatCount--;
    }
    else if (self.repeatCount != -1) {
        [self stop];
        return;
    }

    if (self.timerTickBlock) {
        self.timerTickBlock(self);
    }
}

- (void)dealloc {
    [self stop];
    self.stopTimerBlock = nil;
    self.startTimerBlock = nil;
    self.timerTickBlock = nil;


}

@end