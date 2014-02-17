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
        return num;
    }
    num = [self field:fieldEnum index:index];
    return num;
}

-(NSNumber *)field:(NSInteger)fieldEnum index:(NSInteger)index {
    if (fieldEnum == CPTScatterPlotFieldX) {
       return [self fieldX:(NSInteger)fieldEnum index:(NSInteger)index];
    }
    return [self fieldY:(NSInteger)fieldEnum index:(NSInteger)index];
}

-(NSNumber *)fieldX:(NSInteger)fieldEnum index:(NSInteger)index{
    float result = self.sampleRate * (float)index;
    return [NSNumber numberWithFloat:result];
}

-(NSNumber *)fieldY:(NSInteger)fieldEnum index:(NSInteger)index{
    return (NSNumber *)[self.data objectAtIndex:index];
}

@end
