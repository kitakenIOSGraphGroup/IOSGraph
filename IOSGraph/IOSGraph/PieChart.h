#import "CPTPieChart.h"
#import "CorePlot-CocoaTouch.h"
@interface PieChart : CPTPieChart <CPTPieChartDataSource, CPTPieChartDelegate>

@property (nonatomic, strong) NSMutableArray *dataList;
@property (nonatomic, strong) NSMutableArray *dataName;
@property (nonatomic, strong) CPTColor       *labelColor;


-(void)addData:(float)data;
-(void)editData:(float)data index:(int)index;
-(void)addDatas:(NSMutableArray *)datas;
@end
