//
//  MuscleGroup.m
//  objc-PushupProtocols
//
//  Created by Zachary Drossman on 2/18/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import "FISMuscleGroup.h"

@implementation FISMuscleGroup

- (instancetype)initWithName:(NSString *)name MuscleGroupImage:(UIImage *)muscleGroupImage
{
    self = [super init];
    if (self) {
        self.name = name;
        self.imageOfMuscleGroup = muscleGroupImage;
    }
    return self;
}

-(NSString *)description {
    return self.name;
}
@end
