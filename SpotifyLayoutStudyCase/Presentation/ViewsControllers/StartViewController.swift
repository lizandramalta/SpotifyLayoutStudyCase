//
//  ViewController.swift
//  SpotifyLayoutStudyCase
//
//  Created by Lizandra Malta on 17/05/26.
//

import UIKit

class StartViewController: UIViewController {
    
    private var logoCenterYConstraint: NSLayoutConstraint?
    private var logoTopConstraint: NSLayoutConstraint?
    
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
        label.text = "Millions of Songs.\nFree on Spotify"
        
        let baseFont =
            UIFont(name: "AvenirNext-Bold", size: 28) ??
            UIFont.systemFont(ofSize: 28, weight: .bold)
        label.font = UIFontMetrics(forTextStyle: .title1)
            .scaledFont(for: baseFont)
        label.adjustsFontForContentSizeCategory = true
        
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var signUpButton = {
        let button = Button(label: "Sign up free", backgroundColor: .accent, foregroundColor: .black)
        
        button.addTarget(self, action: #selector(goToAlbumView), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var googleSocialLoginButton = Button(label: "Continue with Google", backgroundColor: .clear, foregroundColor: .white, icon: UIImage.googleLogo, borderColor: .white, borderWidth: 1)
    
    private lazy var facebookSocialLoginButton = Button(label: "Continue with Facebook", backgroundColor: .clear, foregroundColor: .white, icon: UIImage.facebookLogo, borderColor: .white, borderWidth: 1)
    
    private lazy var appleSocialLoginButton = Button(label: "Continue with Apple", backgroundColor: .clear, foregroundColor: .white, icon: UIImage(systemName: "apple.logo"), borderColor: .white, borderWidth: 1)
    
    private lazy var signInButton = Button(label: "Log in", backgroundColor: .clear, foregroundColor: .white)
    
    private lazy var stackView = {
        let stackView = UIStackView(arrangedSubviews:
                                        [
                                            signUpButton,
                                            googleSocialLoginButton,
                                            facebookSocialLoginButton,
                                            appleSocialLoginButton,
                                            signInButton
                                        ]
        )
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.alignment = .fill
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(
            top: 0,
            leading: 48,
            bottom: 0,
            trailing: 48
        )
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray300
        
        addSubviews()
        setupConstraints()
        updateLayoutForOrientation()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        updateLayoutForOrientation()
    }
    
    @objc func goToAlbumView() {
        let nextScreen = AlbumViewController()
        navigationController?.pushViewController(nextScreen, animated: true)
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubview(logo)
        contentView.addSubview(welcomeLabel)
        contentView.addSubview(stackView)
    }
    
    private func updateLayoutForOrientation() {
        let isLandscape = view.bounds.width > view.bounds.height
        
        logoCenterYConstraint?.isActive = !isLandscape
        logoTopConstraint?.isActive = isLandscape
    }
    
    private func setupConstraints() {
        
        logoCenterYConstraint = logo.centerYAnchor.constraint(
            equalTo: contentView.centerYAnchor,
            constant: -50
        )

        logoTopConstraint = logo.topAnchor.constraint(
            equalTo: contentView.safeAreaLayoutGuide.topAnchor,
            constant: 32
        )
        
        logoCenterYConstraint?.isActive = true
        
        NSLayoutConstraint.activate([
            // ScrollView
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // ContentView
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.frameLayoutGuide.heightAnchor),
            
            // Logo
            logo.heightAnchor.constraint(equalToConstant: 53),
            logo.widthAnchor.constraint(equalToConstant: 53),
            logo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            // WelcomeLabel
            welcomeLabel.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 10),
            welcomeLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            // StackView
            stackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 22),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
}
