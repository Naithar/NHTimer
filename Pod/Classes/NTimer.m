//
//  NTimer.m
//  Pods
//
//  Created by Naithar on 18.04.15.
//
//

#import "NTimer.h"

@implementation NTimer

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