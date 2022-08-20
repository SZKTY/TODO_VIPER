//
//  TodoPresenter.swift
//  TODO_VIPER
//
//  Created by 鈴木登也 on 2022/06/22.
//

import Foundation

protocol TodoListPresentation: AnyObject {
    func viewWillAppear()
    func tappedAddButton()
    func didSelect(row: Int)
    func tappedFinishButton(row: Int)
}

final class TodoListPresenter {
    private weak var view: TodoListView?
    private let interactor: TodoListUsecase
    private let router: TodoListWireframe

    init(view: TodoListView,
         interactor: TodoListUsecase,
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

    func tappedAddButton() {
        self.router.addTodo()
    }

    func didSelect(row: Int) {
        self.router.detailTodo(row: row)
    }

    func tappedFinishButton(row: Int) {
        self.interactor.deleteTodo(row: row)
    }
}

extension TodoListPresenter: TodoListInteractorOutput {
    func getSuccess(_ todos: [[String]]) {
        var viewDatas = [TodoListEntity]()
        todos.forEach { todo in
            let viewData = TodoListEntity(title: todo.first!, body: todo.last!)
            viewDatas.append(viewData)
        }
        self.view?.showTodos(viewDatas)
    }
    
    func getFailure() {
        print("データがありません")
    }
}
