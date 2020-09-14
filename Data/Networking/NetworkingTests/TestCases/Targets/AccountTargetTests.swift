//
//  AccountTargetTests.swift
//  NetworkingTests
//
//  Created by Adriano Dias on 13/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
import Moya
@testable import Networking

class AccountTargetTests: XCTestCase {

    private var sut: AccountTarget!
    private let sessionIdStub = "id"

    override func setUp() {
        super.setUp()

        sut = .accountDetails(sessionId: sessionIdStub)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testBaseUrl() {
        XCTAssertEqual(sut.baseURL, URL(string: "https://api.themoviedb.org/")!)
    }

    func testApi() {
        XCTAssertEqual(sut.api, "account")
    }

    func testVersion() {
        XCTAssertEqual(sut.version, 3.description)
    }

    func testPath() {
        XCTAssertEqual(sut.path, "\(sut.version)/\(sut.api)")
    }

    func testSpecificHeaderTypes() {
        XCTAssert(sut.specificHeaderTypes.isEmpty)
    }

    func testKeyPathForData() {
        XCTAssertNil(sut.keyPathForData)
    }

    func testValidationType() {
        XCTAssertEqual(sut.validationType, .successAndRedirectCodes)
    }

    func testHeaders() {
        XCTAssertNil(sut.headers)
    }

    func testMethod() {
        XCTAssertEqual(sut.method, .get)
    }

    func testSampleData() {
        XCTAssertEqual(sut.sampleData, Data())
    }

    func testTask() {
        let task = Task.requestParameters(parameters: ["session_id": sessionIdStub], encoding: JSONEncoding.default)
        switch (sut.task, task) {
        case (.requestParameters(let parametersA, let encodingA),
              .requestParameters(let parametersB, let encodingB)):
            XCTAssertEqual(parametersA as? [String: String], parametersB as? [String: String])
            XCTAssertNotNil(encodingA as? JSONEncoding)
            XCTAssertNotNil(encodingB as? JSONEncoding)
        default:
            XCTFail("Different tasks")
        }
    }
}
