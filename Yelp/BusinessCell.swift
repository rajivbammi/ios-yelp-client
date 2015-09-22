//
//  BusinessCell.swift
//  Yelp
//
//  Created by Rajiv Bammi on 9/19/15.
//  Copyright (c) 2015 Rajiv B. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {
    //@IBOutlet weak var thumbImageView: UIView!
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var reviewCountLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    
    var business: Business! {
        didSet {
        // Setting up all values when business is changed.
        nameLabel.text = business.name
        thumbImageView.setImageWithURL(business.imageURL)
        categoriesLabel.text = business.categories
        addressLabel.text=business.address
        reviewCountLabel.text = "\(business.reviewCount!) reviews"
        distanceLabel.text = business.distance
        ratingImageView.setImageWithURL(business.ratingImageURL)
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        thumbImageView.layer.cornerRadius = 3
        thumbImageView.clipsToBounds = true
        
        // For adjusting text to next line.
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // For adjusting text to next line in different layouts.
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
