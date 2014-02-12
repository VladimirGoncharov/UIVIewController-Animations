#import <UIKit/UIKit.h>

@interface UINavigationController (PushAnimations)

/*!
 @code
 CATransition *transition = [CATransition animation];
 transition.duration = 0.75f;
 transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
 transition.type = kCATransitionPush;
 transition.subtype = kCATransitionFromTop;
 [self pushViewController:viewController
               transition:transition];
 @endcode
 */
- (void)pushViewController:(UIViewController *)viewController
                transition:(CATransition *)transition;

/*!
 @code
 CATransition *transition = [CATransition animation];
 transition.duration = 0.75f;
 transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
 transition.type = kCATransitionPush;
 transition.subtype = kCATransitionFromTop;
 [self popViewControllerWithTransition:transition];
 @endcode
 */
- (UIViewController *)popViewControllerWithTransition:(CATransition *)transition;
- (NSArray *)popToViewController:(UIViewController *)viewController
                      transition:(CATransition *)transition;
- (NSArray *)popToRootViewControllerWithTransition:(CATransition *)transition;

- (void)pushViewController:(UIViewController *)viewController
       animationTransition:(UIViewAnimationTransition)animationTransition
            animationCurve:(UIViewAnimationCurve)animationCurve
                  duration:(NSTimeInterval)duration;

- (UIViewController *)popViewControllerWithAnimationTransition:(UIViewAnimationTransition)animationTransition
                                                animationCurve:(UIViewAnimationCurve)animationCurve
                                                      duration:(NSTimeInterval)duration;
- (NSArray *)popToViewController:(UIViewController *)viewController
             animationTransition:(UIViewAnimationTransition)animationTransition
                  animationCurve:(UIViewAnimationCurve)animationCurve
                        duration:(NSTimeInterval)duration;
- (NSArray *)popToRootViewControllerWithAnimationTransition:(UIViewAnimationTransition)animationTransition
                                             animationCurve:(UIViewAnimationCurve)animationCurve
                                                   duration:(NSTimeInterval)duration;

@end




@interface UIViewController (ModalAnimations)

- (void)presentViewController:(UIViewController *)viewControllerToPresent
         modalTransitionStyle:(UIModalTransitionStyle)modalTransitionStyle
       modalPresentationStyle:(UIModalPresentationStyle)modalPresentationStyle
                   completion:(void (^)(void))completion NS_AVAILABLE_IOS(5_0);
- (void)presentViewController:(UIViewController *)viewControllerToPresent
         modalTransitionStyle:(UIModalTransitionStyle)modalTransitionStyle
       modalPresentationStyle:(UIModalPresentationStyle)modalPresentationStyle NS_DEPRECATED_IOS(2_0, 6_0);

- (void)dismissViewControllerWithModalTransitionStyle:(UIModalTransitionStyle)modalTransitionStyle
                               modalPresentationStyle:(UIModalPresentationStyle)modalPresentationStyle
                                           completion:(void (^)(void))completion NS_AVAILABLE_IOS(5_0);
- (void)dismissModalViewControllerWithModalTransitionStyle:(UIModalTransitionStyle)modalTransitionStyle
                                    modalPresentationStyle:(UIModalPresentationStyle)modalPresentationStyle NS_DEPRECATED_IOS(2_0, 6_0);

@end
