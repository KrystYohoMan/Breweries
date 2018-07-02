//
//  LoginViewController.swift
//  Pivovary
//
//  Created by Tadeusz Raszka on 29.06.18.
//  Copyright © 2018 Krystian Labaj. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    
    private let loginView = LoginView()
    private let apiRequest = APIRequest()
    
    override func loadView() {
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        loginView.addContinueButtonTarget(target: self, action: #selector(continueButtonTapped))
    }
}

extension LoginViewController {
    
    @objc func continueButtonTapped() {
        apiRequest.apiRequest()
    }
}
