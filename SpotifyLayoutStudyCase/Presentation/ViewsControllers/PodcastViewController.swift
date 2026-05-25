//
//  PodcastViewController.swift
//  SpotifySwiftUI
//
//  Created by Nicole Dias on 21/05/26.
//

import UIKit
import SwiftUI

class PodcastsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       //instancia minha view
        let swiftUIView = ChoosePodcastsView()
        
       //coloca dentro de um hosting controller
        let hostingController = UIHostingController(rootView: swiftUIView)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        addChild(hostingController)
        
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        hostingController.view.backgroundColor = .clear
        view.backgroundColor = .background
    }
}
