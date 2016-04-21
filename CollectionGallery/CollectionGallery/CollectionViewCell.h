//
//  CollectionViewCell.h
//  CollectionGallery
//
//  Created by Blaze Dream on 05/04/16.
//  Copyright © 2016 Blaze Dream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell<UIScrollViewDelegate>

@property(strong,nonatomic) IBOutlet UIScrollView* bgScrollView;
@property(strong,nonatomic) IBOutlet UIImageView* productImage;
@property(strong,nonatomic) IBOutlet NSLayoutConstraint* productImageHeightConst;

@end
