//
//  ViewController.swift
//  MyTableViewController
//
//  Created by 大西玲音 on 2021/04/01.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBAction func buttonOneDidTapped(_ sender: Any) {
        let vc = MyTableViewController()
        vc.models = [
            ("swift", { print("swift") }),
            ("ruby", { print("ruby") }),
            ("php", { print("php") }),
            ("python", { print("python") }),
            ("java", { print("java") }),
        ]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

