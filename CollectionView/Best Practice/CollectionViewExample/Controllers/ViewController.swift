//
//  ViewController.swift
//  CollectionViewExample
//
//  Created by Tibor Bödecs on 2018. 04. 16..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import UIKit

class ViewController: CollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "🤘🏼 Metal 🤘🏼"
    
        let albums = [
            AlbumModel(artist: "August Burns Red", name: "Constellations", image: "01"),
            AlbumModel(artist: "Breakdown of Sanity", name: "Mirrors", image: "02"),
            AlbumModel(artist: "Currents", name: "The place I feel safest", image: "03"),
            AlbumModel(artist: "Make Them Suffer", name: "Neverbloom", image: "04"),
            AlbumModel(artist: "Parkway Drive", name: "Reverence", image: "05"),
            AlbumModel(artist: "The Haunted", name: "Exit wounds", image: "06"),
            AlbumModel(artist: "Upon a Burning Body", name: "Red White Green", image: "07"),
            AlbumModel(artist: "Whitechapel", name: "Our endless war", image: "08"),
        ]
        
        let grid = Grid(columns: 4, margin: UIEdgeInsets(all: 8), padding: .zero)
        
        let artistSection = Section(items: [self.createHorizontalArtistSection()])
        artistSection.header = HeaderViewModel(.init(title: "Top metal artists"))

        let header = HeaderViewModel(.init(title: "Top metal albums"))
        let items = albums.map { [weak self] album in
            AlbumViewModel(album)
            .onSelect { [weak self] viewModel in
                let viewController = AlbumViewController(nibName: nil, bundle: nil)
                viewController.album = viewModel.model
                self?.show(viewController, sender: nil)
            }
        }
        let albumSection = Section(grid: grid, header: header, items: items)
        
        self.collectionView.source = .init(grid: grid, sections: [artistSection, albumSection])
        self.collectionView.reloadData()
    }
    
    func createHorizontalArtistSection() -> CollectionViewModel {
        let artists = [
            ArtistModel(name: "August Burns Red", image: "a01"),
            ArtistModel(name: "Breakdown of Sanity", image: "a02"),
            ArtistModel(name: "Currents", image: "a03"),
            ArtistModel(name: "Make Them Suffer", image: "a04"),
            ArtistModel(name: "Parkway Drive", image: "a05"),
            ArtistModel(name: "The Haunted", image: "a06"),
            ArtistModel(name: "Upon a Burning Body", image: "a07"),
            ArtistModel(name: "Whitechapel", image: "a08"),
        ]

        let items = artists.map { [weak self] artist in
            HorizontalArtistViewModel(artist).onSelect { [weak self] viewModel in
                let viewController = ArtistViewController(nibName: nil, bundle: nil)
                viewController.artist = artist
                self?.show(viewController, sender: nil)
            }
        }

        let grid = Grid(columns: 4, margin: UIEdgeInsets(all: 8))
        let section = Section(items: items)
        let source  = Source(grid: grid, sections: [section])

        return CollectionViewModel(.init(source: source))
    }
}
