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

@property (nonatomic, assign) NSInteger repeatCount;
@property (nonatomic, assign) NSTimeInterval timerInterval;

@property (nonatomic, assign) NSInteger currentRepeatCount;

@property (nonatomic, assign) BOOL isRunning;


@end

@implementation NHTimer

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
                          timerBlock:timerBlock];
}

- (instancetype)initWithRepeatCount:(NSInteger)count
                           interval:(NSTimeInterval)interval
                         timerBlock:(NHTimerBlock)timerBlock {
    return [self initWithRepeatCount:count
                            interval:interval
                          startBlock:nil
                          timerBlock:timerBlock];
}

- (instancetype)initWithRepeatCount:(NSInteger)count
                           interval:(NSTimeInterval)interval
                         startBlock:(NHTimerBlock)startBlock
                         timerBlock:(NHTimerBlock)timerBlock {
    self = [super init];
    if (self) {
        _repeatCount = count;
        _timerInterval = interval;
        _startTimerBlock = startBlock;
        _timerTickBlock = timerBlock;
    }
    return self;
}

+ (instancetype)timer {
    return [[[self class] alloc] initWithRepeatCount:-1
                                            interval:0
                                          startBlock:nil
                                          timerBlock:nil];
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

- (void)start {
    self.isRunning = YES;

    __weak __typeof(self) weakSelf = self;
    if (weakSelf.startTimerBlock) {
        weakSelf.startTimerBlock(weakSelf);
    }

    self.currentRepeatCount = self.repeatCount;

    self.timer = [NSTimer timerWithTimeInterval:self.timerInterval
                                         target:self
                                       selector:@selector(timerMain)
                                       userInfo:nil repeats:YES];

}

- (void)stop {
    self.isRunning = NO;
    [self.timer invalidate];
    self.timer = nil;
}

- (void)timerMain {
    if (self.currentRepeatCount > 0) {
        self.currentRepeatCount--;
    }
    else if (self.repeatCount != -1) {
        [self stop];
        return;
    }

    __weak __typeof(self) weakSelf = self;
    if (weakSelf.timerTickBlock) {
        weakSelf.timerTickBlock(weakSelf);
    }
}

- (void)dealloc {
    [self stop];
    self.startTimerBlock = nil;
    self.timerTickBlock = nil;

}

@end


//
//import Foundation
//
//public typealias ITCTimerBlock = (ITCTimer) -> ()
//
//@objc
//public class ITCTimer: NSObject {
//
//    private(set) var timer : NSTimer?
//    public var actionBlock: (ITCTimerBlock)?
//    public var startBlock: (ITCTimerBlock)?
//    private(set) var currentRepeatCount: Int = -1
//    public var repeatCount: Int = -1
//    public var interval: NSTimeInterval = 1
//    public var repeat : Bool = false
//
//    public convenience init(
//                            interval: NSTimeInterval,
//                            repeat: Bool) {
//        self.init(
//                  interval: interval,
//                  repeat: repeat,
//                  block: nil)
//    }
//
//    public init(
//                interval: NSTimeInterval,
//                repeat: Bool,
//                block: (ITCTimerBlock)?,
//                startBlock: (ITCTimerBlock)? = nil) {
//        super.init()
//        self.actionBlock = block
//        self.interval = interval
//        self.repeat = repeat
//        self.startBlock = startBlock
//    }
//
//    public init(
//                interval: NSTimeInterval,
//                repeatCount: Int,
//                block: (ITCTimerBlock)?,
//                startBlock: (ITCTimerBlock)? = nil) {
//        super.init()
//        self.actionBlock = block
//        self.repeatCount = repeatCount
//        self.interval = interval
//        self.repeat = false
//        self.startBlock = startBlock
//    }
//
//    @objc func block() {
//
//        if self.currentRepeatCount > 0 {
//            self.currentRepeatCount--
//        }
//        else if self.repeatCount != -1 {
//            self.stop()
//            return
//        }
//
//        self.actionBlock?(self)
//    }
//
//    public func start() {
//
//        self.startBlock?(self)
//
//        self.currentRepeatCount = self.repeatCount
//
//        self.timer = NSTimer.scheduledTimerWithTimeInterval(
//                                                            self.interval,
//                                                            target: self,
//                                                            selector: Selector("block"),
//                                                            userInfo: nil,
//                                                            repeats: self.repeatCount != -1 || self.repeat)
//    }
//    
//    public func stop() {
//        self.timer?.invalidate()
//        self.timer = nil
//    }
//    
//    deinit {
//        self.timer?.invalidate()
//        self.timer = nil
//    }
//}