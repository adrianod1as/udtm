//
//  ErrorExtensionsTests.swift
//  NetworkingTests
//
//  Created by Adriano Dias on 13/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
import Alamofire
@testable import Networking
@testable import Domain

class AuthenticationRepositoryTests: XCTestCase {

    private var sut: Error!
    private let internetErrorStub: InteractionError = .noInternetConnection(Networking
                                                                            .L10n.Error.Description.noInternetConnection)
    private let serverTrustEvaluationErrorStub: InteractionError = .failedRequest(L10n.Error.Description.pinnedCertificate)
    private let genericErrorStub: InteractionError = .appFailure([.unexpected])

    override func setUp() {
        super.setUp()

        sut = InteractionError.failedRequest("")
    }

    override func tearDown() {
        super.tearDown()
    }

    func testFilterErrorNoConnection() {
        let reachability = NetworkingReachabilityStub(isReachable: false)
        let error = sut.filter(withNetworkReachability: reachability)
        XCTAssertEqual(error.localizedDescription, internetErrorStub.localizedDescription)
    }

    func testServerTrustEvaluationError() {
        sut = AFError.serverTrustEvaluationFailed(reason: .trustEvaluationFailed(error: nil))
        let reachability = NetworkingReachabilityStub(isReachable: true)
        let error = sut.filter(withNetworkReachability: reachability)
        XCTAssertEqual(error.localizedDescription, serverTrustEvaluationErrorStub.localizedDescription)
    }

    func testGenericError() {
         let reachability = NetworkingReachabilityStub(isReachable: true)
        let error = sut.filter(withNetworkReachability: reachability)
        XCTAssertEqual(error.localizedDescription, genericErrorStub.localizedDescription)
    }

}
