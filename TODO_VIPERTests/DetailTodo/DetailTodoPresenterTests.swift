//
//  DetailTodoPresenterTests.swift
//  TODO_VIPERTests
//
//  Created by 鈴木登也 on 2022/08/31.
//

import XCTest
@testable import TODO_VIPER

class DetailTodoPresenterTests: XCTestCase {
    
    let view = MockDetailTodoView()
    let interactor = MockDetailTodoInteractor()
    let router = MockDetailTodoRouter()
    var presenter: DetailTodoPresenter!

    override func setUpWithError() throws {
        self.setUp()
        presenter = DetailTodoPresenter(view: view,
                                        interactor: interactor,
                                        router: router,
                                        row: 0)
        view.presenter = presenter
    }

    override func tearDownWithError() throws {
        self.setUp()
    }
    
    func testTappedBackButton() {
        presenter.tappedBackButton()
        XCTAssertEqual(router.callCountTappedBackButton, 1)
    }

    func testViewWillAppear() {
        presenter.viewWillAppear()
        XCTAssertEqual(interactor.todoIdFetchTodo, 0)
        XCTAssertEqual(interactor.callCountFetchTodo, 1)
    }

    func testDidFetchTodo() {
        presenter.didFetchTodo(todo: ["a", "b"])
        XCTAssertEqual(view.testTodo, ["a", "b"])
        XCTAssertEqual(view.callCountShowTodo, 1)
    }

    func testFinishTodo() {
        presenter.finishTodo()
        XCTAssertEqual(interactor.todoIdFinishTodo, 0)
        XCTAssertEqual(interactor.callCountFinishTodo, 1)
    }

    func testDeletedTodo() {
        presenter.deletedTodo(todos: [[]])
        XCTAssertEqual(interactor.callCountSaveTodo, 1)
    }
    
    func testSavedTodo() {
        presenter.savedTodo()
        XCTAssertEqual(router.callCountDeletedTodo, 1)
    }
}
