//
//  Numbers+Ext.swift
//  Domain
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation

public extension NSNumber {

    func getRealCurrency(withSynbol: Bool, withSpaceBetween: Bool = true) -> String {
        let formatter = NumberFormatter.brlBankingCurrency
        formatter.currencySymbol = withSynbol ? L10n.Symbol.currency : L10n.Symbol.empty
        let real = formatter.string(from: self) ?? description
        return withSpaceBetween ? real : real.replacingOccurrences(of: L10n.Symbol.nonBreakingSpace, with: L10n.Symbol.empty)
    }

    var asReal: String {
        return getRealCurrency(withSynbol: true)
    }

    var asRealNoSpace: String {
        return getRealCurrency(withSynbol: true, withSpaceBetween: false)
    }

    var asRealNoSymbol: String {
        return getRealCurrency(withSynbol: false)
    }

    var asRealNoSymbolSpace: String {
        return getRealCurrency(withSynbol: false, withSpaceBetween: false)
    }

    var asPercentage: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.brazil
        formatter.currencySymbol = L10n.Symbol.empty
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter.string(from: self)?
                            .replacingOccurrences(of: L10n.Symbol.nonBreakingSpace,
                                                  with: L10n.Symbol.empty)
                            ?? L10n.Symbol.empty
    }

    var percentage: String {
        return "\(self.asPercentage)\(L10n.Symbol.percentage)"
    }

    var amPercentage: String {
        return "\(self.asPercentage)\(L10n.Symbol.percentage) \(L10n.Symbol.am)"
    }

}

public extension Double {

    var asReal: String {
        return number.getRealCurrency(withSynbol: true)
    }

    var asRealNoSpace: String {
        return number.getRealCurrency(withSynbol: true, withSpaceBetween: false)
    }

    var asRealNoSymbol: String {
        return number.getRealCurrency(withSynbol: false)
    }

    var percentage: String? {
        return number.asPercentage + L10n.Symbol.percentage
    }

    var amPercentage: String? {
        return number.asPercentage + "\(L10n.Symbol.percentage) \(L10n.Symbol.am)"
    }

    var brlBankingCurrency: Double {
        return self.roundToDecimal(NumberFormatter.brlBankingCurrency.maximumFractionDigits)
    }

    func roundToDecimal(_ fractionDigits: Int) -> Double {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * multiplier) / multiplier
    }

    var number: NSNumber {
        return self as NSNumber
    }
}

extension Decimal {

    public var number: NSDecimalNumber {
        return NSDecimalNumber(decimal: self)
    }
}

extension Collection where Element == UInt8 {

    public var string: String {
        return map(String.init).joined()
    }

    public var attributedString: NSAttributedString {
        return NSAttributedString(string: string)
    }

    public var decimal: Decimal? {
        return Decimal(string: string)
    }
}

extension Collection where Element == Int {

    var isRepeating: Bool {
        return Set(self).count == 1
    }
}

public extension Bool {

    var intValue: Int {
        return self ? 1 : 0
    }
}

public extension NumberFormatter {

    static var brlBankingCurrency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.brazil
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
}

public extension Int {

    var asAlphabeticUpperLetter: String {
        let upperAScalar = UnicodeScalar("A")
        let origin = upperAScalar.value
        return String(Character(UnicodeScalar(origin + UInt32(self)) ?? upperAScalar))
    }

    var boolValue: Bool {
        return self == 1
    }
}

public extension Array where Element == Int {

    var string: String {
        return self.map({ String($0) }).joined()
    }

}
