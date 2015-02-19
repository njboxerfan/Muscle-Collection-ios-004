//
//  MuscleGroup.h
//  objc-PushupProtocols
//
//  Created by Zachary Drossman on 2/18/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FISMuscleGroup : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) UIImage *imageOfMuscleGroup;

- (instancetype)initWithName:(NSString *)name MuscleGroupImage:(UIImage *)muscleGroupImage;

@end
