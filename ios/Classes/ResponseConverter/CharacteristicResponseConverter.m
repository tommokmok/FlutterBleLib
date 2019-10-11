#import "CharacteristicResponseConverter.h"
#import "CharacteristicResponse.h"
#import "JSONStringifier.h"

@implementation CharacteristicResponseConverter

const NSString *keyServiceUUID = @"serviceUuid";
const NSString *keyServiceID = @"serviceId";
const NSString *keyCharacteristic = @"characteristic";

const NSString *keyCharacteristicResponseUUID = @"characteristicUuid";
const NSString *keyCharacteristicResponseId = @"id";
const NSString *keyIsIndicatable = @"isIndicatable";
const NSString *keyIsNotifiable = @"isNotifiable";
const NSString *keyIsNotifying = @"isNotifying";
const NSString *keyIsReadable = @"isReadable";
const NSString *keyIsWritableWithResponse = @"isWritableWithResponse";
const NSString *keyIsWritableWithoutResponse = @"isWritableWithoutResponse";
const NSString *keyValue = @"value";

+ (NSString *)jsonStringFromCharacteristicResponse:(NSDictionary *)characteristicResponse {
    NSDictionary *result = [[NSDictionary alloc] initWithObjectsAndKeys:
                            [characteristicResponse objectForKey:CHARACTERISTIC_RESPONSE_SERVICE_UUID], keyServiceUUID,
                            [characteristicResponse objectForKey:CHARACTERISTIC_RESPONSE_SERVICE_ID], keyServiceID,
                            [self characteristicDictionaryFromCharacteristicResponse:characteristicResponse], keyCharacteristic,
                            nil];

    return [JSONStringifier jsonStringFromJSONObject:result];
}

+ (NSDictionary *)characteristicDictionaryFromCharacteristicResponse:(NSDictionary *)characteristicResponse {
    NSDictionary *characteristic = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [characteristicResponse objectForKey:CHARACTERISTIC_RESPONSE_UUID], keyCharacteristicResponseUUID,
                                    [characteristicResponse objectForKey:CHARACTERISTIC_RESPONSE_ID], keyCharacteristicResponseId,
                                    [characteristicResponse objectForKey:CHARACTERISTIC_RESPONSE_IS_READABLE], keyIsReadable,
                                    [characteristicResponse objectForKey:CHARACTERISTIC_RESPONSE_IS_WRITABLE_WITH_RESPONSE], keyIsWritableWithResponse,
                                    [characteristicResponse objectForKey:CHARACTERISTIC_RESPONSE_IS_WRITABLE_WITHOUT_RESPONSE], keyIsWritableWithoutResponse,
                                    [characteristicResponse objectForKey:CHARACTERISTIC_RESPONSE_IS_NOTIFIABLE], keyIsNotifiable,
                                    [characteristicResponse objectForKey:CHARACTERISTIC_RESPONSE_IS_NOTIFYING], keyIsNotifying,
                                    [characteristicResponse objectForKey:CHARACTERISTIC_RESPONSE_IS_INDICATABLE], keyIsIndicatable,
                                    [characteristicResponse objectForKey:CHARACTERISTIC_RESPONSE_VALUE], keyValue,
                                    nil];
    return characteristic;
}

@end