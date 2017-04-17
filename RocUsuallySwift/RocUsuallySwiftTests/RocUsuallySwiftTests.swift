//
//  RocUsuallySwiftTests.swift
//  RocUsuallySwiftTests
//
//  Created by pxl on 2017/4/17.
//  Copyright © 2017年 pxl. All rights reserved.
//

import XCTest

class RocUsuallySwiftTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testBoxueExample(){
        if true {
            let boss = Role("boss")
            let fn = {
                print("\(boss) takes this action.")
            }
            
            boss.action = fn
        }
    
    }
    
    
}

class Role {
    var name: String
    var action: () -> Void = { }
    
    init(_ name: String = "Foo") {
        self.name = name
        print("\(self) init")
    }
    
    deinit {
        print("\(self) deinit")
    }
}

extension Role: CustomStringConvertible {
    var description: String {
        return "<Role: \(name)>"
    }
}
