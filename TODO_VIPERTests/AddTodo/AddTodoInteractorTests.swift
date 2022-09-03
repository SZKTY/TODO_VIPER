//
//  AddTodoInteractorTests.swift
//  TODO_VIPERTests
//
//  Created by 鈴木登也 on 2022/08/30.
//

import XCTest
@testable import TODO_VIPER

class AddTodoInteractorTests: XCTestCase {
    
    var dependency: Dependency!
    var presenter = MockAddTodoPresenter()

    override func setUpWithError() throws {
        self.setUp()
        dependency = Dependency()
    }

    override func tearDownWithError() throws {
        self.setUp()
        dependency.removeUserDefaults()
        UserDefaults.standard.removeObject(forKey: .todoList)
    }
    
    func testSaveTodo() {
        let testTarget = dependency.testTarget
        testTarget.presenter = presenter
        testTarget.saveTodo(todo: ["a", "b"])
        XCTAssertEqual(presenter.addedTodos, [["a", "b"]])
    }
}

extension AddTodoInteractorTests {
    struct Dependency {
        let testTarget: AddTodoInteractor
        let userDefaults: UserDefaults
        static let suiteName: String = "Test"
        
        init() {
            userDefaults = UserDefaults(suiteName: AddTodoInteractorTests.Dependency.suiteName)!
            testTarget = .init(userDefaults: userDefaults)
        }
        
        func removeUserDefaults() {
            userDefaults.removePersistentDomain(forName: AddTodoInteractorTests.Dependency.suiteName)
        }
    }
}
