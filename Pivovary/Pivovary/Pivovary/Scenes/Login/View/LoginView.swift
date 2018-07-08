//
//  LoginView.swift
//  Pivovary
//
//  Created by Tadeusz Raszka on 29.06.18.
//  Copyright © 2018 Krystian Labaj. All rights reserved.
//

import UIKit
import PureLayout

final class LoginView: UIView {

    private let titleLabel = UILabel()
    private let userNameTextField = UITextField()
    private let passwordTextField = UITextField()
    private let continueButton = UIButton()
    private let stackView = UIStackView()
    internal var userNameText: String = ""
    internal var passwordText: String = ""
    
    init() {
        super.init(frame: .zero)
        
        addSubviews()
        setUpViews()
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView: ViewLayout {
    
    func addSubviews() {
        [userNameTextField, createSeparator(), passwordTextField, createSeparator()].forEach(stackView.addArrangedSubview)
        [titleLabel, continueButton, stackView].forEach(addSubview)
    }
    
    func setUpViews() {
        let cornerRadiusNumber: CGFloat = 30
        
        backgroundColor = Color.white.color
        
        stackView.axis = .vertical
        
        titleLabel.text = NSLocalizedString("LoginView_001", comment: "")
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.textAlignment = .center
        titleLabel.textColor = Color.gray.color
        
        userNameTextField.backgroundColor = Color.white.color
        userNameTextField.textAlignment = .center
        userNameTextField.textColor = Color.gray.color
        userNameTextField.attributedPlaceholder = NSAttributedString(
            string: NSLocalizedString("LoginView_002", comment: ""),
            attributes: [NSAttributedStringKey.foregroundColor: Color.beerYellow.color]
        )
        
        passwordTextField.backgroundColor = Color.white.color
        passwordTextField.textAlignment = .center
        passwordTextField.textColor = Color.gray.color
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: NSLocalizedString("LoginView_003", comment: ""),
            attributes: [NSAttributedStringKey.foregroundColor: Color.beerYellow.color]
        )
        passwordTextField.isSecureTextEntry = true
        
        continueButton.backgroundColor = Color.beerYellow.color
        continueButton.setTitle(NSLocalizedString("LoginView_004", comment: ""), for: .normal)
        continueButton.layer.cornerRadius = cornerRadiusNumber
    }
    
    func layoutViews() {
        let textFieldSize: CGFloat = 60
        let buttonHeight: CGFloat = 70
        
// MARK: I decided to pin titleLabel to safeArea because whenever I decided to add navigation bar it will overlay titleLabel.
        titleLabel.autoPinToSafeArea(toEdge: .top)
        titleLabel.autoPinEdge(toSuperviewEdge: .leading)
        titleLabel.autoPinEdge(toSuperviewEdge: .trailing)
        
        stackView.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 32)
        stackView.autoPinEdge(toSuperviewEdge: .leading, withInset: Size.HorizontalInset)
        stackView.autoPinEdge(toSuperviewEdge: .trailing, withInset: Size.HorizontalInset)
        
        userNameTextField.autoSetDimension(.height, toSize: textFieldSize)
        passwordTextField.autoSetDimension(.height, toSize: textFieldSize)
        
        continueButton.autoPinEdge(.top, to: .bottom, of: passwordTextField, withOffset: Size.VerticalInset)
        continueButton.autoPinEdge(.leading, to: .leading, of: userNameTextField)
        continueButton.autoPinEdge(.trailing, to: .trailing, of: userNameTextField)
        continueButton.autoSetDimension(.height, toSize: buttonHeight)
    }
}

extension LoginView {
    
    func isUserNameTextFieldEmpty() -> Bool {
        userNameText = userNameTextField.text ?? ""
        return userNameText.isEmpty
    }
    
    func isPasswordTextFieldEmpty() -> Bool {
        passwordText = passwordTextField.text ?? ""
        return passwordText.isEmpty
    }
    
    func userAuthorized() -> Bool {
        userNameText = userNameTextField.text ?? ""
        passwordText = passwordTextField.text ?? ""
        return userNameText == "test@test.cz" && passwordText == "test"
    }
    
    func animateUserNameTextField() {
        userNameTextField.addShakeAnimation()
    }
    
    func animatePasswordTextField() {
        passwordTextField.addShakeAnimation()
    }
    
    func animateTextFields() {
        if isUserNameTextFieldEmpty() {
            animateUserNameTextField()
        }
        if isPasswordTextFieldEmpty() {
            animatePasswordTextField()
        }
        if !userNameText.isEmpty && !passwordText.isEmpty != userAuthorized() {
            userNameTextField.addShakeAnimation()
            passwordTextField.addShakeAnimation()
        }
    }
}

extension LoginView {
    
    func addTargetForContinueButton(target: Any?, action: Selector, controlEvent: UIControlEvents = .touchUpInside) {
        continueButton.addTarget(target, action: action, for: controlEvent)
    }
    
    private func createSeparator() -> SeparatorView {
        return SeparatorView()
    }
}
