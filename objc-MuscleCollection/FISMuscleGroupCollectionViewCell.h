//
//  FISMuscleGroupCollectionViewCell.h
//  objc-MuscleCollection
//
//  Created by Bert Carr on 3/24/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FISMuscleGroupCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *muscleGroupImage;
@property (weak, nonatomic) IBOutlet UILabel *muscleGroupName;

@end
