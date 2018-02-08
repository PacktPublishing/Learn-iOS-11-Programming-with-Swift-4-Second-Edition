//
//  PhotoFilterViewController+UICollectionViewDrag.swift
//  LetsEat
//
//  Created by Craig Clayton on 1/28/18.
//  Copyright © 2018 Cocoa Academy. All rights reserved.
//

import Foundation

extension PhotoFilterViewController: UICollectionViewDragDelegate {
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let itemProvider = NSItemProvider(object: data[indexPath.item])
        let dragItem = UIDragItem(itemProvider: itemProvider)
        
        return [dragItem]
    }
}
