//
//  ViewController.m
//  IOSGraph
//
//  Created by vilayouth vongsomxai on 2014/02/15.
//  Copyright (c) 2014年 vilayouth vongsomxai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self editData];
    CPTGraphHostingView *hostingView =
    [[CPTGraphHostingView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    
    CPTMutableTextStyle *textStyle = [CPTTextStyle textStyle];
    textStyle.fontSize             = 13.0f;
    textStyle.textAlignment        = CPTTextAlignmentCenter;
    CPTMutableLineStyle *lineStyle = [CPTMutableLineStyle lineStyle];
    lineStyle.lineColor            = [CPTColor colorWithComponentRed:0 green:0 blue:0.792f alpha:1.0f];
    lineStyle.lineWidth            = 2.0f;
    
    self.graph = [[Graph alloc] initWithFrame:hostingView.bounds];
    [self.graph borderStyle:nil cornerRadius:0 masksToBorder:NO];
    [self.graph framePad:40 right:40 top:40 bottom:40];
    [self.graph plotSpace:CGPointMake(0, 0) width:1 height:10];
    [self.graph coordinateStyle:lineStyle majorLine:lineStyle minorLine:lineStyle];
    [self.graph coordinateTitle:@"dx" titleY:@"Data" tittlePosition:CGPointMake(100, 100) textStly:textStyle];
    [self.graph coordinateInterval:1 yWidth:1 crossPosition:CGPointMake(0, 0)];

    hostingView.hostedGraph = self.graph;
    
    self.scatter = [[LineScatter alloc] initWithData:self.graphData sampleRate:1];
    self.scatter.graphIdentify = @"test";

    CPTScatterPlot *scatterPlot = [[CPTScatterPlot alloc] init];
    scatterPlot.identifier      = @"test";
    scatterPlot.dataSource      = self.scatter;
    
    CPTMutableLineStyle *graphlineStyle = [scatterPlot.dataLineStyle mutableCopy];
    graphlineStyle.lineWidth = 3;                    // 太さ
    graphlineStyle.lineColor = [CPTColor colorWithComponentRed:0 green:0.82f blue:0 alpha:1];// 色
    scatterPlot.dataLineStyle = graphlineStyle;
    
    [self.graph addPlot:scatterPlot];
    
    [self.view addSubview:hostingView];
    [NSTimer scheduledTimerWithTimeInterval:0.5
                                     target:self
                                   selector:@selector(update:)
                                   userInfo:nil
                                    repeats:YES];
}

-(void)update:(NSTimer *)timer {
    [self editData];
    [self.graph reloadData];
}

-(void)editData {
    if (self.graphData == nil) {
        self.graphData = [NSMutableArray array];
    }
    [self.graph plotSpace:CGPointMake(0, 0) width:self.graphData.count height:10];
    [self.graph coordinateInterval:(self.graphData.count / 5.0f) yWidth:1 crossPosition:CGPointMake(0, 0)];
    float randomNumber = (float)arc4random() / 0x100000000 * 10;
    CPTMutableTextStyle *textStyle = [CPTTextStyle textStyle];
    textStyle.fontSize             = 13.0f;
    textStyle.textAlignment        = CPTTextAlignmentCenter;
    [self.graph coordinateTitle:@"dx" titleY:@"Data" tittlePosition:CGPointMake(self.graphData.count, 100) textStly:textStyle];
    [self.graphData addObject:[NSNumber numberWithFloat:randomNumber]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
