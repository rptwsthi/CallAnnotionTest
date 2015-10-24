//
//  ViewController.h
//  MapTest
//
//  Created by Developer on 24/10/15.
//  Copyright (c) 2015 Technologies33. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewAnnotation : NSObject <MKAnnotation>
{
    CLLocationCoordinate2D coordinate;
    NSString *mTitle;
    NSString *mSubTitle;
}

@property (nonatomic, retain) NSString *mTitle;
@property (nonatomic, retain) NSString *mSubTitle;
-(id)initWithLocation:(CLLocationCoordinate2D)location withTitle:(NSString *)title withSubTitle:(NSString *)subTitle withImage:(UIImage *)locationImage;
@end

@interface ViewController : UIViewController


@end

