//
//  UIUNitTestingUITests.swift
//  UIUNitTestingUITests
//
//  Created by Shyamala's MacBook Pro on 25/08/22.
//

import XCTest

class UIUNitTestingUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLaunch() throws{
        let app = XCUIApplication()
        app.launch()
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        
        let addbtn = app.navigationBars["Login"].buttons["Add"]
        let alertView = app.alerts["Add Noise Maker"].scrollViews.otherElements
        let alertTx = alertView.collectionViews.textFields["Enter Name"]
        let alertAddBtn = alertView.buttons["Add"]
        let tableCell = app.tables.staticTexts["Shyamala"]
      
        addbtn.tap()
        alertTx.tap()
        alertTx.typeText("Shyamala")
        XCTAssertFalse(tableCell.exists)
        alertAddBtn.tap()
        XCTAssertTrue(tableCell.exists)
        
//
    }
    
    func testSipwDelete(){
        let app = XCUIApplication()
        app.launch()
        let addBtn = app.navigationBars["Login"].buttons["Add"]
        let alert  = app.alerts["Add Noise Maker"].scrollViews.otherElements
        let alertText = alert.collectionViews.textFields["Enter Name"]
        let alertAddBtn = alert.buttons["Add"]
        let table = app.tables
        let tableTxt = table.staticTexts["Shyamala"]
        let tableDelete = table.buttons["Delete Shyamala"]
        let tableDeleteBtn = table.buttons["Delete"]
        addBtn.tap()
        alertText.typeText("Shyamala")
        alertAddBtn.tap()
        XCTAssertTrue(tableTxt.exists)
       
        tableDelete.tap()
        tableDeleteBtn.tap()
        
        XCTAssertFalse(tableTxt.exists)
    }
    
    func test_viewLoginScreen(){
        let app = XCUIApplication()
        app.launch()
        
        let loginBtn = app.navigationBars["Login"].buttons["Login"]
        loginBtn.tap()
        
        let nameTxt = app.textFields["Name"]
        nameTxt.tap()
        nameTxt.typeText("Shyamala")
        let passTxt = app.secureTextFields["Password"]
        passTxt.tap()
        passTxt.typeText("Password")
        
        let doneBtn = app.buttons["Done"]
        doneBtn.tap()
        let table = app.tables.staticTexts["Shyamala"]
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: table)
        
      waitForExpectations(timeout: 10)
        XCTAssertTrue(table.exists)
      
                
    }
}
