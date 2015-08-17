#include <ShareKore.h>
#import <UIKit/UIKit.h>

namespace ShareKore {

	void share(const char* subject, const char* body, const char* url, bool attachScreenshot) {	
        
        UIWindow *window = [[[UIApplication sharedApplication] windows] objectAtIndex:0];

        UIImage *image;
        if (attachScreenshot) {
            if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
                UIGraphicsBeginImageContextWithOptions(window.bounds.size, NO, [UIScreen mainScreen].scale);
            else
                UIGraphicsBeginImageContext(window.bounds.size);

            [window drawViewHierarchyInRect:window.bounds afterScreenUpdates:YES];

            image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
        }

        NSString *stext = [[NSString alloc] initWithUTF8String:body];
        NSURL *surl = [NSURL URLWithString:[[NSString alloc] initWithUTF8String:url]];
        
        NSArray *itemsToShare;
        if (attachScreenshot) {
            itemsToShare = @[stext, surl, image];
        }
        else {
            itemsToShare = @[stext, surl];
        }

        UIActivityViewController *activityVC = [[UIActivityViewController alloc]
            initWithActivityItems:itemsToShare
            applicationActivities:nil];
        
        [activityVC setValue:[[NSString alloc] initWithUTF8String:subject] forKey:@"subject"];

        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            // Required for iPad
            activityVC.popoverPresentationController.sourceView = [[UIApplication sharedApplication] keyWindow];

            // Remove arrow from action sheet
            [activityVC.popoverPresentationController setPermittedArrowDirections:0];

            // Set action sheet to middle of view
            activityVC.popoverPresentationController.sourceRect = [[UIApplication sharedApplication] keyWindow].frame;
        }

        /*activityVC.excludedActivityTypes = @[UIActivityTypeAddToReadingList,
                                             UIActivityTypeCopyToPasteboard,
                                             UIActivityTypePrint,
                                             UIActivityTypeAssignToContact,
                                             UIActivityTypeSaveToCameraRoll,
                                             UIActivityTypeAddToReadingList,
                                             //UIActivityTypeMail,
                                             UIActivityTypeAirDrop];*/

        UIViewController *shareVC;
        shareVC = [[UIViewController alloc] init];
        [window addSubview:shareVC.view];
        [shareVC presentViewController:activityVC animated:YES completion:nil];
	
        [activityVC setCompletionHandler:^(NSString *activityType, BOOL completed)
        {
            [shareVC.view removeFromSuperview];
        }];
    }
}
