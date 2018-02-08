//
//  PhotoFilterViewController+UIDropInteraction.swift
//  LetsEat
//
//  Created by Craig Clayton on 1/28/18.
//  Copyright © 2018 Cocoa Academy. All rights reserved.
//

import Foundation
import UIKit

extension PhotoFilterViewController: UIDropInteractionDelegate {
    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        if session.localDragSession == nil {
            return session.canLoadObjects(ofClass: UIImage.self)
        }
        else { return session.canLoadObjects(ofClass: FilterItem.self) }
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        let operation: UIDropOperation
        
        if session.localDragSession == nil {
            operation = .copy
        }
        else { operation = .copy }
        
        return UIDropProposal(operation: operation)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        if session.localDragSession == nil {
            for dragItem in session.items {
                loadImage(dragItem.itemProvider)
            }
        }
        else {
            for dragItem in session.items {
                let itemProvider = dragItem.itemProvider
                itemProvider.loadObject(ofClass: FilterItem.self) { (object, error) in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        DispatchQueue.main.async {
                            if let item = object as? FilterItem {
                                print("filter \(item.filter)")
                                self.filterSelected(item: item)
                            }
                        }
                    }
                }
            }
        }
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, previewForDropping item: UIDragItem, withDefault defaultPreview: UITargetedDragPreview) -> UITargetedDragPreview? {
        if item.localObject == nil {
            return nil
        } else {
            let target = UIDragPreviewTarget(container: view, center: imgExample.center)
            return defaultPreview.retargetedPreview(with: target)
        }
    }
}
