//
//  PlayGroundUITests.swift
//  PlayGroundUITests
//
//  Created by liang on 12/04/2017.
//  Copyright © 2017 liang. All rights reserved.
//

import XCTest

class PlayGroundUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        snapshot("0Launch")
        
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery.staticTexts["NSLog和printf的关系"].tap()
        
        let masterButton = app.navigationBars["Master"].buttons["Master"]
        masterButton.tap()
        
        let targetStaticText = tablesQuery.staticTexts["Target测试"]
        targetStaticText.tap()
        snapshot("Target测试")
        masterButton.tap()
        
        let staticText = tablesQuery.staticTexts["全局队列的分类"]
        staticText.tap()
        snapshot("全局队列的分类")
        masterButton.tap()
        tablesQuery.staticTexts["dispatch source 测试"].tap()
        snapshot("dispatch source 测试")
        masterButton.tap()
        tablesQuery.staticTexts["Sync VS. Async 比较"].tap()
        snapshot("Sync VS. Async 比较")
        masterButton.tap()
        
    }
    
}
