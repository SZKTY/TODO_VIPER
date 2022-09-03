//
//  AddTodoPresenter.swift
//  TODO_VIPER
//
//  Created by 鈴木登也 on 2022/06/25.
//

import Foundation

protocol AddTodoPresentaion: AnyObject {
    func tappedSaveButton(todo: [String])
    func addedTodo(row: Int)
}

final class AddTodoPresenter {

    private weak var view: AddTodoView?
    private let interactor: AddTodoUsecase
    private let router: AddTodoWireframe

    init(view: AddTodoView,
         interactor: AddTodoUsecase,
         router: AddTodoWireframe) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension AddTodoPresenter: AddTodoPresentaion {

    func tappedSaveButton(todo: [String]) {
        self.interactor.saveTodo(todo: todo)
    }

    func addedTodo(row: Int) {
        self.router.addedTodo(row: row)
    }

}
