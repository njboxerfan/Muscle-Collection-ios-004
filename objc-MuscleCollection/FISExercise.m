//
//  FISExercise.m
//  objc-PushupProtocols
//
//  Created by Zachary Drossman on 2/13/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import "FISExercise.h"

@implementation FISExercise

-(instancetype)init {
    return [self initWithName:@""];
}

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        self.name = name;
        self.muscleGroups = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
