#import "SEGCrittercismIntegration.h"
#import <Crittercism/Crittercism.h>
#if defined(__has_include) && __has_include(<Analytics/Analytics.h>)
#import <Analytics/SEGAnalyticsUtils.h>
#else
#import <Segment/SEGAnalyticsUtils.h>
#endif
#if defined(__has_include) && __has_include(<Analytics/Analytics.h>)
#import <Analytics/SEGAnalytics.h>
#else
#import <Segment/SEGAnalytics.h>
#endif


@implementation SEGCrittercismIntegration

- (id)initWithSettings:(NSDictionary *)settings
{
    if (self = [super init]) {
        CrittercismConfig *config = [CrittercismConfig defaultConfig];
        [config setMonitorUIWebView:[(NSNumber *)[settings objectForKey:@"monitorWebView"] boolValue]];
        NSString *appId = [settings objectForKey:@"appId"];
        [Crittercism enableWithAppID:appId andConfig:config];
    }
    return self;
}

- (void)identify:(SEGIdentifyPayload *)payload
{
    // Username
    if (payload.userId) {
        [Crittercism setUsername:payload.userId];
    }

    // Other traits. Iterate over all the traits and set them.
    for (NSString *key in payload.traits) {
        [Crittercism setValue:[payload.traits objectForKey:key] forKey:key];
    }
}

- (void)track:(NSString *)event properties:(NSDictionary *)properties options:(NSDictionary *)options
{
    [Crittercism leaveBreadcrumb:event];
}

- (void)screen:(SEGScreenPayload *)payload
{
    NSString *event = [[NSString alloc] initWithFormat:@"Viewed %@ Screen", payload.name];
    [Crittercism leaveBreadcrumb:event];
}


@end
