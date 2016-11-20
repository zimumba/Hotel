//
// Created by Antonyo on 11/20/16.
// Copyright (c) 2016 aoli. All rights reserved.
//

#import "NSObject+HTLClassName.h"

@implementation NSObject (HTLClassName)

- (NSString *)htl_className {
    return NSStringFromClass([self class]);
}

+ (NSString *)htl_className {
    return NSStringFromClass([self class]);
}

@end