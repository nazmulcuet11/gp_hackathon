//
//  SinglLineButtonCell.swift
//  Grameenphone
//
//  Created by Nazmul Islam on 19/12/20.
//

import UIKit

class SinglLineButtonCell: UITableViewCell {

    @IBOutlet weak var button: UIButton!
    typealias ButtonAction = () -> Void
    private var buttonAction: ButtonAction?

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(title: String, action: ButtonAction? = nil) {
        button.setTitle(title, for: .normal)
        self.buttonAction = action
    }

    @IBAction func didTapButton(_ sender: Any) {
        buttonAction?()
    }

    private func setupUI() {
        button.layer.cornerRadius = 4.0
        button.clipsToBounds = true
    }
}
