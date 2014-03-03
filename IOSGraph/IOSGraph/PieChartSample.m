//
//  PieChartSample.m
//  IOSGraph
//
//  Created by vilayouth vongsomxai on 2014/03/03.
//  Copyright (c) 2014年 vilayouth vongsomxai. All rights reserved.
//

#import "PieChartSample.h"

@interface PieChartSample ()

@end

@implementation PieChartSample

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (!self) {
        return nil;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CPTGraphHostingView *hostingView = [[CPTGraphHostingView alloc]
                                        initWithFrame:CGRectMake(0, 0, 320, 320)];
    
    self.graph              = [[Graph alloc] initWithFrame:hostingView.bounds];
    self.graph.axisSet      = nil;
    hostingView.hostedGraph = self.graph;
    
    self.pieChart = [[PieChart alloc] init];
    self.pieChart.pieInnerRadius = 80;
    self.pieChart.labelOffset    = 100;
    [self.pieChart addData:10];
    [self.pieChart addData:20];
    [self.pieChart addData:1];
    [self.pieChart.dataName addObject:@"LOL"];
    [self.pieChart.dataName addObject:@"hahahaha"];
    [self.pieChart.dataName addObject:@"mumumuhahuahahaha"];
    
    [self.graph addPlot:self.pieChart];
    
    [self.view addSubview:hostingView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
