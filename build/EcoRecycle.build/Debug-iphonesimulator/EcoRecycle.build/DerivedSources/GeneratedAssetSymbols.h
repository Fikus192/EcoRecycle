#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The "ecoRecycle" asset catalog image resource.
static NSString * const ACImageNameEcoRecycle AC_SWIFT_PRIVATE = @"ecoRecycle";

/// The "ecoRecycle_logo" asset catalog image resource.
static NSString * const ACImageNameEcoRecycleLogo AC_SWIFT_PRIVATE = @"ecoRecycle_logo";

#undef AC_SWIFT_PRIVATE