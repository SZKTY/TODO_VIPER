//
//  TodoListInteractor.swift
//  TODO_VIPER
//
//  Created by 鈴木登也 on 2022/06/25.
//

import Foundation

protocol TodoListUsecase {
    var output: TodoListInteractorOutput? { get }
    
    func fetchTodos()
    func deleteTodo(row: Int)
}

final class TodoListInteractor {
    weak var presenter: TodoListPresentation?
    weak var output: TodoListInteractorOutput?
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaultscd
    }
}

extension TodoListInteractor: TodoListUsecase {
    func fetchTodos() {
        if let todos = userDefaults.object(forKey: .todoList) as? [[String]] {
            output?.getSuccess(todos)
        } else {
            output?.getFailure()
        }
    }

    func deleteTodo(row: Int) {
        guard var todos = userDefaults.object(forKey: .todoList) as? [[String]] else {
            output?.getFailure()
            return
        }
        todos.remove(at: row)
        userDefaults.set(todos, forKey: .todoList)
        self.presenter?.viewWillAppear()
    }
}
