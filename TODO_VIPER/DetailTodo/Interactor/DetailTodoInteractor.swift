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
}

final class DetailTodoInteractor {
    weak var presenter: DetailTodoPresentaion?
}

extension DetailTodoInteractor: DetailTodoUsecase {
    func fetchTodo(todoId: Int) {
        guard let todos = UserDefaults.standard.object(forKey: .todoList) as? [[String]] else { return }
        let todo: [String] = todos[todoId]
        self.presenter?.didFetchTodo(todo: todo)
    }

    func finishTodo(todoId: Int) {
        guard var todos = UserDefaults.standard.object(forKey: .todoList) as? [[String]] else { return }
        todos.remove(at: todoId)
        UserDefaults.standard.set(todos, forKey: .todoList)
        self.presenter?.deletedTodo()
    }
}
