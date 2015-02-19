//
//  FISExercise.h
//  objc-PushupProtocols
//
//  Created by Zachary Drossman on 2/13/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISExercise : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSMutableArray *muscleGroups;

- (instancetype)initWithName:(NSString *)name;

@end
