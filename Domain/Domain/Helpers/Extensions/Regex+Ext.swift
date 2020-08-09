//
//  Regex+Ext.swift
//  Domain
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation

extension NSRegularExpression {

    convenience init(_ pattern: String) {
        do {
            try self.init(pattern: pattern)
        } catch {
            preconditionFailure("\(L10n.RegularExpression.Error.illegal) \(pattern).")
        }
    }

    func matches(_ string: String) -> Bool {
        let range = NSRange(location: 0, length: string.utf16.count)
        return firstMatch(in: string, options: [], range: range) != nil
    }
}

extension String {

    static let atLeastOneLowercaseLetter = ".*[a-z]+.*"

    static let atLeastOneLetter = ".*[a-zA-Z]+.*"
    static let email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    static let cellphone = "^[1-9]{2}[0-9]{9}$"
    static let maskedCellphone = "^\\([1-9]{2}\\) [0-9] [0-9]{4} [0-9]{4}$"
    static let maskedBrazilianCellphone = "^\\([1-9]{2}\\) [0-9] [0-9]{4}-[0-9]{4}$"
    static let name = "^[A-Za-záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+$"

    static func ~= (lhs: String, rhs: String) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: rhs) else { return false }
        let range = NSRange(location: 0, length: lhs.utf16.count)
        return regex.firstMatch(in: lhs, options: [], range: range) != nil
    }
}
