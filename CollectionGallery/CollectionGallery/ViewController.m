//
//  ViewController.m
//  CollectionGallery
//
//  Created by Blaze Dream on 05/04/16.
//  Copyright © 2016 Blaze Dream. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"

@interface ViewController ()
{
    UICollectionView *_collectionView;
    NSMutableArray *imgarr;
    CGFloat screenHeight,screenWidth;
    NSIndexPath *path;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    imgarr = [[NSMutableArray alloc]initWithObjects:@"rats.png",@"apple.jpg",@"dogs.png",@"lights.png",@"bluewater.png", nil];
    if (path == nil) {
        path = [NSIndexPath indexPathForItem:2 inSection:0];
    }
    screenWidth = self.view.frame.size.width;
    screenHeight = self.view.frame.size.height;
    [self createCollectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createCollectionView
{
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    _collectionView=[[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
    _collectionView.pagingEnabled = true;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    [_collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"mycell"];
   // [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [_collectionView setBackgroundColor:[UIColor redColor]];
    
    [self.view addSubview:_collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return imgarr.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"mycell" forIndexPath:indexPath];
    cell.productImageHeightConst.constant = screenHeight-62;
    cell.productImage.image = [UIImage imageNamed:[imgarr objectAtIndex:indexPath.item]];
    cell.productImage.contentMode = UIViewContentModeScaleAspectFit;
    cell.bgScrollView.delegate = cell;
    cell.bgScrollView.zoomScale = 1.0;
    cell.bgScrollView.contentSize = CGSizeMake(screenWidth, screenHeight/2);
    [cell.bgScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    //[self collectionView:_selectedCollectionView didSelectItemAtIndexPath:path];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(screenWidth, screenHeight);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    path = indexPath;
}

#pragma mark - Device Orientation
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    screenWidth = [[UIScreen mainScreen]bounds].size.width;
    screenHeight = [[UIScreen mainScreen]bounds].size.height;
    
    if (_collectionView != nil) {
        [_collectionView removeFromSuperview];
    }
    
    [self createCollectionView];
    [_collectionView reloadData];
    
    [self performSelector:@selector(PageContrlEvent:) withObject:path afterDelay:0.5];
    //[self PageContrlEvent:path];
}

#pragma mark - PageControllerEvent
- (void)PageContrlEvent:(NSIndexPath*)sender
{
    // update the scroll view to the appropriate page
    CGRect frame;
    frame.origin.x = _collectionView.frame.size.width * sender.item;
    frame.origin.y = 0;
    frame.size = _collectionView.frame.size;
    [_collectionView scrollRectToVisible:frame animated:YES];
}




@end
