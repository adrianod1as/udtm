//
//  SwiftDate+Extensions
//  Domain
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation
import SwiftDate

extension String {

    public var asBrazilDate: Date? {
        return self.toDate(style: PresentationDatesFormtat.brazil.style, region: .brazil)?.date
    }

    public var asDate: Date? {
        if let date = asBrazilDate {
            return date
        } else if let date = self.asDateWithIso {
            return date
        } else if let date = self.asDateWithKnownFormats {
            return date
        }
        return nil
    }

    internal func toStrictDate(_ formats: [String]) -> Date? {
        var parsedDate: Date?
        for style in formats.map({ StringToDateStyles.strict($0) }) {
            if let date = self.toDate(style: style, region: .brazil)?.date {
                parsedDate = date
                break
            }
        }
        return parsedDate
    }

    public var asDateWithIso: Date? {
        return self.toISODate(ISOParser.Options(strict: true), region: .brazil)?.date
    }

    public var asDateWithKnownFormats: Date? {
        return self.toStrictDate(PresentationDatesFormtat.formats + DateFormats.autoFormats)
    }

}

extension Optional where Wrapped == Date {

    public var rollBackTo1970: Date {
        guard let date = self else {
            return Date(timeIntervalSince1970: 1)
        }
        return date
    }

    public var rollBackToToday: Date {
        guard let date = self else {
            return .today
        }
        return date
    }
}

extension Date {

    static public var today: Date {
        return Date()
    }

    public func toPresentationFormat(_ format: PresentationDatesFormtat) -> String {
        return format.asFormat(in: self)
    }

    public var chinaFormat: String {
        return toPresentationFormat(.china)
    }

    public var underlineChinaFormat: String {
        return toPresentationFormat(.underlineChina)
    }

    public var netherlandsFormat: String {
        return toPresentationFormat(.netherlands)
    }

    public var brazilFormat: String {
        return toPresentationFormat(.brazil)
    }

    public var brazilShortYearFormat: String {
        return toPresentationFormat(.brazilShortYear)
    }

    public var ukLongFormat: String {
        return toPresentationFormat(.uk)
    }

    public var dayShortMonth: String {
        return toPresentationFormat(.dayShortMonth)
    }

    public var dayLongMonth: String {
        return toPresentationFormat(.dayLongMonth)
    }

    public var daySlashShortMonth: String {
        return toPresentationFormat(.daySlashShortMonth)
    }

    public var shortMonthShortBrazilDate: String {
        return toPresentationFormat(.shortMonthShortBrazilDate)
    }

    public var brazilFormatWithTime: String {
        let format = "\(PresentationDatesFormtat.brazil.format) \(PresentationDatesFormtat.time.format)"
        return toBrazillian(formart: format)
    }

    public var brazilFormatWithFullTime: String {
        let format = "\(PresentationDatesFormtat.brazil.format) \(PresentationDatesFormtat.fullTime.format)"
        return toBrazillian(formart: format)
    }

    public var monthShort: String {
        return toPresentationFormat(.monthShort)
    }

    public var monthLong: String {
        return toPresentationFormat(.monthLong)
    }

    public var yearShort: String {
        return toPresentationFormat(.yearShort)
    }

    public var time: String {
        return toPresentationFormat(.time)
    }

    public var fullTime: String {
        return toPresentationFormat(.fullTime)
    }

    public var shortMonthSlashYear: String {
        return toPresentationFormat(.shortMonthSlashYear)
    }

    public var shortMonthSlashShortYear: String {
        return toPresentationFormat(.shortMonthSlashShortYear)
    }

    public func toBrazillian(formart: String) -> String {
        return DateInRegion(self, region: .brazil).toFormat(formart, locale: Region.brazil.locale)
    }

    static public func random(between lowerLimitDate: Date, and upperLimitDate: Date = Date()) -> Date {
        return DateInRegion.randomDate(between: lowerLimitDate.in(region: .brazil),
                                       and: upperLimitDate.in(region: .brazil),
                                       region: .brazil).date
    }
}

extension Region {

    static public var brazil: Region {
        return Region(calendar: Calendars.gregorian,
                      zone: Zones.current,
                      locale: Locales.portugueseBrazil)
    }
}

public enum PresentationDatesFormtat: String, CaseIterable {
    case china = "yyyy-MM-dd"
    case underlineChina = "yyyy_MM_dd"
    case brazil = "dd/MM/yyyy"
    case brazilShortYear = "dd/MM/yy"
    case netherlands = "dd-MM-yyyy"
    case uk = "d MMMM yyyy"
    case dayShortMonth = "d MMM"
    case dayLongMonth = "d MMMM"
    case daySlashShortMonth = "dd/MM"
    case monthShort = "MMM"
    case monthLong = "MMMM"
    case yearShort = "yy"
    case time = "HH:mm"
    case fullTime = "HH:mm:ss"
    case shortMonthShortBrazilDate = "MMM, dd/MM"
    case shortMonthSlashYear = "MMM/yyyy"
    case shortMonthSlashShortYear = "MMM/yy"

    public static let formats = PresentationDatesFormtat.allCases.map { $0.format }
    public static let styles = PresentationDatesFormtat.allCases.map { $0.style }

    public var format: String {
        return rawValue
    }

    public var style: StringToDateStyles {
        return .strict(format)
    }

    public func asFormat(in date: Date) -> String {
        return date.toBrazillian(formart: self.format)
    }

}

extension StringToDateStyles {

    static let strictISO = StringToDateStyles.iso(ISOParser.Options(strict: true))
}

extension DateFormatter {

    static func interFormatter(format: String) -> DateFormatter {
        let formatter = DateFormatter.sharedFormatter(forRegion: .brazil, format: format)
        formatter.isLenient = false
        return formatter
    }
}
