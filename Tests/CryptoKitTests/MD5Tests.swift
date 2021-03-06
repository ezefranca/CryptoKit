//
//  MD5Tests.swift
//  MD5Tests
//
//  Created by Chris Amanse on 29/08/2016.
//
//

import Foundation
import XCTest
@testable import CryptoKit

class MD5Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMD5() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // Verification strings from RFC 1321
        XCTAssertEqual("".md5().hexString, "d41d8cd98f00b204e9800998ecf8427e")
        XCTAssertEqual("a".md5().hexString, "0cc175b9c0f1b6a831c399e269772661")
        XCTAssertEqual("abc".md5().hexString, "900150983cd24fb0d6963f7d28e17f72")
        XCTAssertEqual("message digest".md5().hexString, "f96b697d7cb7938d525a2f31aaf161d0")
        XCTAssertEqual("abcdefghijklmnopqrstuvwxyz".md5().hexString , "c3fcd3d76192e4007dfb496cca67e13b")
        XCTAssertEqual("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789".md5().hexString,
                       "d174ab98d277d9f5a5611c2c9f419d9f")
        XCTAssertEqual("12345678901234567890123456789012345678901234567890123456789012345678901234567890".md5().hexString,
                       "57edf4a22be3c955ac49da2e2107b67a")
    }
    
    static var allTests : [(String, (MD5Tests) -> () throws -> Void)] {
        return [
            ("testMD5", testMD5),
        ]
    }
}

extension String {
    func md5() -> Data {
        return (self.data(using: .utf8) ?? Data()).digest(using: .md5)
    }
}
