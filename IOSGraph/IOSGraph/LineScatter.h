//
//  LineScatter.h
//  IOSGraph
//
//  Created by vilayouth vongsomxai on 2014/02/16.
//  Copyright (c) 2014年 vilayouth vongsomxai. All rights reserved.
//

#import "CPTScatterPlot.h"
#import "CorePlot-CocoaTouch.h"

@interface LineScatter : CPTScatterPlot <CPTPlotDataSource>
@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic, strong) NSString *graphIdentify;
@property float sampleRate;

-(id)initWithData:(NSMutableArray *)data sampleRate:(float)sampleRate;
-(void)editData:(NSMutableArray *)data;
-(void)editData:(NSMutableArray *)data sampleRate:(float)sampleRate;
@end
