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
            string: NSLocalizedString("LoginView_003", comment: ""),
            attributes: [NSAttributedStringKey.foregroundColor: Color.beerYellow.color]
        )
        
        passwordTextField.backgroundColor = Color.white.color
        passwordTextField.textAlignment = .center
        passwordTextField.textColor = Color.gray.color
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: NSLocalizedString("LoginView_004", comment: ""),
            attributes: [NSAttributedStringKey.foregroundColor: Color.beerYellow.color]
        )
        passwordTextField.isSecureTextEntry = true
        
        continueButton.backgroundColor = Color.beerYellow.color
        continueButton.setTitle(NSLocalizedString("LoginView_005", comment: ""), for: .normal)
        continueButton.layer.cornerRadius = cornerRadiusNumber
    }
    
    func layoutViews() {
        let textFieldSize: CGFloat = 60
        let buttonHeight: CGFloat = 70
        
// MARK: I got rid of navigation bar so I need Inset 90 baceause when I pin it to top it is right under status bar and If ever will be using navigation bar it is 64 or 81 so that's the inset 90.
        titleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 90)
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
    
    func addContinueButtonTarget(target: Any?, action: Selector, controlEvent: UIControlEvents = .touchUpInside) {
        continueButton.addTarget(target, action: action, for: controlEvent)
    }
    
    
    private func createSeparator() -> SeparatorView {
        return SeparatorView()
    }
}
