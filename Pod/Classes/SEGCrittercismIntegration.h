#import <Foundation/Foundation.h>
#if defined(__has_include) && __has_include(<Analytics/Analytics.h>)
#import <Analytics/SEGIntegration.h>
#else
#import <Segment/SEGIntegration.h>
#endif


@interface SEGCrittercismIntegration : NSObject <SEGIntegration>

- (id)initWithSettings:(NSDictionary *)settings;

@end
