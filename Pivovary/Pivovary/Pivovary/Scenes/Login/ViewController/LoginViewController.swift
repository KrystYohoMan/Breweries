//
//  LoginViewController.swift
//  Pivovary
//
//  Created by Tadeusz Raszka on 29.06.18.
//  Copyright © 2018 Krystian Labaj. All rights reserved.
//

import UIKit
import Alamofire

final class LoginViewController: UIViewController {
    
    private let loginView = LoginView()
    private let loginRequest = LoginRequest()
    
    override func loadView() {
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        addTargetForAllItems()
    }
}

extension LoginViewController {
    
    func addTargetForAllItems() {
        loginView.addTargetForContinueButton(target: self, action: #selector(continueButtonTapped))
    }
    
    @objc func continueButtonTapped() {
        loginView.animateTextFields()
        if !loginView.isUserNameTextFieldEmpty() && !loginView.isPasswordTextFieldEmpty() && loginView.userAuthorized() {
            loginRequest.apiRequest()
            present(BreweriesViewController(), animated: true, completion: nil)
        }
    }
}
