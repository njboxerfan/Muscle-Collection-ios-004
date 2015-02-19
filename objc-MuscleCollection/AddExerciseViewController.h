//
//  AddExerciseViewController.h
//  objc-PushupProtocols
//
//  Created by Zachary Drossman on 2/13/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FISExercise;

@protocol ExerciseProtocol <NSObject>

- (void)addNewExercise:(FISExercise *)exercise;
- (void)cancel;

@end

@interface AddExerciseViewController : UIViewController < UITextFieldDelegate>

- (IBAction)newExerciseTapped:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UITextField *exerciseName;
@property (weak, nonatomic) id<ExerciseProtocol> delegate;

@end
