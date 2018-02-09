//
//  SocketTests.swift
//  SwiftPhoenixClientTests
//
//  Created by Daniel Rees on 2/8/18.
//

import XCTest
import SwiftPhoenixClient

class SocketTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitiWithUrl() {
        XCTAssertEqual(Socket(endpoint: "http://localhost:4000/socket/websocket").socketEndpoint, "http://localhost:4000/socket/websocket")
        XCTAssertEqual(Socket(endpoint: "https://localhost:4000/socket/websocket").socketEndpoint, "https://localhost:4000/socket/websocket")
        XCTAssertEqual(Socket(endpoint: "ws://localhost:4000/socket/websocket").socketEndpoint, "http://localhost:4000/socket/websocket")
        XCTAssertEqual(Socket(endpoint: "wss://localhost:4000/socket/websocket").socketEndpoint, "https://localhost:4000/socket/websocket")
        XCTAssertEqual(Socket(endpoint: "http://localhost:4000/socket/websocket", params: ["token":"abc"]).socketEndpoint, "http://localhost:4000/socket/websocket?token=abc")
    }

    
}
