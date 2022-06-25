//
//  AddTodoPresenter.swift
//  TODO_VIPER
//
//  Created by 鈴木登也 on 2022/06/25.
//

import Foundation

protocol AddTodoPresentaion: AnyObject {
    func tappedSaveButton(todo: [String])
    func addedTodo()
}

final class AddTodoPresenter {
    
    private weak var view: AddTodoView?
    private let interactor: AddTodoInteractor
    private let router: AddTodoRouter
    
    init(view: AddTodoView,
         interactor: AddTodoInteractor,
         router: AddTodoRouter){
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension AddTodoPresenter: AddTodoPresentaion {
    
    func tappedSaveButton(todo: [String]) {
        self.interactor.saveTodo(todo: todo)
    }
    
    func addedTodo() {
        self.router.addedTodo()
    }
    
}
