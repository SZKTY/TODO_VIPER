//
//  AddTodoPresenterTests.swift
//  TODO_VIPERTests
//
//  Created by 鈴木登也 on 2022/08/30.
//

import XCTest
@testable import TODO_VIPER

class AddTodoPresenterTests: XCTestCase {
    
    let view = MockAddTodoView()
    let interactor = MockAddTodoInteractor()
    let router = MockAddTodoRouter()
    var presenter: AddTodoPresenter!

    override func setUpWithError() throws {
        self.setUp()
        presenter = AddTodoPresenter(view: view,
                                     interactor: interactor,
                                     router: router)
        view.presenter = presenter
    }

    override func tearDownWithError() throws {
        self.setUp()
    }
    
    func testViewWillAppear() {
        presenter.addedTodo(row: 1)
        XCTAssertEqual(router.callCountAddedTodo, 1)
    }
    
    func testTappedAddButton() {
        presenter.tappedSaveButton(todo: ["a", "b"])
        XCTAssertEqual(interactor.callCountSaveTodo, 1)
    }
}
