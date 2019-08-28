//
//  CollectionViewCell.swift
//  SelfSizing
//
//  Created by Tibor Bodecs on 04/08/16.
//  Copyright © 2016 Tibor Bodecs. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    weak var dynamicLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel(frame: self.bounds)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.backgroundColor = UIColor.darkGray
        label.numberOfLines = 0
        label.preferredMaxLayoutWidth = frame.size.width
        
        self.contentView.addSubview(label)
        self.dynamicLabel = label

        NSLayoutConstraint.activate([
            self.contentView.topAnchor.constraint(equalTo: self.dynamicLabel.topAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: self.dynamicLabel.bottomAnchor),
            self.contentView.leadingAnchor.constraint(equalTo: self.dynamicLabel.leadingAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: self.dynamicLabel.trailingAnchor),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.dynamicLabel.font = UIFont.preferredFont(forTextStyle: .body)
    }

    func setPreferred(width: CGFloat) {
        self.dynamicLabel.preferredMaxLayoutWidth = width
    }
}
