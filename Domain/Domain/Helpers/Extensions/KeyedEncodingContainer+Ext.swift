//
//  KeyedEncodingContainer+Ext.swift
//  Domain
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {

    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }

    enum Enconding {
        case png
        case jpeg(JPEGQuality)
    }

    func jpeg(_ quality: JPEGQuality) -> Data? {
        return jpegData(compressionQuality: quality.rawValue)
    }

    func asData(enconding: Enconding = .png) -> Data? {
        switch enconding {
        case .png:
            return pngData()
        case .jpeg(let quality):
            return jpeg(quality)
        }
    }
}

extension Data {

    var asImage: UIImage? {
        return UIImage(data: self)
    }
}

extension KeyedEncodingContainer {

    mutating func encode(_ value: UIImage,
                         forKey key: KeyedEncodingContainer.Key,
                         enconding: UIImage.Enconding = .png) throws {
        let imageData: Data! = value.asData(enconding: enconding)
        try encode(imageData, forKey: key)
    }

}

extension KeyedDecodingContainer {

    public func decode(_ type: UIImage.Type, forKey key: KeyedDecodingContainer.Key) throws -> UIImage {
        let imageData = try decode(Data.self, forKey: key)
        if let image = UIImage(data: imageData) {
            return image
        } else {
            throw InteractionError.failedRequest("Não foi possível obter a imagem")
        }
    }

    public func decodeIfPresent(_ type: UIImage.Type, forKey key: KeyedDecodingContainer.Key) throws -> UIImage? {
        let data = try decode(Data.self, forKey: key)
        guard let image = data.asImage else {
            return nil
        }
        return image
    }
}
