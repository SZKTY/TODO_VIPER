//
//  TodoListInteractor.swift
//  TODO_VIPER
//
//  Created by 鈴木登也 on 2022/06/25.
//

import Foundation

protocol TodoListUsecase {
    func fetchTodos()
    func deleteTodo(row: Int)
}

final class TodoListInteractor {
    weak var presenter: TodoListPresentation?
}

extension TodoListInteractor: TodoListUsecase {
    
    func fetchTodos(){
        if UserDefaults.standard.object(forKey: .todoList) != nil {
            guard let todos = UserDefaults.standard.object(forKey: .todoList) as? [[String]] else { return }
            self.presenter?.didFetchedTodos(todos)
        } else {
            print("空です")
        }
    }
    
    func deleteTodo(row: Int) {
        guard var todos = UserDefaults.standard.object(forKey: .todoList) as? [[String]] else { return }
        todos.remove(at: row)
        UserDefaults.standard.set(todos, forKey: .todoList)
        self.presenter?.viewWillAppear()
    }
}
