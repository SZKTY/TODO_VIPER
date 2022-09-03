//
//  TodoListInteractorTests.swift
//  TODO_VIPERTests
//
//  Created by 鈴木登也 on 2022/07/31.
//

import XCTest
@testable import TODO_VIPER

class TodoListInteractorTests: XCTestCase {
    
    var dependency: Dependency!
    var output = MockTodoListInteractorOutput()
    var presenter = MockTodoListPresenter()

    override func setUpWithError() throws {
        self.setUp()
        dependency = Dependency()
    }

    override func tearDownWithError() throws {
        self.setUp()
        dependency.removeUserDefaults()
    }
    
    func testFetchTodos() {
        let testTarget = dependency.testTarget
        dependency.userDefaults.set([["a", "b"]], forKey: .todoList)
        testTarget.output = output
        testTarget.fetchTodos()
        XCTAssertEqual(output.callCountGetSuccess, 1)
        XCTAssertEqual(output.result, [["a", "b"]])
        XCTAssertEqual(output.callCountGetFailure, 0)
    }
    
    func testFetchTodos_empty() {
        let testTarget = dependency.testTarget
        testTarget.output = output
        testTarget.fetchTodos()
        XCTAssertEqual(output.callCountGetSuccess, 0)
        XCTAssertEqual(output.callCountGetFailure, 1)
    }

    func testDeleteTodo() {
        let testTarget = dependency.testTarget
        testTarget.output = output
        testTarget.presenter = presenter
        dependency.userDefaults.set([["a", "b"]], forKey: .todoList)
        testTarget.deleteTodo(row: 0)
        XCTAssertEqual(presenter.callCountViewWillAppear, 1)
        XCTAssertEqual(presenter.todos, [])
        XCTAssertEqual(output.callCountGetFailure, 0)
    }
}

extension TodoListInteractorTests {
    struct Dependency {
        let testTarget: TodoListInteractor
        let userDefaults: UserDefaults
        static let suiteName: String = "Test"
        
        init() {
            userDefaults = UserDefaults(suiteName: TodoListInteractorTests.Dependency.suiteName)!
            testTarget = .init(userDefaults: userDefaults)
        }
        
        func removeUserDefaults() {
            userDefaults.removePersistentDomain(forName: TodoListInteractorTests.Dependency.suiteName)
        }
    }
}
