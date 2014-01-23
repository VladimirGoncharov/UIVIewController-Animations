//
//  UINavigationController+Animations.m
//  OrderProduct
//
//  Created by admin on 23.01.14.
//  Copyright (c) 2014 flatstack. All rights reserved.
//

#import "UIViewController+Animations.h"

static inline void perfomTransition(UIView *view,
                                    CATransition *transition,
                                    void(^action)())
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [view.layer addAnimation:transition forKey:nil];
        
        if (action)
            action();
    });
}

static inline void perfomAnimation(UIView *view,
                                   UIViewAnimationTransition animationTransition,
                                   UIViewAnimationCurve animationCurve,
                                   NSTimeInterval duration,
                                   void(^action)())
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:duration];
        [UIView setAnimationTransition:animationTransition
                               forView:view
                                 cache:NO];
        if (action)
            action();
        
        [UIView commitAnimations];
    });
}

@implementation UINavigationController (Animations)

#pragma mark - 
#pragma mark - TRANSITION

#pragma mark - push

- (void)pushViewController:(UIViewController *)viewController
                transition:(CATransition *)transition
{
    __weak typeof(self) wself           = self;
    perfomTransition(self.view, transition, ^{
        [wself pushViewController:viewController
                         animated:NO];
    });
}

#pragma mark - pop

- (UIViewController *)popViewControllerWithTransition:(CATransition *)transition
{
    __block UIViewController *result    = nil;
    
    __weak typeof(self) wself           = self;
    perfomTransition(self.view, transition, ^{
        result  = [wself popViewControllerAnimated:NO];
    });
    
    return result;
}

- (NSArray *)popToViewController:(UIViewController *)viewController
                      transition:(CATransition *)transition
{
    __block NSArray *result             = nil;
    
    __weak typeof(self) wself           = self;
    perfomTransition(self.view, transition, ^{
        result  = [wself popToViewController:viewController
                                    animated:NO];
    });
    
    return result;
}

- (NSArray *)popToRootViewControllerWithTransition:(CATransition *)transition
{
    __block NSArray *result             = nil;
    
    __weak typeof(self) wself           = self;
    perfomTransition(self.view, transition, ^{
        result  = [wself popToRootViewControllerAnimated:NO];
    });
    
    return result;
}

#pragma mark -
#pragma mark - VIEW ANIMATION

#pragma mark - push

- (void)pushViewController:(UIViewController *)viewController
       animationTransition:(UIViewAnimationTransition)animationTransition
            animationCurve:(UIViewAnimationCurve)animationCurve
                  duration:(NSTimeInterval)duration
{
    __weak typeof(self) wself           = self;
    perfomAnimation(self.view, animationTransition, animationCurve, duration, ^{
        [wself pushViewController:viewController animated:NO];
    });
}

#pragma mark - pop

- (UIViewController *)popViewControllerWithAnimationTransition:(UIViewAnimationTransition)animationTransition
                                                animationCurve:(UIViewAnimationCurve)animationCurve
                                                      duration:(NSTimeInterval)duration
{
    __block UIViewController *result    = nil;
    
    __weak typeof(self) wself           = self;
    perfomAnimation(self.view, animationTransition, animationCurve, duration, ^{
        result  = [wself popViewControllerAnimated:NO];
    });
    
    return result;
}

- (NSArray *)popToViewController:(UIViewController *)viewController
             animationTransition:(UIViewAnimationTransition)animationTransition
                  animationCurve:(UIViewAnimationCurve)animationCurve
                        duration:(NSTimeInterval)duration
{
    __block NSArray *result         = nil;
    
    __weak typeof(self) wself       = self;
    perfomAnimation(self.view, animationTransition, animationCurve, duration, ^{
        result  = [wself popToViewController:viewController
                                    animated:NO];
    });
    
    return result;
}

- (NSArray *)popToRootViewControllerWithAnimationTransition:(UIViewAnimationTransition)animationTransition
                                             animationCurve:(UIViewAnimationCurve)animationCurve
                                                   duration:(NSTimeInterval)duration
{
    __block NSArray *result         = nil;
    
    __weak typeof(self) wself       = self;
    perfomAnimation(self.view, animationTransition, animationCurve, duration, ^{
        result  = [wself popToRootViewControllerAnimated:NO];
    });
    
    return result;
}

@end




@implementation UIViewController (ModalAnimations)

#pragma mark -
#pragma mark - PRESENT

- (void)presentViewController:(UIViewController *)viewControllerToPresent
         modalTransitionStyle:(UIModalTransitionStyle)modalTransitionStyle
       modalPresentationStyle:(UIModalPresentationStyle)modalPresentationStyle
                   completion:(void (^)(void))completion
{
    self.modalPresentationStyle     = modalPresentationStyle;
    self.modalTransitionStyle       = modalTransitionStyle;
    
    [self presentViewController:viewControllerToPresent
                       animated:YES
                     completion:completion];
}

- (void)presentViewController:(UIViewController *)viewControllerToPresent
         modalTransitionStyle:(UIModalTransitionStyle)modalTransitionStyle
       modalPresentationStyle:(UIModalPresentationStyle)modalPresentationStyle
{
    self.modalPresentationStyle     = modalPresentationStyle;
    self.modalTransitionStyle       = modalTransitionStyle;
    
    [self presentModalViewController:viewControllerToPresent
                            animated:YES];
}

#pragma mark -
#pragma mark - DISMISS

- (void)dismissViewControllerWithModalTransitionStyle:(UIModalTransitionStyle)modalTransitionStyle
                               modalPresentationStyle:(UIModalPresentationStyle)modalPresentationStyle
                                           completion:(void (^)(void))completion
{
    self.modalPresentationStyle     = modalPresentationStyle;
    self.modalTransitionStyle       = modalTransitionStyle;
    
    [self dismissViewControllerAnimated:YES
                             completion:completion];
}

- (void)dismissModalViewControllerWithModalTransitionStyle:(UIModalTransitionStyle)modalTransitionStyle
                                    modalPresentationStyle:(UIModalPresentationStyle)modalPresentationStyle
{
    self.modalPresentationStyle     = modalPresentationStyle;
    self.modalTransitionStyle       = modalTransitionStyle;
    
    [self dismissModalViewControllerAnimated:YES];
}

@end
