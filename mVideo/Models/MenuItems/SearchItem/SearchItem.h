//
//  SearchItem.h
//  mVideo
//
//  Created by Nguyen Xuan Tho on 8/4/16.
//  Copyright © 2016 IVC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchItem : NSObject

@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, readonly) BOOL selectable;

- (instancetype)initSearchItemWithName:(NSString *)name andSelectable:(BOOL)selectable;

@end
