//
//  DetailTodoInteractor.swift
//  TODO_VIPER
//
//  Created by 鈴木登也 on 2022/06/25.
//

import Foundation

protocol DetailTodoUsecase: AnyObject {
    func fetchTodo(todoId: Int)
    func finishTodo(todoId: Int)
    func saveTodo(todos: [[String]])
}

final class DetailTodoInteractor {
    weak var presenter: DetailTodoPresentaion?
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }
}

extension DetailTodoInteractor: DetailTodoUsecase {
    
    func fetchTodo(todoId: Int) {
        guard let todos = userDefaults.object(forKey: .todoList) as? [[String]] else { return }
        let todo: [String] = todos[todoId]
        self.presenter?.didFetchTodo(todo: todo)
    }

    func finishTodo(todoId: Int) {
        guard var todos = userDefaults.object(forKey: .todoList) as? [[String]] else { return }
        todos.remove(at: todoId)
        self.presenter?.deletedTodo(todos: todos)
    }
    
    func saveTodo(todos: [[String]]) {
        userDefaults.set(todos, forKey: .todoList)
        self.presenter?.savedTodo()
    }
}
