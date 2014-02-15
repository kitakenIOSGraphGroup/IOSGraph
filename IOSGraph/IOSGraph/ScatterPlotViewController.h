//
//  ScatterPlotViewController.h
//  IOSGraph
//
//  Created by vilayouth vongsomxai on 2014/02/15.
//  Copyright (c) 2014年 vilayouth vongsomxai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"

// 折れ線グラフ用のデータソース(CPTPlotDataSource)を記載。CPTScatterPlotDataSourceと間違えないように注意
@interface ScatterPlotViewController : UIViewController
<CPTPlotDataSource>
{
@private
    // グラフ表示領域（この領域に円グラフを追加する）
    CPTGraph *graph;
}

// 円グラフで表示するデータを保持する配列
@property (readwrite, nonatomic) NSMutableArray *scatterPlotData;

@end
