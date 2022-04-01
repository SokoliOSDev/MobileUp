//
//  CollectionPhotoController.swift
//  MobileUp
//
//  Created by Сокол Даниил on 29.03.2022.
//

import UIKit

class CollectionPhotoController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Mobile Up Gallery"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Выход",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(exit))
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    @objc func exit() {
        dismiss(animated: true, completion: nil)
    }
}
