//
//  DetailViewController.swift
//  CollectionViewExample
//
//  Created by Tibor Bödecs on 2018. 04. 13..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import UIKit

class AlbumViewController: CollectionViewController {
    
    var album: AlbumModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.title = self.album.artist

        let songs = Array<SongModel>(repeating: .init(name: "Lorem ipsum dolor sit amet", duration: "04:13"), count: 12)
        let items = songs.map { SongViewModel($0) }
        let separator = SeparatorViewModel(.init())
        let separatedSongViewModels: [ViewModelProtocol] = Array(items.map { [$0] }.joined(separator: [separator]))
        
        let grid = Grid(columns: 1, margin: UIEdgeInsets(all: 8))
        self.collectionView.source = .init(grid: grid, [
            [
                AlbumViewModel(self.album)
            ],
            [
                HeaderViewModel(.init(title: "Songs"))
            ],
            separatedSongViewModels,
        ])
        self.collectionView.reloadData()
    }
    
}
