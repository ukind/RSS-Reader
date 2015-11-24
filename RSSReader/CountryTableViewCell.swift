//
//  CountryTableViewCell.swift
//  RSSReader
//
//  Created by Yogiswara Utama on 7/14/15.
//  Copyright (c) 2015 RssReader. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var imageSites: UIImageView!
    
    @IBOutlet weak var sitesTItle: UILabel!
    
    @IBOutlet weak var sitesInfo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
