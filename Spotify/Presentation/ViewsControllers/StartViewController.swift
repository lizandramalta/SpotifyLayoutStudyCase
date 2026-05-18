//
//  ViewController.swift
//  Spotify
//
//  Created by Lizandra Malta on 17/05/26.
//

import UIKit

class StartViewController: UIViewController {
    
    private lazy var scrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var logo = {
        let imageView = UIImageView(image: UIImage.logo)
        imageView.tintColor = UIColor.white
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var welcomeLabel = {
        let label = UILabel()
        label.text = "Millions of Songs.\nFree on Spotify."
        label.font = UIFont(name: "AvenirNext-Bold", size: 28)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var spacer = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var signUpButton = Button(label: "Sign up free", backgroundColor: .accent, foregroundColor: .black)
    
    private lazy var googleSocialLoginButton = Button(label: "Continue with Google", backgroundColor: .clear, foregroundColor: .white, icon: UIImage.googleLogo, borderColor: .white, borderWidth: 1)
    
    private lazy var facebookSocialLoginButton = Button(label: "Continue with Facebook", backgroundColor: .clear, foregroundColor: .white, icon: UIImage.facebookLogo, borderColor: .white, borderWidth: 1)
    
    private lazy var appleSocialLoginButton = Button(label: "Continue with Apple", backgroundColor: .clear, foregroundColor: .white, icon: UIImage(systemName: "apple.logo"), borderColor: .white, borderWidth: 1)
    
    private lazy var signInButton = Button(label: "Log in", backgroundColor: .clear, foregroundColor: .white)
    
    private lazy var stackView = {
        let stackView = UIStackView(arrangedSubviews:
                                        [
                                            logo,
                                            welcomeLabel,
                                            spacer,
                                            signUpButton,
                                            googleSocialLoginButton,
                                            facebookSocialLoginButton,
                                            appleSocialLoginButton,
                                            signInButton
                                        ]
        )
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.alignment = .center
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray300
        
        addSubviews()
        setupConstraints()
        
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubview(stackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // ScrollView
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // ContentView
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            // StackView
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            // Logo
            logo.heightAnchor.constraint(equalToConstant: 53),
            logo.widthAnchor.constraint(equalToConstant: 53),
            
            // WelcomeLabel
            welcomeLabel.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 10),
            
            // Buttons
            signUpButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 48),
            signUpButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -48),
            googleSocialLoginButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 48),
            googleSocialLoginButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -48),
            facebookSocialLoginButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 48),
            facebookSocialLoginButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -48),
            appleSocialLoginButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 48),
            appleSocialLoginButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -48),
            signInButton.topAnchor.constraint(equalTo: appleSocialLoginButton.bottomAnchor, constant: 1)
        ])
    }
    
}

#Preview {
    StartViewController()
}
