//
//  DateExtensionsTests.swift
//  DomainTests
//
//  Created by Adriano Dias on 12/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
import SwiftDate
@testable import Domain

class DateExtensionsTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    // swiftlint:disable unnecessary_type
    func testRollback() {
        let okDate: Date? = Date()
        let nilDate: Date? = nil
        let timeIntervalSince1970 = Date(timeIntervalSince1970: 1)
        XCTAssertEqual(nilDate.rollBackTo1970, timeIntervalSince1970)
        XCTAssertEqual(okDate.rollBackTo1970, okDate)
    }

    func testToday() {
        XCTAssertEqual(Date().compare(toDate: Date.today, granularity: .second), .orderedSame)
    }

    func testRegion() {
        XCTAssertEqual(Region(calendar: Calendars.gregorian, zone: Zones.current, locale: Locales.portugueseBrazil), .brazil)
    }

    func testToBrazililian() {
        let today = Date.today
        let format = PresentationDatesFormtat.netherlands.format
        let dateInRegion = DateInRegion(today, region: .brazil)
        XCTAssertEqual(dateInRegion.toFormat(format), today.toBrazillian(formart: format))
    }

    func testFormats() {
        let today = Date.today
        let defaultDates = PresentationDatesFormtat.allCases.map { DateInRegion(today, region: .brazil).toFormat($0.format) }
        let asFormatDates = PresentationDatesFormtat.allCases.map { $0.asFormat(in: today) }
        let toPresentationFormatDates = PresentationDatesFormtat.allCases.map { today.toPresentationFormat($0) }
        XCTAssertEqual(defaultDates, asFormatDates)
        XCTAssertEqual(defaultDates, toPresentationFormatDates)
    }

    func testStrictDate() {
        let formats: [String] = PresentationDatesFormtat.formats + DateFormats.autoFormats
        XCTAssertNotNil("28/02/2019".toStrictDate(formats))
        XCTAssertNil("29/02/2019".toStrictDate(formats))
    }

    func testRandomDate() {
        let today = Date.today
        let oneMonthAgo = today - 1.months
        let oneMonthLater = today + 1.months
        (0...9).forEach { _ in
            let betweenOneMonthAgoAndToday = Date.random(between: oneMonthAgo)
            XCTAssert(betweenOneMonthAgoAndToday >= oneMonthAgo)
            XCTAssert(betweenOneMonthAgoAndToday <= today)
            let betweenTodayAndOneMonthLater = Date.random(between: today, and: oneMonthLater)
            XCTAssert(betweenTodayAndOneMonthLater <= oneMonthLater)
            XCTAssert(betweenTodayAndOneMonthLater >= today)
        }
    }

    func testBrazilFormatWithTime() {
        let today = Date.today
        let format = "\(PresentationDatesFormtat.brazil.format) \(PresentationDatesFormtat.time.format)"
        let dateInRegion = DateInRegion(today, region: .brazil)
        XCTAssertEqual(dateInRegion.toFormat(format), today.brazilFormatWithTime)
    }

    func testBrazilFormatWithFullTime() {
        let today = Date.today
        let format = "\(PresentationDatesFormtat.brazil.format) \(PresentationDatesFormtat.fullTime.format)"
        let dateInRegion = DateInRegion(today, region: .brazil)
        XCTAssertEqual(dateInRegion.toFormat(format), today.brazilFormatWithFullTime)
    }

}
