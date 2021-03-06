//
//  WhenTestingReports.swift
//  FocusPackageDescription
//
//  Created by Sam Meech-Ward on 2018-01-14.
//
@testable import Focus
import XCTest

class WhenTestingReports: XCTestCase {
  
  func beable<ItemType>(item: ItemType) -> Be<ItemType> /*Beable<ItemType>*/ {
    return Expect(item: item).to.be
  }
  
  var reporter: Reporter!
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
    reporter = Reporter()
    reporter.resetData()
    Focus.reporter = reporter
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func test_Be_True_UsesFileAndLineNumberWhenSuccessful() {
    let be = beable(item: true)
    let comment = "🖕🏼 Item is not true"
    
    be.true(comment)
    
    let expectedLine: UInt = #line-2
    let expectedFile = #file
    
    XCTAssertEqual(reporter.successData.file, expectedFile)
    XCTAssertEqual(reporter.successData.line, expectedLine)
  }
  
  func test_Be_True_UsesCommentFileAndLineNumberWhenFailes() {
    let be = beable(item: false)
    let comment = "🖕🏼 Item is not true"
    
    be.true(comment)
    
    let expectedLine: UInt = #line-2
    let expectedFile = #file
    
    XCTAssertEqual(reporter.failureData.file, expectedFile)
    XCTAssertEqual(reporter.failureData.line, expectedLine)
    XCTAssertEqual(reporter.failureData.comment, comment)
  }
  
  func test_Be_True_UsesCommentFileAndLineNumberWhenFailesBecauseNonBoolIsPassedIn() {
    let be = beable(item: customTestBoolen(booleanLiteral: true))
    let comment = "🖕🏼 Item is not true"
    
    be.true(comment)
    
    let expectedLine: UInt = #line-2
    let expectedFile = #file
    
    XCTAssertEqual(reporter.failureData.file, expectedFile)
    XCTAssertEqual(reporter.failureData.line, expectedLine)
    XCTAssertEqual(reporter.failureData.comment, comment)
  }
}
