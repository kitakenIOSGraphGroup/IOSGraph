#import "PieChart.h"

@implementation PieChart

-(id)init{
    self = [super init];
    if (!self) {
        return nil;
    }
    self.dataList = [NSMutableArray array];
    self.dataName = [NSMutableArray array];
    self.labelColor = [[CPTColor alloc] initWithComponentRed:0 green:0 blue:0 alpha:1];
    self.dataSource = self;
    self.delegate = self;
    return self;
}

-(NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot {
    return self.dataList.count;
}

-(NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum
               recordIndex:(NSUInteger)index {
    NSNumber *data = [self.dataList objectAtIndex:index];
    return data;
}

-(CPTLayer *)dataLabelForPlot:(CPTPlot *)plot recordIndex:(NSUInteger)index {
    NSNumber    *data = [self.dataList objectAtIndex:index];
    NSString *message = [self.dataName objectAtIndex:index];
    NSString *details = [NSString stringWithFormat:@"\n%.2f",[data floatValue]];
    message           = [message stringByAppendingString:details];

    CPTTextLayer *label = [[CPTTextLayer alloc] initWithText:message];
    return label;
}

-(CGFloat)radialOffsetForPieChart:(CPTPieChart *)piePlot recordIndex:(NSUInteger)index
{
    //space between graph
    CGFloat offset = 0.0;
    return offset;
}

-(NSString *)legendTitleForPieChart:(CPTPieChart *)pieChart recordIndex:(NSUInteger)index
{
    NSString *name = [self.dataName objectAtIndex:index];
    return name;
}

-(void)pieChart:(CPTPieChart *)plot sliceWasSelectedAtRecordIndex:(NSUInteger)index
{
    //event when tap on the graph
}

-(void)addData:(float)data {
    NSNumber *number = [NSNumber numberWithFloat:data];
    [self.dataList addObject:number];
}

-(void)addDatas:(NSMutableArray *)datas {
    [self.dataList addObjectsFromArray:datas];
}

-(void)editData:(float)data index:(int)index {
    NSNumber *number = [NSNumber numberWithFloat:data];
    [self.dataList replaceObjectAtIndex:index withObject:number];
}

-(void)addNames:(NSMutableArray *)name {
    [self.dataName addObjectsFromArray:name];
}
@end