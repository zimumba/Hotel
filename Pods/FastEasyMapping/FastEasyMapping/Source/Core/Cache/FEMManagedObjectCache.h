// For License please refer to LICENSE file in the root of FastEasyMapping project

#import <Foundation/Foundation.h>

@class FEMMapping, NSManagedObjectContext;

NS_ASSUME_NONNULL_BEGIN

@interface FEMManagedObjectCache : NSObject

@property (nonatomic, strong, readonly) NSManagedObjectContext *context;

- (instancetype)initWithMapping:(FEMMapping *)mapping representation:(id)representation context:(NSManagedObjectContext *)context;

- (nullable id)existingObjectForRepresentation:(id)representation mapping:(FEMMapping *)mapping;
- (nullable id)existingObjectForPrimaryKey:(id)primaryKey mapping:(FEMMapping *)mapping;

- (void)addExistingObject:(id)object mapping:(FEMMapping *)mapping;
- (NSDictionary *)existingObjectsForMapping:(FEMMapping *)mapping;

@end

NS_ASSUME_NONNULL_END