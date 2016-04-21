//
//  CollectionViewCell.m
//  CollectionGallery
//
//  Created by Blaze Dream on 05/04/16.
//  Copyright © 2016 Blaze Dream. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (void)awakeFromNib {
    _bgScrollView.delegate = self;
    _bgScrollView.zoomScale = 1.0;
    _bgScrollView.minimumZoomScale = 1.0;
    _bgScrollView.maximumZoomScale = 2.0;
    _bgScrollView.showsHorizontalScrollIndicator = NO;
    _bgScrollView.showsVerticalScrollIndicator = NO;

}

- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return [scrollView viewWithTag:1];
}


@end
