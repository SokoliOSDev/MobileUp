//
//  AlbumViewController.swift
//  MobileUp
//
//  Created by Даниил Сокол on 01.04.2022.
//

import UIKit
import VKSdkFramework
class AlbumViewController: UIViewController {

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
    
    private var collectionView: UICollectionView?

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }}

