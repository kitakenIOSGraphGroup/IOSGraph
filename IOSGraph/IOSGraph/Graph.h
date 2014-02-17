#import "CPTGraph.h"
#import "CorePlot-CocoaTouch.h"

@interface Graph : CPTXYGraph

-(void)framePad:(float)left right:(float)right top:(float)top bottom:(float)bottom;
-(void)plotSpace:(CGPoint)startPoint width:(int)width height:(int)height;

-(void)coordinateStyle:(CPTMutableLineStyle *)axisLine majorLine:(CPTMutableLineStyle *)majorLine minorLine:(CPTMutableLineStyle *)minorLine;
-(void)borderStyle:(CPTLineStyle *)lineStyle cornerRadius:(float)radius masksToBorder:(BOOL)mask;

-(void)coordinateTitle:(NSString *)titleX titleY:(NSString *)titleY tittlePosition:(CGPoint)possition textStly:(CPTMutableTextStyle *)textStyle;

-(void)coordinateText:(CPTMutableTextStyle *)textStyle;
-(void)coordinateInterval:(float)xWidth yWidth:(float)yWidth crossPosition:(CGPoint)position;
-(void)grid:(CPTMutableLineStyle *)gridX gridY:(CPTMutableLineStyle *)gridY;
@end
