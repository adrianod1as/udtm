//
//  Encodable+Extensions.swift
//  Domain
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation
import SwiftyJSON

extension Encodable {

    public var data: Data? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        return data
    }

    public var json: JSON {
        guard let jsonFromData = JSON.nonNullableJson(data: data) else {
            return .null
        }
        return jsonFromData
    }

    public var rawObject: [String: Any]? {
        return json.dictionaryObject
    }

}

extension Data {

    public func decode<T: Decodable>(_ decodableType: T.Type) -> T? {
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode(decodableType, from: self)
            return result
        } catch let error as NSError {
            debugPrint(error.description)
            return nil
        }
    }
}
