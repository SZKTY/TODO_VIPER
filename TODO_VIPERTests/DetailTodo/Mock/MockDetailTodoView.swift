//
//  MockDetailTodoView.swift
//  TODO_VIPERTests
//
//  Created by 鈴木登也 on 2022/08/31.
//

import UIKit
@testable import TODO_VIPER

class MockDetailTodoView: DetailTodoView {
    var presenter: DetailTodoPresentaion!
    var callCountShowTodo: Int = 0
    var testTodo = [String]()
    
    func showTodo(todo: [String]) {
        callCountShowTodo += 1
        testTodo = todo
    }
}
