//
//  ViewController.swift
//  SearchableTableView
//
//  Created by 大西玲音 on 2021/03/31.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var tableView: UITableView!
    
    private var datas = [String]()
    private var filterdDatas = [String]()
    private var isFilterd = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        textField.delegate = self
        
    }
    
    func setupData() {
        datas.append("Swift")
        datas.append("Java")
        datas.append("Ruby")
        datas.append("C++")
        datas.append("C")
        datas.append("C#")
        datas.append("Python")
        datas.append("Perl")
        datas.append("JavaScript")
        datas.append("PHP")
        datas.append("Scratch")
        datas.append("Scala")
        datas.append("COBOL")
        datas.append("Curl")
        datas.append("Dart")
        datas.append("HTML")
        datas.append("CSS")
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !filterdDatas.isEmpty {
            return filterdDatas.count
        }
        return isFilterd ? 0 : datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = filterdDatas.isEmpty ? datas[indexPath.row] : filterdDatas[indexPath.row]
        return cell
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text {
            (string.count == 0) ? filterText(String(text.dropLast())) : filterText(text+string)
        }
        return true
    }
    
    func filterText(_ query: String) {
        filterdDatas.removeAll()
        datas.forEach { data in
            if data.lowercased().starts(with: query.lowercased()) {
                filterdDatas.append(data)
            }
        }
        tableView.reloadData()
        isFilterd = true
    }
    
}
