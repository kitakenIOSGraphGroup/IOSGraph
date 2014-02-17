//
//  ViewController.h
//  IOSGraph
//
//  Created by vilayouth vongsomxai on 2014/02/15.
//  Copyright (c) 2014年 vilayouth vongsomxai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"
#import "LineScatter.h"
#import "Graph.h"
@interface ViewController : UIViewController
@property (nonatomic, strong) Graph *graph;
@property (nonatomic, strong) LineScatter *scatter;
@property (nonatomic, strong) NSMutableArray *graphData;
@end
