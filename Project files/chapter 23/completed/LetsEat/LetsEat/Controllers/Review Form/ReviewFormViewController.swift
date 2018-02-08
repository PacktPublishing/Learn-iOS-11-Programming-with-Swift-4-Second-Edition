//
//  ReviewFormViewController.swift
//  LetsEat
//
//  Created by Craig Clayton on 11/16/17.
//  Copyright © 2017 Cocoa Academy. All rights reserved.
//

import UIKit

class ReviewFormViewController: UITableViewController {

    var selectedRestaurantID:Int?
    
    @IBOutlet weak var ratingView: RatingView!
    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tvReview: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}



private extension ReviewFormViewController {

    @IBAction func onSaveTapped(_ sender: Any) {
        var item = ReviewItem()
        
        item.name = tfName.text
        item.title = tfTitle.text
        item.customerReview = tvReview.text
        item.restaurantID = selectedRestaurantID
        item.rating = Float(ratingView.rating)
        
        let manager = CoreDataManager()
        manager.addReview(item)
        
        dismiss(animated: true, completion: nil)
    }
}
