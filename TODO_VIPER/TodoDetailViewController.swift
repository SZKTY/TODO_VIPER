//
//  TodoDetailViewController.swift
//  TODO_VIPER
//
//  Created by 鈴木登也 on 2022/06/21.
//

import UIKit

class TodoDetailViewController: UIViewController {

    enum Row: String {
        case title
        case body

        static var rows: [Row] {
            return [.title, .body]
        }
    } // ここの理解が足りない

    var todoEntity: TodoListEntity!

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension TodoDetailViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = Row.rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: row.rawValue, for: indexPath)

        if row == .title {
            cell.textLabel?.text = "タイトル"
            cell.detailTextLabel?.text = todoEntity.title
        }
        if row == .body {
            cell.textLabel?.text = todoEntity.body
            cell.detailTextLabel?.text = nil
        }
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Row.rows.count
    }
}
