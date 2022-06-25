//
//  DetailTodoPresenter.swift
//  TODO_VIPER
//
//  Created by 鈴木登也 on 2022/06/25.
//

import Foundation

protocol DetailTodoPresentaion: AnyObject {
}

final class DetailTodoPresenter {
    private weak var view: DetailTodoView?
    private let interactor: DetailTodoInteractor
    private let router: DetailTodoRouter
    
    init(view: DetailTodoView,
         interactor: DetailTodoInteractor,
         router: DetailTodoRouter){
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension DetailTodoPresenter: DetailTodoPresentaion {
    
}
