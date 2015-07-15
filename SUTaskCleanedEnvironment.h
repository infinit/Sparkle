//
//  SUTaskCleanedEnvironment.h
//  Sparkle
//
//  Created by Christopher Crone on 15/07/15.
//
//

#import <Foundation/Foundation.h>

/// Removes DYLD environment variables from environment
@interface SUTaskCleanedEnvironment : NSTask

+ (NSTask*)launchedTaskWithLaunchPath:(NSString*)path
                            arguments:(NSArray*)arguments;

@end
