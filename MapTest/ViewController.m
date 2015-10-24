//
//  ViewController.m
//  MapTest
//
//  Created by Developer on 24/10/15.
//  Copyright (c) 2015 Technologies33. All rights reserved.
//

#import "ViewController.h"


NSInteger const kMapSpan = 0.005f;

@implementation MapViewAnnotation
@synthesize coordinate;
@synthesize mTitle,mSubTitle;

-(id)initWithLocation:(CLLocationCoordinate2D)location withTitle:(NSString *)title withSubTitle:(NSString *)subTitle withImage:(UIImage *)locationImage {
    coordinate.latitude = location.latitude;
    coordinate.longitude = location.longitude;
    mTitle = title;
    mSubTitle = subTitle;
    return self;
}

-(NSString *)title {
    return mTitle;
}

-(NSString *)subtitle {
    return mSubTitle;
}

@end

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *buttonTouched;
- (IBAction)buttonTouched:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self reloadRestautantOnMap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Annotation
- (void) reloadRestautantOnMap {
    //remove previous ones
    [self.mapView removeAnnotations:[self.mapView annotations]];
    
//    for (NSDictionary *restaurant in _restaurantArray)
//        [self dropRestaurantPin:restaurant];
    [self dropRestaurantPin];
}

- (void) dropRestaurantPin {
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(40.725047, -73.981207);
    
    MapViewAnnotation *annot = [[MapViewAnnotation alloc] initWithLocation:coordinate withTitle:@"Hola!" withSubTitle:@"40.725047,-73.981207" withImage:nil];
    [self.mapView addAnnotation:annot];
    annot = nil;
}

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>) annotation {
    if (mapView.userLocation != annotation) {
        MKPinAnnotationView *annView=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"currentloc"];
        annView.pinColor = MKPinAnnotationColorPurple;
        annView.animatesDrop=TRUE;
        annView.canShowCallout = YES;
        annView.calloutOffset = CGPointMake(-9, 0);
        return annView;
    }
    return nil;
}

- (IBAction)buttonTouched:(id)sender {
    [_mapView showAnnotations:[self.mapView annotations] animated:YES];
    [self performSelector:@selector(showAnnotationCallOut) withObject:nil afterDelay:1.0f];
}

- (void) showAnnotationCallOut {
    [_mapView setSelectedAnnotations:@[[[self.mapView annotations] lastObject]]];
}

@end