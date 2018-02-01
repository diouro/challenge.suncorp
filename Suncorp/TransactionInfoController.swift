//
//  TransactionInfoController.swift
//  Suncorp
//
//  Created by iMac on 1/2/18.
//  Copyright © 2018 Paulo Goncalves. All rights reserved.
//

import UIKit

class TransactionInfoController: UIViewController {
    
    @IBOutlet weak var lblEffectiveDate: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblAmount: UILabel!
    
    var transaction: TransactionsModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        lblEffectiveDate.text = transaction.effectiveDate!
        lblDescription.text = transaction.description!
        lblAmount.text = String.init(format: "%2.f", transaction.amount!)
        
    }
    
    @IBAction func Back(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let transactionDetail = storyboard.instantiateViewController(withIdentifier: "TransactionsController") as! TransactionsController
        transactionDetail.modalTransitionStyle = UIModalTransitionStyle.partialCurl
        self.present(transactionDetail, animated: true, completion: nil)
    }
    
    
}
