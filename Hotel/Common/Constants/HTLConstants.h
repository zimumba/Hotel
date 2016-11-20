//
// Created by Antonyo on 11/20/16.
// Copyright (c) 2016 aoli. All rights reserved.
//

@import Foundation;

typedef void (^HTLDefaultSuccessHandler)(id object);
typedef void (^HTLEmptySuccessHandler)(void);
typedef void (^HTLDefaultFailureHandler)(NSError *error);
typedef void (^HTLDefaultProgressHandler)(NSProgress *progress);