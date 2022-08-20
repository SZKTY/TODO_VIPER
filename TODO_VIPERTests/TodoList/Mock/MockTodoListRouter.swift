//
//  MockTodoListRouter.swift
//  TODO_VIPERTests
//
//  Created by 鈴木登也 on 2022/07/31.
//

import UIKit
@testable import TODO_VIPER

class MockTodoListRouter: TodoListWireframe {
    var callCountAddTodo = 0
    var callCountDetailTodo = 0

    func addTodo() {
        callCountAddTodo += 1
    }
    
    func detailTodo(row: Int) {
        callCountDetailTodo = row
    }
}
