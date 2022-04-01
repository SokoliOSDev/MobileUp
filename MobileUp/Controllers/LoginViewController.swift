//
//  LoginViewController.swift
//  MobileUp
//
//  Created by Сокол Даниил on 29.03.2022.
//

import UIKit
import VKSdkFramework

class LoginViewController: UIViewController {
    
    let VK_APP_ID = "8118964"
    let scope = ["email", "photos", "wall"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let sdkInstance = VKSdk.initialize(withAppId: self.VK_APP_ID)
        sdkInstance?.register(self)
        sdkInstance?.uiDelegate = self
        setupConstraints()
    }
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Mobile Up \nGallery"
        label.textColor = .black
        label.font = .systemFont(ofSize: 50, weight: .bold)
        label.numberOfLines = 2
        label.minimumScaleFactor = 10
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.addTarget(self, action: #selector(bClicked), for: .touchUpInside)
        loginButton.setTitle("Вход через VK", for: .normal)
        loginButton.backgroundColor = .black
        loginButton.layer.cornerRadius = 10
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        return loginButton
    }()
    
    @objc func bClicked() {
        VKSdk.wakeUpSession(scope, complete: {(state: VKAuthorizationState, error: Error?) -> Void in
            if state == .authorized {
            } else {
                VKSdk.authorize(self.scope)
            }
        })
    }
    
    private func setupConstraints() {
        view.addSubview(label)
        view.addSubview(loginButton)
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100))
        constraints.append(label.bottomAnchor.constraint(greaterThanOrEqualTo: loginButton.topAnchor, constant: -400))
        constraints.append(label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30))
        constraints.append(label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30))
        
        constraints.append(loginButton.heightAnchor.constraint(equalToConstant: 60))
        constraints.append(loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40))
        constraints.append(loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30))
        constraints.append(loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30))
        NSLayoutConstraint.activate(constraints)
    }
}
