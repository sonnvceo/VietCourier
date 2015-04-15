//
//  MTStackViewController.h


#import <UIKit/UIKit.h>

@class MTStackViewController;
@class MTStackContainerView;
@class MTStackContentContainerView;

@protocol MTStackViewControllerDelegate <NSObject>

@optional
// Called when the left view controller is fully revealed, and panning ends.
- (void)stackViewController:(MTStackViewController *)stackViewController didRevealLeftViewController:(UIViewController *)viewController;

// Called when the content view controller is fully revealed, and panning ends.
- (void)stackViewController:(MTStackViewController *)stackViewController didRevealContentViewController:(UIViewController *)viewController;

// Called when the right view controller is fully revealed, and panning ends.
- (void)stackViewController:(MTStackViewController *)stackViewController didRevealRightViewController:(UIViewController *)viewController;

- (void) stackViewdisablezoomGesturesOnMap;
- (void) stackViewenablezoomGesturesOnMap;

@end

@interface MTStackViewController : UIViewController
{
    // This is the "main" pan gesture. If you subclass MTStackViewController and want to implment delegate methods
    // for the gesture recognizer, make sure you call super if you want the "built in" functionality.
    UIPanGestureRecognizer *_panGestureRecognizer;
}

// Represents the left most view controller on the "stack".
// Default: nil
@property (nonatomic, strong) UIViewController *leftViewController;

// Represents the right most view controller on the "stack".
// Default: nil
@property (nonatomic, strong) UIViewController *rightViewController;

// Represents the middle view controller on the "stack".
// Default: nil
@property (nonatomic, strong) UIViewController *contentViewController;

// Represends the left header view above the left view controller
// Default: nil
@property (nonatomic, strong) UIView *leftHeaderView;

// How far the content controller's X coordinate should be from point 0.0f (left to right)
// before the left controller should be considered revealed. This will automatically be
// converted for the right controller.
// Default: 80% of [UIScreen mainScreen]'s width.
@property (nonatomic, assign) CGFloat slideOffset;

// How far the left header's x origin should be before the parallax animation is started
@property (nonatomic, assign) CGFloat headerSlideOffset;

// How long the animation should take between states.
// Default: 0.3f
@property (nonatomic, assign) CGFloat slideAnimationDuration;

// How long the animation should take when a pan gesture is recognized.
// This animation is used when a horizontal pan gesture is detected to make the content view
// animate to the new offset
// Default: 0.05f
@property (nonatomic, assign) CGFloat trackingAnimationDuration;

// Whether the reveal or hide animation duration speeds up if the content controller is
// partially closed
// Default: NO
@property (nonatomic, assign) BOOL animationDurationProportionalToPosition;

// Minimum shadow radius for the content controller's view.
// Default: 3.0f
@property (nonatomic, assign) CGFloat minShadowRadius;

// Maximum shadow radius for the content controller's view.
// Default: 10.0f
@property (nonatomic, assign) CGFloat maxShadowRadius;

// Minimum shadow opacity for the content controller's view.
// Default: 0.5f
@property (nonatomic, assign) CGFloat minShadowOpacity;

// Maximum shadow opacity for the content controller's view.
// Default: 1.0f
@property (nonatomic, assign) CGFloat maxShadowOpacity;

// Shadow offset for the content controller's view.
// Default: CGSizeZero
@property (nonatomic, assign) CGSize shadowOffset;

// Shadow color for the content controller's view.
// Default: [UIColor blackColor]
@property (nonatomic, copy) UIColor *shadowColor;

// The position at which the content view controller hides/closes the left controller
// Default: Half the size of the content view controller
@property (nonatomic, assign) CGFloat leftSnapThreshold;

// Rasterizes views during animation when set to YES. Imporoves general performance.
// Default: YES
@property (nonatomic, assign) BOOL rasterizesViewsDuringAnimation;

// Overlay color for the left view controller's view when out of focus.
// Default: [UIColor blackColor]
@property (nonatomic, copy) UIColor *leftViewControllerOverlayColor;

// Overlay color for the right view controller's view when out of focus.
// Default: [UIColor blackColor]
@property (nonatomic, copy) UIColor *rightViewControllerOverlayColor;

// NSArray of class objects which should prevent panning. These objects must be UIView class objects.
// Default: nil
@property (nonatomic, copy) NSArray *noSimultaneousPanningViewClasses;

// When the touch is moving at the velocity, count that as a swipe
// Default: 500.0f;
@property (nonatomic, assign) CGFloat swipeVelocity;

// Enable parallax of left view controller
// Defaults: YES
@property (nonatomic, assign, getter = isLeftControllerParallaxEnabled) BOOL leftControllerParallaxEnabled;

// Enable parallax of right view controller
// Defaults: YES
@property (nonatomic, assign, getter = isRightControllerParallaxEnabled) BOOL rightControllerParallaxEnabled;

// Enables panning to reveal the left view controller.
// Default: YES
@property (nonatomic, assign, getter = isLeftViewControllerEnabled) BOOL leftViewControllerEnabled;

// Enables panning to reveal the right view controller.
// Default: NO
@property (nonatomic, assign, getter = isRightViewControllerEnabled) BOOL rightViewControllerEnabled;

// returns YES if the left view controller is fully visible and panning has ended.
@property (nonatomic, readonly, getter = isLeftViewControllerVisible) BOOL leftViewControllerVisible;

// returns YES if the right view controller is fully visible and panning has ended.
@property (nonatomic, readonly, getter = isRightViewControllerVisible) BOOL rightViewControllerVisible;

// When drilled into a UINavigationController and exposing the menus, user interaction will be disabled to prevent bar button item presses
// Default: NO
@property (nonatomic, assign) BOOL disableNavigationBarUserInterationWhenDrilledDown;

// When set to YES, if the content view controller is a UINavigationController who has > 1 view controller, swiping will be disabled.
// Default: NO
@property (nonatomic, assign) BOOL disableSwipeWhenContentNavigationControllerDrilledDown;

// Transition duration between changing content view controllers
// Default: 0.0
@property (nonatomic, assign) NSTimeInterval contentViewControllerAnimationDuration;

// Animation option for setting content view controller
// Default: 0
@property (nonatomic, assign) NSInteger contentViewControllerAnimationOption;

@property (nonatomic, retain) id <MTStackViewControllerDelegate> delegate;
@property (nonatomic, retain) id <MTStackViewControllerDelegate> delegate2;

//- (id) setDelegateValue:(MTStackViewControllerDelegate*) del;
// Sets the contentViewController, and will optionally hide the left view controller if it is visible.
// DEPRECATED - use setContentViewController:snapToContentViewController:animated:
- (void)setContentViewController:(UIViewController *)contentViewController hideLeftViewController:(BOOL)hideLeftViewController animated:(BOOL)animated __deprecated;

// Sets the contentViewController, and will optionally hide the left or right view controller, if one of them is visible.
- (void)setContentViewController:(UIViewController *)contentViewController snapToContentViewController:(BOOL)snapToContentViewController animated:(BOOL)animated;

- (void)revealLeftViewControllerAnimated:(BOOL)animated;
- (void)revealLeftViewController;
- (void)hideLeftViewControllerAnimated:(BOOL)animated;
- (void)hideLeftViewController;
- (void)toggleLeftViewController:(id)sender event:(UIEvent *)event;
- (void)toggleLeftViewControllerAnimated:(BOOL)animated;
- (void)toggleLeftViewController;

- (void)revealRightViewControllerAnimated:(BOOL)animated;
- (void)revealRightViewController;
- (void)hideRightViewControllerAnimated:(BOOL)animated;
- (void)hideRightViewController;
- (void)toggleRightViewController:(id)sender event:(UIEvent *)event;
- (void)toggleRightViewControllerAnimated:(BOOL)animated;
- (void)toggleRightViewController;

@end

@protocol MTStackChildViewController <NSObject>

// If NO is returned on a child view controller of the stack view controller, panning will be disabled.
@property (nonatomic, readonly) BOOL shouldAllowPanning;

@optional

- (void)stackViewControllerWillBeginPanning:(MTStackViewController *)stackViewController;
- (void)stackViewControllerDidEndPanning:(MTStackViewController *)stackViewController;
- (void)stackViewController:(MTStackViewController *)stackViewController didPanToOffset:(CGFloat)offset;

@end

@interface UIViewController (MTStackViewController)

// This will return the child view controllers parent stack view controller
@property (nonatomic, readonly) MTStackViewController *stackViewController;

@end
