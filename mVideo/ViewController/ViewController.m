//
//  ViewController.m
//  PP
//
//  Created by Nguyen Tran on 7/7/16.
//  Copyright © 2016 IVC. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [BLEHelper sharedInstance];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    [self performSelector:@selector(startService) withObject:nil afterDelay:1];
}
//- (void)startService
//{
//    [[BLEHelper sharedInstance] stop_timeout_timer];
//    [[BLEHelper sharedInstance] start_watch_app_synchronization_foreground];
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark TableView Methods

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    // Remove seperator inset
//    [cell prepareDisclosureIndicator];
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        cell.separatorInset = UIEdgeInsetsZero;
    }
    
    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        cell.preservesSuperviewLayoutMargins = NO;
    }
    
    // Set layout margins to zero
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        cell.layoutMargins = UIEdgeInsetsZero;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StaticCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"StaticCell"];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        cell.backgroundColor=[UIColor yellowColor];
    }
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = NSLocalizedString(@"BLE Dashboard", nil);
            break;
        case 1:
            cell.textLabel.text = NSLocalizedString(@"Weather Dashboard", nil);
            break;
        case 2:
            cell.textLabel.text = NSLocalizedString(@"Log3D Dashboard", nil);
            break;
        case 3:
            cell.textLabel.text = NSLocalizedString(@"SNS Dashboard", nil);
            break;
        case 4:
            cell.textLabel.text = NSLocalizedString(@"Shutter Dashboard", nil);
            break;
        case 5:
            cell.textLabel.text = NSLocalizedString(@"PositionInfo Dashboard", nil);
            break;
            
        default:
            break;
    }
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [self.navigationController performSegueWithIdentifier:@"toBLEView" sender:self];
            break;
        case 1:
            [self.navigationController performSegueWithIdentifier:@"toWeatherView" sender:self];
            break;
        case 2:
//            [self.navigationController performSegueWithIdentifier:@"toMapDetailView" sender:self];
            // Testing only
//            [self.navigationController performSegueWithIdentifier:@"toMapView" sender:self];
            [self.navigationController performSegueWithIdentifier:@"toMap2DView" sender:self];
            //[self.navigationController performSegueWithIdentifier:@"toMapSquare" sender:self];
            break;
        case 3:
            //start SNS, don't implement in prototype
            break;
        case 4:
            //start camera;
            //TODO
            break;
        case 5:
            [self.navigationController performSegueWithIdentifier:@"toPositionInfoView" sender:self];
            break;
            
        default:
            break;
    }

    
}
@end
