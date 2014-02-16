#import "Graph.h"

@implementation Graph

-(void)borderStyle:(CPTLineStyle *)lineStyle cornerRadius:(float)cornerRadius masksToBorder:(BOOL)mask {
    self.plotAreaFrame.borderLineStyle = lineStyle;
    self.plotAreaFrame.cornerRadius    = cornerRadius;
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
    CPTXYAxis *x          = axisSet.xAxis;
    x.axisLineStyle       = axisLine;
    x.majorTickLineStyle  = majorLine;
    x.minorTickLineStyle  = minorLine;
    
    CPTXYAxis *y         = axisSet.yAxis;
    y.axisLineStyle      = axisLine;
    y.majorTickLineStyle = majorLine;
    y.minorTickLineStyle = minorLine;
}

-(void)coordinateTitle:(NSString *)titleX titleY:(NSString *)titleY tittlePosition:(CGPoint)possition textStly:(CPTMutableTextStyle *)textStyle {
    CPTXYAxisSet *axisSet = (CPTXYAxisSet *)self.axisSet;
    CPTXYAxis *x          = axisSet.xAxis;
    x.title               = titleX;
    x.titleTextStyle      = textStyle;
    x.titleLocation       = CPTDecimalFromFloat(possition.x);
    x.titleOffset         = textStyle.fontSize;
    
    CPTXYAxis *y     = axisSet.yAxis;
    y.title          = titleY;
    y.titleTextStyle = textStyle;
    y.titleLocation  = CPTDecimalFromFloat(possition.y);
    y.titleOffset    = textStyle.fontSize;
}

-(void)coordinateText:(CPTMutableTextStyle *)textStyle {
    CPTXYAxisSet        *axisSet = (CPTXYAxisSet *)self.axisSet;
    axisSet.xAxis.labelTextStyle = textStyle;
    axisSet.yAxis.labelTextStyle = textStyle;
}

-(void)coordinateInterval:(float)xWidth yWidth:(float)yWidth coordinateCrossPosition:(CGPoint)position {
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