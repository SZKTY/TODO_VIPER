//
//  TODO_VIPERTests.swift
//  TODO_VIPERTests
//
//  Created by 鈴木登也 on 2022/06/20.
//

import XCTest
@testable import TODO_VIPER

class TODOVIPERTests: XCTestCase {

    let todoListInteractor = TodoListInteractor()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}

class TodoListPresenterModelMock: TodoListPresentation {
    var appearCalledCount = 0
    func viewWillAppear() {
        appearCalledCount += 1
    }
    
    func didFetchedTodos(_ todos: [[String]]) {
        <#code#>
    }
    
    func tappedAddButton() {
        <#code#>
    }
    
    func didSelect(row: Int) {
        <#code#>
    }
    
    func tappedFinishButton(row: Int) {
        <#code#>
    }
    
    
}

class TodoListPresenterModelTests: XCTestCase{
    
    let mock = TodoListPresenterModelMock()
    let presenter = TodoListPresenter(mock)
    
    func testViewWillAppear() {
        
    }
    
}
