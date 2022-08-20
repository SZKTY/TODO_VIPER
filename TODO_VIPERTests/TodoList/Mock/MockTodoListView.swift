//
//  MockTodoListView.swift
//  TODO_VIPERTests
//
//  Created by 鈴木登也 on 2022/07/31.
//

import UIKit
@testable import TODO_VIPER

class MockTodoListView: TodoListView {
    var presenter: TodoListPresenter!
    
    var callCountShowTodos = 0
    
    func showTodos(_ todoListEntities: [TodoListEntity]) {
        callCountShowTodos += 1
    }
}
