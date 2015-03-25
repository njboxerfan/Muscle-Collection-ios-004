//
//  StatsViewController.m
//  objc-PushupProtocols
//
//  Created by Zachary Drossman on 2/12/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import "StatsViewController.h"
#import "FISWorkout.h"
#import "FISExercise.h"
#import "FISMuscleGroup.h"

@interface StatsViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *pickerSegmentedControl;
@property (strong, nonatomic) NSMutableArray *workouts;
@property (strong, nonatomic)   NSMutableArray *workoutsOfSelected;
@property (strong, nonatomic) NSNumber *totalNumberOfSelected;
@property (strong, nonatomic) NSNumber *averageSelectedPerDay;
@property (strong, nonatomic) NSNumber *averageSelectedPerSet;
@property (strong, nonatomic) NSNumber *averageNumberOfWorkoutBuddies;

@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UILabel *totalNumberOfSelectedLabel;
@property (weak, nonatomic) IBOutlet UILabel *averageSelectedPerDayLabel;

@property (weak, nonatomic) IBOutlet UILabel *averageSelectedPerSetLabel;
@property (weak, nonatomic) IBOutlet UILabel *averageNumberOfPeerPressuredFlatironStudentsDoingSelectedWithYouLabel;

@end

@implementation StatsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.workouts = [[NSMutableArray alloc] init];
    self.picker.delegate = self;
    
    [self.pickerSegmentedControl addTarget:self
                                    action:@selector(measurementChanged)
               forControlEvents:UIControlEventValueChanged];
}

-(void)measurementChanged
{
    [self.picker reloadAllComponents];
}

-(NSArray *)muscleGroups
{
    if (!_muscleGroups) {
        
        FISMuscleGroup *trapezius = [[FISMuscleGroup alloc] initWithName:@"Trapezius" MuscleGroupImage:[UIImage imageNamed:@"Trapezius.png"]];
        FISMuscleGroup *bicepsBrachii = [[FISMuscleGroup alloc] initWithName:@"Biceps Brachii" MuscleGroupImage:[UIImage imageNamed:@"BicepsBrachii.png"]];
        FISMuscleGroup *deltoids = [[FISMuscleGroup alloc] initWithName:@"Deltoids" MuscleGroupImage:[UIImage imageNamed:@"Deltoid.png"]];
        FISMuscleGroup *externalObliques = [[FISMuscleGroup alloc] initWithName:@"External Obliques" MuscleGroupImage:[UIImage imageNamed:@"ExternalOblique.png"]];
        FISMuscleGroup *gluteusMaximus = [[FISMuscleGroup alloc] initWithName:@"Gluteus Maximus" MuscleGroupImage:[UIImage imageNamed:@"GluteusMaximus.png"]];
        FISMuscleGroup *latissimusDorsi = [[FISMuscleGroup alloc] initWithName:@"Latissimus Dorsi" MuscleGroupImage:[UIImage imageNamed:@"LatissimusDorsi.png"]];
        FISMuscleGroup *pectoralisMajor = [[FISMuscleGroup alloc] initWithName:@"Pectoralis Major" MuscleGroupImage:[UIImage imageNamed:@"PectoralisMajor.png"]];
        FISMuscleGroup *pectoralisMinor = [[FISMuscleGroup alloc] initWithName:@"Pectoralis Minor" MuscleGroupImage:[UIImage imageNamed:@"PectoralisMinor.png"]];
        FISMuscleGroup *rectusAbdominus = [[FISMuscleGroup alloc] initWithName:@"Rectus Abdominis" MuscleGroupImage:[UIImage imageNamed:@"RectusAbdominis.png"]];
        FISMuscleGroup *transverseAbdominus = [[FISMuscleGroup alloc] initWithName:@"Transverse Abdominis" MuscleGroupImage:[UIImage imageNamed:@"TransverseAbdominis.png" ]];
        FISMuscleGroup *vastusLateralis = [[FISMuscleGroup alloc] initWithName:@"Quadriceps" MuscleGroupImage:[UIImage imageNamed:@"VastusLateralis.png"]];
        
        
        _muscleGroups = [[NSMutableArray alloc] initWithArray:@[trapezius, vastusLateralis,gluteusMaximus,pectoralisMajor,pectoralisMinor, deltoids, bicepsBrachii, rectusAbdominus, transverseAbdominus, externalObliques, latissimusDorsi]]; //@"Hamstrings"@"Triceps", @"Erector Spinae"]];

    }
    
    return _muscleGroups;
}

-(void)setWorkouts:(NSMutableArray *)workouts
{
    _workouts = workouts;
}

-(NSMutableArray *)exercises
{
    if (!_exercises) {
        FISExercise *pushups = [[FISExercise alloc] initWithName:@"Pushups"];
        pushups.muscleGroups = [[NSMutableArray alloc] initWithArray: @[@"Pectoralis Major", @"Pectoralis Minor", @"Latissimus Dorsi"]];
        _exercises = [[NSMutableArray alloc] initWithArray:@[pushups]];
    }
    
    return _exercises;
}

- (void)updateUI
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setMaximumFractionDigits:2];
    [formatter setRoundingMode: NSNumberFormatterRoundUp];
    
    if ([self.workoutsOfSelected count] > 0) {
        self.totalNumberOfSelectedLabel.text = [formatter stringFromNumber:self.totalNumberOfSelected];
        self.averageSelectedPerDayLabel.text = [formatter stringFromNumber:self.averageSelectedPerDay];
        self.averageSelectedPerSetLabel.text = [formatter stringFromNumber:self.averageSelectedPerSet];
        self.averageNumberOfPeerPressuredFlatironStudentsDoingSelectedWithYouLabel.text = [formatter stringFromNumber: self.averageNumberOfWorkoutBuddies];
    }
    else {
        self.totalNumberOfSelectedLabel.text = @"0";
        self.averageSelectedPerDayLabel.text = @"0";
        self.averageSelectedPerSetLabel.text = @"0";
        self.averageNumberOfPeerPressuredFlatironStudentsDoingSelectedWithYouLabel.text = @"0";
    }
    
    [self.picker reloadAllComponents];
}


- (NSNumber *)totalNumberOfSelected
{
    return [self.workoutsOfSelected valueForKeyPath:@"@sum.reps"];
}

- (NSNumber *)averageSelectedPerDay
{
    NSArray *dates = [self.workoutsOfSelected valueForKeyPath:@"@distinctUnionOfObjects.computedDate"];
    
    NSNumber *countOfDays = [dates valueForKeyPath:@"@count"];
    
    return  @([self.totalNumberOfSelected floatValue]/[countOfDays floatValue]);
}

- (NSNumber *)averageSelectedPerSet
{
    NSNumber *countOfSets = [self.workoutsOfSelected valueForKeyPath:@"@sum.sets"];
    
    return @([self.totalNumberOfSelected floatValue]/[countOfSets floatValue]);
    
}

- (NSNumber *)averageNumberOfWorkoutBuddies
{
    NSNumber *countOfTotalWorkoutBuddies = [self.workoutsOfSelected valueForKeyPath:@"@sum.numberOfWorkoutBuddies"];
    NSNumber *countOfWorkouts = [self.workoutsOfSelected valueForKeyPath:@"@count"];
    
    return @([countOfTotalWorkoutBuddies floatValue]/[countOfWorkouts floatValue]);

}

-(NSMutableArray *)workoutsOfSelected
{
    
    NSUInteger pickerRow = [self.picker selectedRowInComponent:0];
    NSPredicate *workoutFilter;
    if (self.pickerSegmentedControl.selectedSegmentIndex == 0)
    {
        workoutFilter = [NSPredicate predicateWithFormat:@"exercise.name == %@", ((FISExercise *)self.exercises[pickerRow]).name];
    }
    else
    {
        //TODO: Get some predicate practice and fill this out to make your lab work!
        workoutFilter = [NSPredicate predicateWithFormat:@"ANY exercise.muscleGroups == %@",((FISMuscleGroup *)self.muscleGroups[pickerRow]).name];
    }
    
    NSArray *filteredWorkouts = [self.workouts filteredArrayUsingPredicate:workoutFilter];
    
    if (filteredWorkouts.count > 0) {
        _workoutsOfSelected = [[NSMutableArray alloc] initWithArray:filteredWorkouts];
    }
    else {
        _workoutsOfSelected = [[NSMutableArray alloc] init];
    }
    
    return _workoutsOfSelected;
}

-(void)addNewWorkout:(FISWorkout *)workout
{
    [self.workouts addObject:workout];
    [self updateUI];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    AddEntryViewController *addEntryVC = [segue destinationViewController];
    addEntryVC.delegate = self;
    [self.exercises insertObject:@"Add New Exercise" atIndex:0];
    addEntryVC.exercises = self.exercises;
    
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (self.pickerSegmentedControl.selectedSegmentIndex == 0) {
        return ((FISExercise *)self.exercises[row]).name;
    }
     else
    {
        return ((FISMuscleGroup *)self.muscleGroups[row]).name;

    }
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (self.pickerSegmentedControl.selectedSegmentIndex == 0) {
        return [self.exercises count];
    }
    else
    {
        return [self.muscleGroups count];
        
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [self updateUI];
}

@end
