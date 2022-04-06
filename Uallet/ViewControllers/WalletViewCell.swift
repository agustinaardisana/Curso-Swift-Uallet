//
//  WalletViewCell.swift
//  Uallet
//
//  Created by Agustina Ardisana on 05/04/2022.
//

import UIKit

class WalletViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var lblSaldo: UILabel!
    @IBOutlet weak var lblMoneda: UILabel?
    @IBOutlet weak var lblNombre: UILabel!
}
