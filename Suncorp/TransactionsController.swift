//
//  ViewController.swift
//  Suncorp
//
//  Created by iMac on 28/1/18.
//  Copyright © 2018 Paulo Goncalves. All rights reserved.
//

import UIKit
import Moya

class TransactionsController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tblContent: UITableView!
    @IBOutlet weak var lblBalance: UILabel!
    
    var listTransaction = [TransactionsModel]()
    var currentBalance: Double = 0
    var balance: Double = 0
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchData()
    }
    
    func fetchData (){
        
        ApiHelper.request(target: .transactions, success: { (response) in
            do{
                
                // Get list of transactions
                self.listTransaction = try JSONDecoder().decode([TransactionsModel].self, from: response.data)
                
                // Started to implement the sort date
//                self.listTransaction = self.listTransaction.sorted(by: { $0.date!.compare($1.date!) == .orderedDescending})
                
                // Get the total amount based on the transactions
                self.currentBalance = TransactionsModel.getBalance(transactions: self.listTransaction)
                self.lblBalance.text =  String.init(format: "%.2f", self.currentBalance)
                
                self.tblContent.reloadData()
                
            }catch{
                print("error parsing data")
            }
        }, error: { (error) in
            print(error)
        }) { (error) in
            print(error.localizedDescription)
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listTransaction.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CellModel = self.tblContent.dequeueReusableCell(withIdentifier: "cell") as! CellModel
        
        let transaction: TransactionsModel = self.listTransaction[indexPath.row]
        
        cell.lblDescription.text = transaction.description
        cell.lblAmount.text = String.init(format: "%.2f", transaction.amount!)
        cell.lblEffectiveDate.text = transaction.effectiveDate!
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

