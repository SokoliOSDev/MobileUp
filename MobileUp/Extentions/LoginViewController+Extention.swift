//
//  LoginViewController+Extention.swift
//  MobileUp
//
//  Created by Сокол Даниил on 29.03.2022.
//
import UIKit
import VKSdkFramework

extension LoginViewController: VKSdkDelegate, VKSdkUIDelegate {
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print("Авторизация пройдена успешно")
        AuthorizationFinished()
    }
    
    func vkSdkUserAuthorizationFailed() {
        print("Авторизация не пройдена")
    }
    
    private func AuthorizationFinished() {
        let rootVC = CollectionPhotoController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        navVC.navigationBar.backgroundColor = .white
        present(navVC, animated: true)
    }
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        self.present(controller, animated: true, completion: nil)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print("vkSdkNeedCaptchaEnter")
    }
}
