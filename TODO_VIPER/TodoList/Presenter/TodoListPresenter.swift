//
//  TodoPresenter.swift
//  TODO_VIPER
//
//  Created by 鈴木登也 on 2022/06/22.
//

import Foundation

protocol TodoListPresentation: AnyObject {
    func viewWillAppear()
    func didFetchedTodos(_ todos: [[String]])
    func tappedAddButton()
    func didSelect(todo: TodoListEntity)
    func tappedFinishButton(row: Int)
}

final class TodoListPresenter {
    
    private weak var view: TodoListView?
    private let interactor: TodoListInteractor
    private let router: TodoListWireframe
    
    init(view: TodoListView,
         interactor: TodoListInteractor,
         router: TodoListWireframe) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension TodoListPresenter: TodoListPresentation {
    
    func viewWillAppear() {
        self.interactor.fetchTodos()
    }
    
    func didFetchedTodos(_ todos: [[String]]) {
        var viewDatas = [TodoListEntity]()
        todos.forEach{ todo in
            let viewData = TodoListEntity(title: todo.first!, body: todo.last!)
            viewDatas.append(viewData)
        }
        self.view?.showTodos(viewDatas)
    }
    
    func tappedAddButton() {
        self.router.addTodo()
    }
    
    func didSelect(todo: TodoListEntity) {
        print(todo.title)
        self.router.detailTodo()
    }
    
    func tappedFinishButton(row: Int) {
        self.interactor.deleteTodo(row: row)
    }
}
