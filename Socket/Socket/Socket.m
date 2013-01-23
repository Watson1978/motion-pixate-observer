#import "Socket.h"
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>

@implementation Socket

- (id)initWithHost:(NSString*)host Port:(int)port
{
    _host = host;
    _port = port;
    _gcdq = dispatch_queue_create("csschange", DISPATCH_QUEUE_CONCURRENT);
    return self;
}

- (void)setDelegate:(id)obj
{
    _delegate = obj;
}

- (void)startReceivingData
{
    dispatch_async(_gcdq, ^{
        struct sockaddr_in serv_addr;
        CFMutableDataRef received = CFDataCreateMutable(NULL, 0);
        char buffer[128];
        int sockfd = socket(AF_INET, SOCK_STREAM, 0);
        struct hostent *host;

        memset(&serv_addr, 0, sizeof(serv_addr));
        host = gethostbyname([_host UTF8String]);
        if (host == NULL) {
            NSLog(@"fail gethostbyname");
            return;
        }

        serv_addr.sin_family = AF_INET;
        serv_addr.sin_port = htons(_port);
        serv_addr.sin_addr.s_addr = *(unsigned int *)host->h_addr_list[0];

        int ret = connect(sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr));
        if (ret < 0) {
            NSLog(@"fail connect");
            return;
        }
        while (true) {
            int n = recv(sockfd, buffer, sizeof(buffer), 0);
            int received_size = CFDataGetLength(received);

            if (n > 0) {
                CFDataIncreaseLength(received, n);
                memcpy((void*)(CFDataGetMutableBytePtr(received) + received_size), buffer, n);
                if (n == sizeof(buffer)) {
                    continue;
                }

                dispatch_sync(dispatch_get_main_queue(), ^{
                    NSString *string = [NSString stringWithUTF8String:(const char*)CFDataGetBytePtr(received)];
                    if ([_delegate respondsToSelector:@selector(socketDidReceive:)]) {
                        [_delegate performSelector:@selector(socketDidReceive:) withObject:string];
                    }
                });
                CFDataSetLength(received, 0);
            }
        }
    });
}
@end
