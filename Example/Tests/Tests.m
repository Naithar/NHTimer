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

            NHTimer *timer = [[NHTimer alloc] initWithRepeatCount:5 interval:0.1 timerBlock:^(NHTimer *timer) {
                count++;
            }];

            [timer stopBlock:^(NHTimer *timer) {
                done();
            }];
            
            [timer start];
            
        });


        expect(count).to.equal(5);

    });

    it(@"will start infinite timer (stop after 10 times)", ^{
        __block NSInteger count = 0;

        waitUntil(^(DoneCallback done) {
            NHTimer *timer = [[NHTimer alloc] initWithInterval:0.1 timerBlock:^(NHTimer *timer) {
                count++;

                if (count > 10) {
                    [timer stop];
                }
            }];

            [timer stopBlock:^(NHTimer *timer) {
                done();
            }];

            [timer start];
        });

        expect(count).to.beInTheRangeOf(10, 15);
    });

    it(@"will user builder", ^{
        __block NSInteger count = 0;

        waitUntil(^(DoneCallback done) {
            [[[[[[[NHTimer timer] repeat:10] interval:0.1] timerBlock:^(NHTimer *timer) {
                count++;
            }] startBlock:^(NHTimer *timer) {
                count += 5;
            }] stopBlock:^(NHTimer *timer) {
                count += 10;
                done();
            }] start];
        });

        expect(count).to.equal(25);
    });
});

SpecEnd
