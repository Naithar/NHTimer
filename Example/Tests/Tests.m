//
//  NTimerTests.m
//  NTimerTests
//
//  Created by Naithar on 04/18/2015.
//  Copyright (c) 2014 Naithar. All rights reserved.
//

#import <NHTimer.h>

SpecBegin(InitialSpecs)

describe(@"timer start", ^{
    it(@"will run 5 times", ^{

                    __block NSInteger count = 0;

        waitUntil(^(DoneCallback done) {

            NHTimer *timer = [[NHTimer alloc] initWithRepeatCount:5 interval:1 timerBlock:^(NHTimer *timer) {
                count++;
            }];

            [timer stopBlock:^(NHTimer *timer) {
                done();
            }];
            
            [timer start];
            
        });


        expect(count).to.equal(5);

    });
});

SpecEnd
