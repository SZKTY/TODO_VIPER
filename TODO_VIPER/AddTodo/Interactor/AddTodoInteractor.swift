//
//  AddTodoInteractor.swift
//  TODO_VIPER
//
//  Created by 鈴木登也 on 2022/06/25.
//

import Foundation

protocol AddTodoUsecase: AnyObject {
    func saveTodo(todo: [String])
}

final class AddTodoInteractor {
    weak var presenter: AddTodoPresentaion?
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }
}

extension AddTodoInteractor: AddTodoUsecase {
    func saveTodo(todo: [String]) {

        if userDefaults.object(forKey: .todoList) != nil {
            var todoKobetsunonakami = userDefaults.object(forKey: .todoList) as! [[String]]
            todoKobetsunonakami.append(todo)
            userDefaults.set(todoKobetsunonakami, forKey: .todoList)
            presenter?.addedTodo(row: todoKobetsunonakami.count - 1)
        } else {
            let matrixTodo: [[String]] = [todo]
            userDefaults.set(matrixTodo, forKey: .todoList)
            presenter?.addedTodo(row: 0)
        }
    }
}
