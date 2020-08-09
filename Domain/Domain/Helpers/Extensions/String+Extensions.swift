//
//  String+Extensions.swift
//  Domain
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import UIKit

public extension String {

    func leftPadding(toLength length: Int, withPad character: Character) -> String {
        if self.count < length {
            return String(repeating: character, count: length - self.count) + self
        } else {
            return String(self.suffix(length))
        }
    }

    var digits: [UInt8] {
        return map(String.init).compactMap(UInt8.init)
    }

    var djb2hash: Int {
        let unicodeScalars = self.unicodeScalars.map { $0.value }
        return unicodeScalars.reduce(5381) {
            ($0 << 5) &+ $0 &+ Int($1)
        }
    }

}

public extension String {

    var noWhiteSpaces: String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }

    var words: [String] {
        return self.noWhiteSpaces.components(separatedBy: " ")
    }

    var numbers: [Int] {
        return compactMap({ $0.wholeNumberValue })
    }

    var isRepeating: Bool {
        return Set(self).count == 1
    }

    var isValidCPF: Bool {
        let cpf = self.numbers.string
        guard cpf.count == 11, !cpf.isRepeating else {
            return false
        }
        var start = cpf.index(cpf.startIndex, offsetBy: 9)
        var end = cpf.index(cpf.startIndex, offsetBy: 10)
        var range = start..<end

        let d1 = Int(cpf[range])

        start = cpf.index(cpf.startIndex, offsetBy: 10)
        end = cpf.index(cpf.startIndex, offsetBy: 11)
        range = start..<end

        let d2 = Int(cpf[range])

        var temp1 = 0, temp2 = 0

        for i in 0...8 {

            start = cpf.index(cpf.startIndex, offsetBy: i)
            end = cpf.index(cpf.startIndex, offsetBy: i + 1)
            range = start..<end

            let char = Int(cpf[range])

            temp1 += char! * (10 - i)
            temp2 += char! * (11 - i)

        }

        temp1 %= 11
        temp1 = temp1 < 2 ? 0 : 11-temp1

        temp2 += temp1 * 2
        temp2 %= 11
        temp2 = temp2 < 2 ? 0 : 11-temp2

        return temp1 == d1 && temp2 == d2
    }

    var isValidCNPJ: Bool {
        let cnpj = self.digits.string
        guard cnpj.count == 14, !cnpj.isRepeating, let numero = Int(cnpj), numero > 0 else {
            return false
        }
        var start = cnpj.index(cnpj.startIndex, offsetBy: 12)
        var end = cnpj.index(cnpj.startIndex, offsetBy: 13)

        let d1 = Int(cnpj[start..<end])

        var temp1 = 0

        var pos = 5

        for i in 0...11 {

            start = cnpj.index(cnpj.startIndex, offsetBy: i)
            end = cnpj.index(cnpj.startIndex, offsetBy: i + 1)

            let char = Int(cnpj[start..<end])

            temp1 += char! * pos

            pos -= 1

            if pos < 2 {
                pos = 9
            }
        }

        temp1 = temp1 % 11 < 2 ? 0 : 11 - temp1 % 11

        start = cnpj.index(cnpj.startIndex, offsetBy: 13)
        end = cnpj.index(cnpj.startIndex, offsetBy: 14)

        let d2 = Int(cnpj[start..<end])

        var temp2 = 0

        pos = 6

        for i in 0...12 {

            start = cnpj.index(cnpj.startIndex, offsetBy: i)
            end = cnpj.index(cnpj.startIndex, offsetBy: i + 1)

            let char = Int(cnpj[start..<end])

            temp2 += char! * pos
            pos -= 1
            if pos < 2 {
                pos = 9
            }
        }
        temp2 = temp2 % 11 < 2 ? 0 : 11 - temp2 % 11

        return temp1 == d1 && temp2 == d2
    }

    var withoutSpecialCharacters: String {
        return self.components(separatedBy: CharacterSet.alphanumerics.inverted).joined()
    }

    var diacriticInsensitive: String {
        return folding(options: .diacriticInsensitive, locale: .current)
    }
}

public extension String {

    subscript(_ range: NSRange) -> String {
        let start = self.index(self.startIndex, offsetBy: range.lowerBound)
        let end = self.index(self.startIndex, offsetBy: range.upperBound)
        let subString = self[start..<end]
        return String(subString)
    }

    subscript(_ range: ClosedRange<Int>) -> String {
        let start = self.index(self.startIndex, offsetBy: range.lowerBound)
        let end = self.index(self.startIndex, offsetBy: range.upperBound)
        let subString = self[start...end]
        return String(subString)
    }

    subscript(_ range: CountableRange<Int>) -> String {
        let idx1 = index(startIndex, offsetBy: range.lowerBound)
        let idx2 = index(startIndex, offsetBy: range.upperBound)
        return String(self[idx1..<idx2])
    }

    subscript(_ range: PartialRangeUpTo<Int>) -> String {
        let idx2 = index(startIndex, offsetBy: range.upperBound)
        return String(self[startIndex..<idx2])
    }

    subscript(_ range: PartialRangeThrough<Int>) -> String {
        let idx2 = index(startIndex, offsetBy: range.upperBound)
        return String(self[startIndex...idx2])
    }

    subscript(_ range: PartialRangeFrom<Int>) -> String {
        let idx1 = index(startIndex, offsetBy: range.lowerBound)
        return String(self[idx1..<endIndex])
    }

}
