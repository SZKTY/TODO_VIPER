//
//  MockDetailTodoPresenter.swift
//  TODO_VIPERTests
//
//  Created by 鈴木登也 on 2022/08/31.
//

import UIKit
@testable import TODO_VIPER

class MockDetailTodoPresenter: DetailTodoPresentaion {
    var callCountTappedBackButton: Int = 0
    var callCountViewWillAppear: Int = 0
    var callCountDidFetchTodo: Int = 0
    var callCountFinishTodo: Int = 0
    var callCountDeletedTodo: Int = 0
    var callCountSavedTodd: Int = 0
    var fetchTodo = [String]()
    var todosAfterFinishTodo = [[String]]()
    var todosAfterSaveTodo = [[String]]()

    func tappedBackButton() {
        callCountTappedBackButton += 1
    }

    func viewWillAppear() {
        callCountViewWillAppear += 1
    }

    func didFetchTodo(todo: [String]) {
        callCountDidFetchTodo += 1
        fetchTodo = todo
    }

    func finishTodo() {
        callCountFinishTodo += 1
    }

    func deletedTodo(todos: [[String]]) {
        callCountDeletedTodo += 1
        todosAfterFinishTodo = todos
    }
    
    func savedTodo() {
        callCountSavedTodd += 1
        let userDefaults = UserDefaults(suiteName: "Test")!
        todosAfterSaveTodo = userDefaults.object(forKey: .todoList) as! [[String]]
    }
}
