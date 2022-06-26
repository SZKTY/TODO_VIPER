//
//  DetailTodoPresenter.swift
//  TODO_VIPER
//
//  Created by 鈴木登也 on 2022/06/25.
//

import Foundation

protocol DetailTodoPresentaion: AnyObject {
    func tappedBackButton()
    func viewWillAppear()
    func didFetchTodo(todo: [String])
    func finishTodo()
    func deletedTodo()
}

final class DetailTodoPresenter {
    private weak var view: DetailTodoView?
    private let interactor: DetailTodoInteractor
    private let router: DetailTodoRouter
    var row: Int
    
    init(view: DetailTodoView,
         interactor: DetailTodoInteractor,
         router: DetailTodoRouter,
         row: Int
    ){
        self.view = view
        self.interactor = interactor
        self.router = router
        self.row = row
        
    }
    
}

extension DetailTodoPresenter: DetailTodoPresentaion {
    
    func tappedBackButton() {
        self.router.tappedBackButton()
    }
    
    func viewWillAppear() {
        self.interactor.fetchTodo(todoId: self.row)
    }
    
    func didFetchTodo(todo: [String]) {
        self.view?.showTodo(todo: todo)
    }
    
    func finishTodo() {
        self.interactor.finishTodo(todoId: row)
    }
    
    func deletedTodo() {
        self.router.deletedTodo()
    }
}
