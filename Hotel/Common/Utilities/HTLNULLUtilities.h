@import Foundation;

#define isObjectEmpty( obj ) \
	(obj == nil || [obj isEqual:[NSNull null]])

#define objectOrNil( obj ) \
	([obj isEqual:[NSNull null]] ? nil : obj)

#define isStringEmpty( string ) \
	(isObjectEmpty(string) || ((NSString *)string).length == 0)

#define CGFloatIsEqualToFloat( first, second ) \
	(fabs(first - second) < 0.0000001)