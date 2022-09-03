//
//  MockAddTodoRouter.swift
//  TODO_VIPERTests
//
//  Created by 鈴木登也 on 2022/08/30.
//

import UIKit
@testable import TODO_VIPER

class MockAddTodoRouter: AddTodoWireframe {
    var callCountAddedTodo = 0
    
    func addedTodo(row: Int) {
        callCountAddedTodo += 1
    }
}
