//
//  NTimer.h
//  Pods
//
//  Created by Naithar on 18.04.15.
//
//

#import <Foundation/Foundation.h>

@class NHTimer;

typedef void(^NHTimerBlock)(NHTimer *timer);


@interface NHTimer : NSObject

@property (nonatomic, readonly, assign) BOOL isRunning;


- (instancetype)initWithInterval:(NSTimeInterval)interval
                      timerBlock:(NHTimerBlock)timerBlock;

- (instancetype)initWithInterval:(NSTimeInterval)interval
                      startBlock:(NHTimerBlock)startBlock
                      timerBlock:(NHTimerBlock)timerBlock;

- (instancetype)initWithRepeatCount:(NSInteger)count
                           interval:(NSTimeInterval)interval
                         timerBlock:(NHTimerBlock)timerBlock;

- (instancetype)initWithRepeatCount:(NSInteger)count
                           interval:(NSTimeInterval)interval
                         startBlock:(NHTimerBlock)startBlock
                         timerBlock:(NHTimerBlock)timerBlock
                     stopTimerBlock:(NHTimerBlock)stopBlock;

+ (instancetype)timer;
- (instancetype)repeat:(NSInteger)count;
- (instancetype)interval:(NSTimeInterval)interval;
- (instancetype)startBlock:(NHTimerBlock)block;
- (instancetype)timerBlock:(NHTimerBlock)block;
- (instancetype)stopBlock:(NHTimerBlock)block;

- (void)start;

- (void)stop;
@end
