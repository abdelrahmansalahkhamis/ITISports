//
//  HeaderView.swift
//  SportsAppITI
//
//  Created by abdrahman on 26/02/2022.
//

import UIKit

class HeaderView: UICollectionReusableView {

    @IBOutlet weak var titleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var title:String?{
        didSet{
            titleLbl.text = title
        }
    }
}
