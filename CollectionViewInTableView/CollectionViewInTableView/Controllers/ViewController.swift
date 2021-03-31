//
//  ViewController.swift
//  CollectionViewInTableView
//
//  Created by 大西玲音 on 2021/03/31.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    private var models = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for _ in 1...10 {
            models.append(Model(text: "swift", imageName: "swift"))
            models.append(Model(text: "java", imageName: "java"))
            models.append(Model(text: "ruby", imageName: "ruby"))
            models.append(Model(text: "python", imageName: "python"))
        }

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.id)
        
    }

}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.id, for: indexPath) as! CollectionTableViewCell
        cell.configure(with: models)
        return cell
    }
    
}

