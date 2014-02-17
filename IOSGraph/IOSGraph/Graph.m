#import "Graph.h"

@implementation Graph
-(id)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    return self;
}

-(void)borderStyle:(CPTLineStyle *)lineStyle cornerRadius:(float)radius masksToBorder:(BOOL)mask {
    self.plotAreaFrame.borderLineStyle = lineStyle;
    self.plotAreaFrame.cornerRadius    = radius;
    self.plotAreaFrame.masksToBorder   = mask;
}

-(void)framePad:(float)left right:(float)right top:(float)top bottom:(float)bottom {
    self.paddingLeft   = 0.0f;
    self.paddingRight  = 0.0f;
    self.paddingTop    = 0.0f;
    self.paddingBottom = 0.0f;
    self.plotAreaFrame.paddingLeft   = left;
    self.plotAreaFrame.paddingTop    = top;
    self.plotAreaFrame.paddingRight  = right;
    self.plotAreaFrame.paddingBottom = bottom;
}

-(void)plotSpace:(CGPoint)startPoint width:(int)width height:(int)height {
    CPTXYPlotSpace *plotSpace = (CPTXYPlotSpace *)self.defaultPlotSpace;
    NSDecimal x = CPTDecimalFromInt(startPoint.x);
    NSDecimal y = CPTDecimalFromInt(startPoint.y);
    NSDecimal w = CPTDecimalFromInt(width);
    NSDecimal h = CPTDecimalFromInt(height);
    plotSpace.xRange = [CPTPlotRange plotRangeWithLocation:x length:w];
    plotSpace.yRange = [CPTPlotRange plotRangeWithLocation:y length:h];
}

-(void)coordinateStyle:(CPTMutableLineStyle *)axisLine majorLine:(CPTMutableLineStyle *)majorLine minorLine:(CPTMutableLineStyle *)minorLine {
    CPTXYAxisSet *axisSet = (CPTXYAxisSet *)self.axisSet;
    axisSet.xAxis.axisLineStyle       = axisLine;
    axisSet.xAxis.majorTickLineStyle  = majorLine;
    axisSet.xAxis.minorTickLineStyle  = minorLine;
    axisSet.yAxis.axisLineStyle      = axisLine;
    axisSet.yAxis.majorTickLineStyle = majorLine;
    axisSet.yAxis.minorTickLineStyle = minorLine;
}

-(void)coordinateTitle:(NSString *)titleX titleY:(NSString *)titleY tittlePosition:(CGPoint)possition textStly:(CPTMutableTextStyle *)textStyle {
    CPTXYAxisSet *axisSet = (CPTXYAxisSet *)self.axisSet;
    axisSet.xAxis.title          = titleX;
    axisSet.xAxis.titleTextStyle = textStyle;
    axisSet.xAxis.titleLocation  = CPTDecimalFromFloat(possition.x);
    axisSet.xAxis.titleOffset    = textStyle.fontSize;
    axisSet.yAxis.title          = titleY;
    axisSet.yAxis.titleTextStyle = textStyle;
    axisSet.yAxis.titleLocation  = CPTDecimalFromFloat(possition.y);
    axisSet.yAxis.titleOffset    = textStyle.fontSize;
}

-(void)coordinateText:(CPTMutableTextStyle *)textStyle {
    CPTXYAxisSet        *axisSet = (CPTXYAxisSet *)self.axisSet;
    axisSet.xAxis.labelTextStyle = textStyle;
    axisSet.yAxis.labelTextStyle = textStyle;
}

-(void)coordinateInterval:(float)xWidth yWidth:(float)yWidth crossPosition:(CGPoint)position {
    CPTXYAxisSet *axisSet = (CPTXYAxisSet *)self.axisSet;
    axisSet.xAxis.majorIntervalLength = CPTDecimalFromFloat(xWidth);
    axisSet.yAxis.majorIntervalLength = CPTDecimalFromFloat(yWidth);
    axisSet.xAxis.orthogonalCoordinateDecimal = CPTDecimalFromFloat(position.y);
    axisSet.yAxis.orthogonalCoordinateDecimal = CPTDecimalFromFloat(position.x);
}

-(void)grid:(CPTMutableLineStyle *)gridX gridY:(CPTMutableLineStyle *)gridY {
    CPTXYAxisSet *axisSet = (CPTXYAxisSet *)self.axisSet;
    axisSet.xAxis.majorGridLineStyle = gridX;
    axisSet.yAxis.majorGridLineStyle = gridY;
}
@end