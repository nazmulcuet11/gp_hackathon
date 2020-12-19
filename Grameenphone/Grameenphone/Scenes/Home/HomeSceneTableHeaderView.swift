//
//  HomeSceneTableHeaderView.swift
//  Grameenphone
//
//  Created by Nazmul Islam on 19/12/20.
//

import UIKit

class HomeSceneTableHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var titleLabel: UILabel!

    func setTitle(_ title: String) {
        titleLabel.text = title.uppercased()
    }
}
