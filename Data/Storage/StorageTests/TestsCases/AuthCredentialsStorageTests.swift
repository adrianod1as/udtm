//
//  AuthCredentialsStorageTests.swift
//  StorageTests
//
//  Created by Adriano Dias on 12/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
import KeychainAccess
@testable import Storage
@testable import AppData

class AuthCredentialsStorageTests: XCTestCase {

    private var sut: AuthCredentialsStorage!

    override func setUp() {
        super.setUp()

        sut = AuthCredentialsStorage()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testValueKeyableKey() {
        let cases: [AuthCredentialsStorage.ValueKeyable] = [.selectedSessionId, .sessionId, .firebaseToken]
        XCTAssertEqual(AuthCredentialsStorage.ValueKeyable.allCases.map({ $0.key }),
                       cases.map({ $0.key }))
    }

    func testIsAuthenticationInfo() {
        XCTAssert(AuthCredentialsStorage.ValueKeyable.selectedSessionId.isAuthenticationInfo)
        let cases: [AuthCredentialsStorage.ValueKeyable] = [.sessionId, .firebaseToken]
        cases.forEach {
            XCTAssertFalse($0.isAuthenticationInfo)
        }
    }

    func testIsAuthenticationInfoKeys() {
        XCTAssertEqual([AuthCredentialsStorage.ValueKeyable.selectedSessionId],
                       AuthCredentialsStorage.ValueKeyable.authenticationInfoKeys)
    }

    func testNonAuthenticationInfoKeys() {
        let cases: [AuthCredentialsStorage.ValueKeyable] = [.sessionId, .firebaseToken]
        XCTAssertEqual(cases, AuthCredentialsStorage.ValueKeyable.nonAuthenticationInfoKeys)
    }

    func testGetKeyNoUser() {
        XCTAssertEqual(sut.getKey(keyable: .sessionId, userId: nil, authentication: .biometric),
                       "\(AuthCredentialsStorage.ValueKeyable.sessionId.key)-\(AuthenticationType.biometric.key)")
    }

    func testGetKeyWithUser() {
        let userId = "myself"
        XCTAssertEqual(sut.getKey(keyable: .sessionId, userId: userId, authentication: .biometric),
                       "\(userId)-\(AuthCredentialsStorage.ValueKeyable.sessionId.key)-\(AuthenticationType.biometric.key)")
    }

    func testKeychainWithGroup() {
        let group = "group"
        sut = AuthCredentialsStorage(service: nil, accessGroup: group)
        XCTAssertEqual(sut.keychain.accessGroup, Keychain(accessGroup: group).accessGroup)
    }

    func testKeychainWithService() {
        let service = "service"
        sut = AuthCredentialsStorage(service: service, accessGroup: nil)
        XCTAssertEqual(sut.keychain.service, Keychain(service: service).service)
    }

    func testKeychainWithServiceAndGroup() {
        let service = "service"
        let group = "group"
        sut = AuthCredentialsStorage(service: service, accessGroup: group)
        let keychain = Keychain(service: service, accessGroup: group)
        XCTAssertEqual(sut.keychain.service, keychain.service)
        XCTAssertEqual(sut.keychain.accessGroup, keychain.accessGroup)
    }

    func testKeychainWithNoServiceAndNoGroup() {
        XCTAssertNil(sut.keychain.accessGroup)
        XCTAssertEqual(sut.keychain.service, "com.apple.dt.xctest.tool")
    }

    func testBiometricKeychainWithPrompt() {
        let prompt = "prompt"
        let keychain = sut.biometricKeychain(prompt: prompt)
        XCTAssertEqual(keychain.accessibility, .whenPasscodeSetThisDeviceOnly)
        XCTAssertEqual(keychain.authenticationPolicy, .biometryAny)
        XCTAssertEqual(prompt, keychain.authenticationPrompt)
    }

    /*
    func testSetStringValueSimpleAuthentication() {
        do {
            try setStringValueSimpleAuthentication()
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testRemoveAll() {
        do {
            try setStringValueSimpleAuthentication()
            try sut.removeAll()
            XCTAssertNil(try sut.getString(keyable: .selectedSessionId,
                                           userId: nil, authentication: .simple, prompt: ""))
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    private func setStringValueSimpleAuthentication() throws {
        let string = "value"
        try sut.set(string, keyable: .selectedSessionId,
                    userId: nil, authentication: .simple, prompt: "")
        let value = try sut.getString(keyable: .selectedSessionId,
                                      userId: nil, authentication: .simple, prompt: "")
        XCTAssertEqual(string, value)
    }
    */
}
