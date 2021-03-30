//
//  ViewController.swift
//  CustomCells
//
//  Created by 大西玲音 on 2021/03/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MyTableViewCell.nib(),
                           forCellReuseIdentifier: MyTableViewCell.id)
        tableView.register(FieldTableViewCell.nib(),
                           forCellReuseIdentifier: FieldTableViewCell.id)
        
    }


}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 3 == 2 {
            let customCell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.id, for: indexPath) as! MyTableViewCell
            customCell.configure(with: "Custom Cell", imageName: "gear")
            return customCell
            
        }
        if indexPath.row % 3 == 1 {
            let fieldCell = tableView.dequeueReusableCell(withIdentifier: FieldTableViewCell.id, for: indexPath) as! FieldTableViewCell
            return fieldCell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = "Hello world"
            let mySwitch = UISwitch()
            mySwitch.addTarget(self, action: #selector(didChangeSwitch), for: .valueChanged)
            mySwitch.isOn = true
            cell.accessoryView = mySwitch
            return cell
        }
    }
    
    @objc func didChangeSwitch(_ sender: UISwitch) {
        if sender.isOn {
            print("isOn")
        } else {
            print("isOff")
        }
    }
    
}
