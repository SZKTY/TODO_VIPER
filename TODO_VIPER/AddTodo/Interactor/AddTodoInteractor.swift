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
}

extension AddTodoInteractor: AddTodoUsecase {
    func saveTodo(todo: [String]) {

        if UserDefaults.standard.object(forKey: .todoList) != nil {
            var todoKobetsunonakami = UserDefaults.standard.object(forKey: .todoList) as! [[String]]
            todoKobetsunonakami.append(todo)
            UserDefaults.standard.set(todoKobetsunonakami, forKey: .todoList)
            presenter?.addedTodo(row: todoKobetsunonakami.count - 1)
        } else {
            let matrixTodo: [[String]] = [todo]
            UserDefaults.standard.set(matrixTodo, forKey: .todoList)
            presenter?.addedTodo(row: 0)
        }
    }
}
