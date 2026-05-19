//
//  AlbumViewController.swift
//  SpotifyLayoutStudyCase
//
//  Created by Ana Luisa Teixeira Coleone Reis on 19/05/26.
//

import UIKit

class AlbumViewController: UIViewController {
    
    let beatlesSongs = [
        "Love Me Do",
        "From Me to You",
        "She Loves You",
        "I Want to Hold Your Hand",
        "Can't Buy Me Love",
        "A Hard Day's Night",
        "I Feel Fine",
        "Eight Days a Week",
        "Ticket to Ride",
        "Help!",
        "Yesterday",
        "Day Tripper",
        "We Can Work It Out",
        "Paperback Writer",
        "Yellow Submarine",
        "Eleanor Rigby",
        "Penny Lane",
        "All You Need Is Love",
        "Hello, Goodbye",
        "Lady Madonna",
        "Hey Jude",
        "Get Back",
        "The Ballad of John and Yoko",
        "Something",
        "Come Together",
        "Let It Be",
        "The Long and Winding Road"
    ]
    
    let gradient = CAGradientLayer()
    
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.separatorStyle = .none
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradient()
        
        homeFeedTable.backgroundColor = .clear
        
        addSubviews()
        
        homeFeedTable.register(
            MusicTableViewCell.self,
            forCellReuseIdentifier: MusicTableViewCell.identifier
        )
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
                
        let headerView = AlbumHeaderUIView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: view.bounds.width,
                height: 0
            )
        )
        
        homeFeedTable.tableHeaderView = headerView
    }
    
    private func addSubviews() {
        view.addSubview(homeFeedTable)
    }
    
    private func setupGradient() {
        
        gradient.colors = [
            UIColor.backgroundGradientStart.cgColor,
            UIColor.backgroundGradientSecond.cgColor,
            UIColor.backgroundGradientThird.cgColor,
            UIColor.gray300.cgColor,
        ]
        
        gradient.locations = [0.0, 0.4, 0.7, 1.0]
        
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
        gradient.frame = view.bounds
        
        guard let headerView = homeFeedTable.tableHeaderView else {
            return
        }
        
        let targetSize = CGSize(
            width: homeFeedTable.bounds.width,
            height: UIView.layoutFittingCompressedSize.height
        )
        
        let calculatedSize = headerView.systemLayoutSizeFitting(targetSize)
        
        if headerView.frame.height != calculatedSize.height {
            
            headerView.frame.size.height = calculatedSize.height
            
            homeFeedTable.tableHeaderView = headerView
        }
        
    }

}

extension AlbumViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beatlesSongs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MusicTableViewCell.identifier, for: indexPath) as? MusicTableViewCell else {
            return UITableViewCell()
        }
        
        let musicName = beatlesSongs[indexPath.row]
        
        cell.setupCell(musicName: musicName)
        
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
}

