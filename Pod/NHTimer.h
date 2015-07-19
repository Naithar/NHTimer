//
//  NTimer.h
//  Pods
//
//  Created by Naithar on 18.04.15.
//
//

#import <Foundation/Foundation.h>

@class NHTimer;

/// NHTimer inifinite value for repeat count
extern const NSInteger kNHTimerInfiniteRepeatCount; // -1

/// NHTimer block type
typedef void(^NHTimerBlock)(NHTimer *timer);

/**
 NHTimer class
 */
@interface NHTimer : NSObject

/// @name Timer public properties

/**
 Return the number of times timer will perform it's action
*/
@property (nonatomic, readonly, assign) NSInteger currentRepeatCount;

/**
 A Boolean value that determines whether timer is performing it's action at the moment
 */
@property (nonatomic, readonly, assign) BOOL isRunning;


///@name Timer initializers

/**
 Initializes a new NHTimer object with timer interval and timer block
 
 @param interval Seconds between timer action
 @param timerBlock Timer action that will be performed on every tick
 
 @return Newly create timer with interval and timer block
 */
- (instancetype)initWithInterval:(NSTimeInterval)interval
                      timerBlock:(NHTimerBlock)timerBlock;

/**
 Initializes a new NHTimer object with timer interval, start and timer blocks
 
 @param interval Seconds between timer action
 @param startBlock Timer action that will be performed on it's start
 @param timerBlock Timer action that will be performed on every tick
 
 @return Newly create timer with interval and start and stop blocks
 */
- (instancetype)initWithInterval:(NSTimeInterval)interval
                      startBlock:(NHTimerBlock)startBlock
                      timerBlock:(NHTimerBlock)timerBlock;
/**
 Initializes a new NHTimer object with timer interval and start, stop and timer blocks
 
 @param interval Seconds between timer action
 @param startBlock Timer action that will be performed on it's start
 @param timerBlock Timer action that will be performed on every tick
 @param stopBlock Timer action that will be performed when it stops
 
 @return Newly create timer with interval and start, stop and timer blocks
 */
- (instancetype)initWithInterval:(NSTimeInterval)interval
                      startBlock:(NHTimerBlock)startBlock
                      timerBlock:(NHTimerBlock)timerBlock
                       stopBlock:(NHTimerBlock)stopBlock;
/**
 Initializes a new NHTimer object with custom repeat count and timer interval and timer block
 
 @param count Timer repeat count
 @param interval Seconds between timer action
 @param timerBlock Timer action that will be performed on every tick
 
 @return Newly create timer with interval and timer block
 */
- (instancetype)initWithRepeatCount:(NSInteger)count
                           interval:(NSTimeInterval)interval
                         timerBlock:(NHTimerBlock)timerBlock;

/**
 Initializes a new NHTimer object with custom repeat count and timer interval, start and timer blocks
 
 @param count Timer repeat count
 @param interval Seconds between timer action
 @param startBlock Timer action that will be performed on it's start
 @param timerBlock Timer action that will be performed on every tick
 
 @return Newly create timer with interval and start and stop blocks
 */
- (instancetype)initWithRepeatCount:(NSInteger)count
                           interval:(NSTimeInterval)interval
                         startBlock:(NHTimerBlock)startBlock
                         timerBlock:(NHTimerBlock)timerBlock;

/**
 Initializes a new NHTimer object with custom repeat count and timer interval and start, stop and timer blocks
 
 @param count Timer repeat count
 @param interval Seconds between timer action
 @param startBlock Timer action that will be performed on it's start
 @param timerBlock Timer action that will be performed on every tick
 @param stopBlock Timer action that will be performed when it stops
 
 @return Newly create timer with interval and start, stop and timer blocks
 */
- (instancetype)initWithRepeatCount:(NSInteger)count
                           interval:(NSTimeInterval)interval
                         startBlock:(NHTimerBlock)startBlock
                         timerBlock:(NHTimerBlock)timerBlock
                     stopTimerBlock:(NHTimerBlock)stopBlock;

/// @name Timer fluent interface methods

/**
 Creates and returns new default timer
 
 This method creates timer without any action block, interval and infinite repeat count
 
 @return Newly created empty timer
 */
+ (instancetype)timer;
/**
 Sets timer repeat count
 
 @param count Value representing a number of times timer will perform it's action
 
 @return Timer with currently set repeat count
 */
- (instancetype)repeat:(NSInteger)count;
/**
 Sets timer interval between performing an action
 
 @param interval Seconds between timer action
 
 @return Timer with currently set interval value
 */
- (instancetype)interval:(NSTimeInterval)interval;
/**
 Sets timer start action
 
 @param block Timer action that will be performed on it's start
 
 @return Timer with currently set start action
 */
- (instancetype)startBlock:(NHTimerBlock)block;
/**
 Sets timer action
 
 @param block Timer action that will be performed on every tick
 
 @return Timer with currently set timer action
 */
- (instancetype)timerBlock:(NHTimerBlock)block;
/**
 Sets timer stop action
 
 @param block Timer action that will be performed when it stops
 
 @return Timer with currently set stop action
 */
- (instancetype)stopBlock:(NHTimerBlock)block;

///@name Timer methods
 
/**
 Starts timer
 */
- (void)start;
/**
 Stops timer
 */
- (void)stop;
@end
