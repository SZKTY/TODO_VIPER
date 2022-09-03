//
//  MockAddTodoPresenter.swift
//  TODO_VIPERTests
//
//  Created by 鈴木登也 on 2022/08/30.
//
import UIKit
@testable import TODO_VIPER

class MockAddTodoPresenter: AddTodoPresentaion {
    var callCountTappedSaveButton = 0
    var addedTodos = [[String]]()
    
    func tappedSaveButton(todo: [String]) {
        callCountTappedSaveButton += 1
    }
    
    func addedTodo(row: Int) {
        let userDefaults = UserDefaults(suiteName: "Test")!
        addedTodos = userDefaults.object(forKey: .todoList) as! [[String]]
    }
    
}
