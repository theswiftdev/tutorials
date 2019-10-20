//
//  ViewController.swift
//  StackForm
//
//  Created by Tibor Bödecs on 2019. 10. 17..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    weak var scrollView: ScrollView!
    weak var stackView: VerticalStackView!
    
    override func loadView() {
        super.loadView()
        
        let scrollView = ScrollView()
        self.view.addSubview(scrollView)
        self.scrollView = scrollView
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
        ])

        let stackView = VerticalStackView()
        self.scrollView.addSubview(stackView)
        self.stackView = stackView
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 16),
            self.stackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -16),
            self.stackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 16),
            self.stackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -16),
            
            self.stackView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, constant: -32),
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "StackForm"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let email = EmailTextField(id: "email-input", placeholder: "Email")
        self.stackView.addArrangedSubview(email)

        let password = PasswordTextField(id: "password-input", placeholder: "Password")
        self.stackView.addArrangedSubview(password)

        let submit = SubmitButton(id: "submit-button", title: "Submit")
        .onTouch { [weak self] _ in self?.submit() }
        self.stackView.addArrangedSubview(submit)
    }
    
    func submit() {
        guard
            let email = (self.view.view(withId: "email-input") as? UITextField)?.text,
            let password = (self.view.view(withId: "password-input") as? UITextField)?.text
        else {
            return
        }
        print("Account: \(email) - \(password)")
    }
}
