//
//  LineScatter.m
//  IOSGraph
//
//  Created by vilayouth vongsomxai on 2014/02/16.
//  Copyright (c) 2014年 vilayouth vongsomxai. All rights reserved.
//

#import "LineScatter.h"

@implementation LineScatter

-(id)initWithData:(NSMutableArray *)data sampleRate:(float)sampleRate {
    self = [super init];
    if (!self) {
        return nil;
    }
    [self editData:data sampleRate:sampleRate];
    return self;
}

-(void)editData:(NSMutableArray *)data {
    self.data = data;
}

-(void)editData:(NSMutableArray *)data sampleRate:(float)sampleRate {
    self.data       = data;
    self.sampleRate = sampleRate;
}

-(NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot {
    NSUInteger numRecords = 0;
    NSString *identifier  = (NSString *)plot.identifier;
    if ( ![identifier isEqualToString:self.graphIdentify] ) {
        return numRecords;
    }
    numRecords = self.data.count;
    return numRecords;
}

-(NSNumber *)numberForPlot:(CPTPlot *)plot
                     field:(NSUInteger)fieldEnum
               recordIndex:(NSUInteger)index {
    NSNumber *num        = nil;
    NSString *identifier = (NSString *)plot.identifier;
    
    if (![identifier isEqualToString:self.graphIdentify]) {
        [self field:fieldEnum index:index number:num];
        return num;
    }
    
    return num;
}

-(void)field:(NSInteger)fieldEnum index:(NSInteger)index number:(NSNumber *)number {
    if (fieldEnum == CPTScatterPlotFieldX) {
        [self fieldX:(NSInteger)fieldEnum index:(NSInteger)index number:(NSNumber *)number];
        return;
    }
    [self fieldY:(NSInteger)fieldEnum index:(NSInteger)index number:(NSNumber *)number ];
}

-(void)fieldX:(NSInteger)fieldEnum index:(NSInteger)index number:(NSNumber *)number {
    float result = self.sampleRate * (float)index;
    number       = [NSNumber numberWithFloat:result];
}

-(void)fieldY:(NSInteger)fieldEnum index:(NSInteger)index number:(NSNumber *)number {
    number = (NSNumber *)[self.data objectAtIndex:index];
}

@end
