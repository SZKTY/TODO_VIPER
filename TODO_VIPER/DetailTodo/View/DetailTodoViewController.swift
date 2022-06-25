//
//  DetailTodoViewController.swift
//  TODO_VIPER
//
//  Created by 鈴木登也 on 2022/06/25.
//

import UIKit

protocol DetailTodoView: AnyObject {
    
}

class DetailTodoViewController: UIViewController {

    @IBOutlet weak var todoLabel: UILabel!
    @IBOutlet weak var memoLabel: UILabel!
    @IBOutlet weak var finishButton: UIButton!
    
    var presenter: DetailTodoPresentaion!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finishButton.addTarget(self, action: #selector(tappedFinishButton), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    func inject(presenter: DetailTodoPresenter) {
        self.presenter = presenter
    }
    
}

@objc private extension DetailTodoViewController {
    
    func tappedFinishButton() {
        print("完了")
    }
}

extension DetailTodoViewController: DetailTodoView {
    
}
