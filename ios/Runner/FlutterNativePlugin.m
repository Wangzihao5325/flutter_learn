#import "FlutterNativePlugin.h"
@implementation FlutterNativePlugin
- (NSString *)ocFunction:(NSString *)str{
    NSString* res = [@"test from Obj-c" stringByAppendingString:str];
    return res;
}
@end
