#import <Foundation/Foundation.h>

@interface Socket : NSObject
{
    NSString* _host;
    int _port;
    id _delegate;

    dispatch_queue_t _gcdq;
}
- (id)initWithHost:(NSString*)host Port:(int)port;
- (void)startReceivingData;

@end
