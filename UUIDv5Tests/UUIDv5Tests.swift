//
//  UUIDV5Tests.swift
//  UUIDV5Tests
//
//  Created by Danilo Topalovic on 15.06.16.
//  Copyright © 2016 Zalando SE. All rights reserved.
//

import XCTest
@testable import UUIDv5

class UUIDv5Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testUuid() {
    
        let nsDns = UUID(uuidString: "6BA7B811-9DAD-11D1-80B4-00C04FD430C8")!
        
        let tests: [(name: String, expected:String)] = [
            ("foo", "7da78284-2f14-5e7f-95e1-baaa9027c26f".uppercased()),
            ("bar", "a4fee5e3-abe2-5572-a781-ddc1564c067b".uppercased()),
            ("baz", "3143abb9-bd5a-5a10-bbc6-2eca452be403".uppercased())
        ]
        
        for testCase in tests {
            
            guard let uuid = UUID(namespace: nsDns, name: testCase.name) else {
                XCTAssert(false)
                return
            }
            
            XCTAssertEqual(uuid.uuidString, testCase.expected)
        }
        
        let invalid = UUID(namespace: nsDns, name: "")
        XCTAssertNil(invalid)
    }
    
    func testUuidStringNamespace() {
        
        let ns = "6BA7B811-9DAD-11D1-80B4-00C04FD430C8"
        
        let tests: [(name: String, expected:String)] = [
            ("foo", "7da78284-2f14-5e7f-95e1-baaa9027c26f".uppercased()),
            ("bar", "a4fee5e3-abe2-5572-a781-ddc1564c067b".uppercased()),
            ("baz", "3143abb9-bd5a-5a10-bbc6-2eca452be403".uppercased())
        ]
        
        for testCase in tests {
            
            guard let uuid = UUID(namespaceString: ns, name: testCase.name) else {
                XCTAssert(false)
                return
            }
            
            XCTAssertEqual(uuid.uuidString, testCase.expected)
        }
        
        let invalid = UUID(namespaceString: "LoL", name: "foo")
        XCTAssertNil(invalid)
    }
}
