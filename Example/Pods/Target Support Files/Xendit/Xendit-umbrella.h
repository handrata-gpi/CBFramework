#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "ISHLogDNAService.h"
#import "IDFAHelper.h"
#import "Xendit.h"

FOUNDATION_EXPORT double XenditVersionNumber;
FOUNDATION_EXPORT const unsigned char XenditVersionString[];

