//
//  DetailTodoInteractorTests.swift
//  TODO_VIPERTests
//
//  Created by 鈴木登也 on 2022/08/31.
//

import XCTest
@testable import TODO_VIPER

class DetailTodoInteractorTests: XCTestCase {
    
    var dependency: Dependency!
    var presenter = MockDetailTodoPresenter()

    override func setUpWithError() throws {
        self.setUp()
        dependency = Dependency()
    }

    override func tearDownWithError() throws {
        self.setUp()
        dependency.removeUserDefaults()
        UserDefaults.standard.removeObject(forKey: .todoList)
    }
    
    func testFetchTodo() {
        let testTarget = dependency.testTarget
        testTarget.presenter = presenter
        dependency.userDefaults.set([["a", "b"]], forKey: .todoList)
        testTarget.fetchTodo(todoId: 0)
        XCTAssertEqual(presenter.fetchTodo, ["a", "b"])
        XCTAssertEqual(presenter.callCountDidFetchTodo, 1)
    }
    
    func testFinishTodo() {
        let testTarget = dependency.testTarget
        testTarget.presenter = presenter
        dependency.userDefaults.set([["a", "b"]], forKey: .todoList)
        testTarget.finishTodo(todoId: 0)
        XCTAssertEqual(presenter.todosAfterFinishTodo, [])
        XCTAssertEqual(presenter.callCountDeletedTodo, 1)
    }
    
    func testSaveTodo() {
        let testTarget = dependency.testTarget
        testTarget.presenter = presenter
        testTarget.saveTodo(todos: [["a", "b"], ["a", "c"]])
        XCTAssertEqual(presenter.todosAfterSaveTodo, [["a", "b"], ["a", "c"]])
        XCTAssertEqual(presenter.callCountSavedTodd, 1)
    }

}

extension DetailTodoInteractorTests {
    struct Dependency {
        let testTarget: DetailTodoInteractor
        let userDefaults: UserDefaults
        static let suiteName: String = "Test"
        
        init() {
            userDefaults = UserDefaults(suiteName: DetailTodoInteractorTests.Dependency.suiteName)!
            testTarget = .init(userDefaults: userDefaults)
        }
        
        func removeUserDefaults() {
            userDefaults.removePersistentDomain(forName: DetailTodoInteractorTests.Dependency.suiteName)
        }
    }
}
