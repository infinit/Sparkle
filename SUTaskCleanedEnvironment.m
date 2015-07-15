//
//  SUTaskCleanedEnvironment.m
//  Sparkle
//
//  Created by Christopher Crone on 15/07/15.
//
//

#import "SUTaskCleanedEnvironment.h"

@implementation SUTaskCleanedEnvironment

+ (NSTask*)launchedTaskWithLaunchPath:(NSString*)path
                            arguments:(NSArray*)arguments;
{
  NSTask* res = [[NSTask alloc] init];
  NSDictionary* environment = [NSProcessInfo processInfo].environment;
  res.environment = [self cleanEnvironment:environment];
  res.launchPath = path;
  res.arguments = arguments;
  [res launch];
  return res;
}

+ (NSDictionary*)cleanEnvironment:(NSDictionary*)environment
{
  if (!environment.count)
    return @{};
  NSMutableArray* remove_keys = [NSMutableArray array];
  for (NSString* key in environment.allKeys)
  {
    if ([key rangeOfString:@"DYLD"].location != NSNotFound)
      [remove_keys addObject:key];
  }
  NSMutableDictionary* res = [environment mutableCopy];
  for (NSString* key in remove_keys)
    [res removeObjectForKey:key];
  return [res copy];
}

@end
