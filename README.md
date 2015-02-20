---
  tags: UICollectionView
  languages: objc
---

Muscle Collection
=======

### Goals 

- Get practice with `UICollectionView`

### Objective 

- Time to make our exercise logger a little prettier. Using a `UICollectionView` and the provided muscle group images, update your `AddExerciseViewController` to use a more visual format for selecting relevant muscle groups. 

- Work in a little more NSPredicate practice.

## Instructions

Add a `UICollectionView` to your `AddExerciseViewController`. Your fellow programmer has already done the heavy lifting of removing the old picker view from the `Storyboard` so that you don't have to clean anything up first. 

Make sure that the prototype `UICollectionViewCell` has both a `UIImageView` and a `UILabel`. The UIImageView should be the full width and height of the `UICollectionViewCell`. If you have already learned how to use Autolayout, we recommend you tie it to the edges this way. Similarly the label should be the width of cell. It's height may be determined via its intrinsic size because you will want this `UILabel` to wrap (remember how to setup a `UILabel` to properly word wrap?). Set it's typeface to 14 points for the time-being. The `UIImageView` will show the `image` property of the `FISMuscleGroup`, and the `UILabel` on it will be the `name` property of the `FISMuscleGroup` being displayed.

Now add the appropriate delegate methods to your `AddExerciseViewController` for the `UICollectionView`. You'll want your edge insets to be 11 on all sides. And the size for your item at each index path should be 1/6 the width and height of the original `UIImage` for the `FISMuscleGroup`.

Additional information that you may find useful:

In order to make your cells appear to be selected when you click on them, you'll want to use the delegate methods for a `UICollectionView` that support selection and deselection, and change the `alpha` property of the `UIImageView` to 0.5 when not selected and 1.0 when selected. You will also want to use these methods to ensure that your new exercise correctly contains the right `FISMuscleGroup`s it is associated with. (Think: What if they accidentally click on a cell and then realize that crunches are not associated with the bicep?)

Lastly, on your `StatsViewController`, you'll find a comment where you will want to add an NSPredicate so that the `workoutsOfSelected` is filtered correctly.

## Hints

In order to make your labels a little easier to read over the images, you may want to use this special property of a UIColor: `colorWithAlphaComponent`. Go look it up.

Remember - your collection view should allow Multiple Selection. (Hmm...why did I capitalize the last two words of that sentence?)



