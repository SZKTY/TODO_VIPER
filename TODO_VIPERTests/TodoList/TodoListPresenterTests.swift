//
//  TodoListPresenterTests.swift
//  TODO_VIPERTests
//
//  Created by 鈴木登也 on 2022/07/31.
//

import XCTest
@testable import TODO_VIPER

class TodoListPresenterTests: XCTestCase {
    
    let view = MockTodoListView()
    let interactor = MockTodoListInteractor()
    let router = MockTodoListRouter()
    var presenter: TodoListPresenter!

    override func setUpWithError() throws {
        super.setUp()
        presenter = TodoListPresenter(view: view,
                                      interactor: interactor,
                                      router: router)
        view.presenter = presenter
    }

    override func tearDownWithError() throws {
        super.tearDown()
    }
    
    func testViewWillAppear() {
        presenter.viewWillAppear()
        XCTAssertEqual(interactor.callCountFetchTodos, 1)
    }
    
    func testTappedAddButton() {
        presenter.tappedAddButton()
        XCTAssertEqual(router.callCountAddTodo, 1)
    }
    
    func testDidSelect() {
        presenter.didSelect(row: 1)
        XCTAssertEqual(router.callCountDetailTodo, 1)
    }
    
    func testTappedFinishButton() {
        presenter.tappedFinishButton(row: 1)
        XCTAssertEqual(interactor.callCountDeleteTOdo, 1)
    }

}
