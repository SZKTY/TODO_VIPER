//
//  AddTodoViewController.swift
//  TODO_VIPER
//
//  Created by 鈴木登也 on 2022/06/21.
//

import UIKit

protocol AddTodoView: AnyObject {
    func tappedSaveButton()
}

class AddTodoViewController: UIViewController {
    
    
    @IBOutlet weak var todoTextField: UITextField!
    @IBOutlet weak var memoTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    private var presenter: AddTodoPresentaion!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "AddTodo"
        self.saveButton.isEnabled = false
        todoTextField.delegate = self
        memoTextField.delegate = self
        saveButton.addTarget(self, action: #selector(tappedSaveButton), for: .touchUpInside)
    }
    
    func inject(presenter: AddTodoPresentaion) {
        self.presenter = presenter
    }
}

extension AddTodoViewController: AddTodoView {
    @objc func tappedSaveButton() {
        guard let todoText = todoTextField.text else { return }
        guard let memoText = memoTextField.text else { return }
        let todo:[String] = [todoText, memoText]
        
        self.presenter.tappedSaveButton(todo: todo)
    }
}

extension AddTodoViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = todoTextField.text else { return }

        if text.count > 0 {
            self.saveButton.isEnabled = true
        }else{
            self.saveButton.isEnabled = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
