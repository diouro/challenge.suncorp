//
//  ViewController.swift
//  Suncorp
//
//  Created by iMac on 28/1/18.
//  Copyright © 2018 Paulo Goncalves. All rights reserved.
//

import UIKit
import Moya

class TransactionsController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchData()
    }
    
    func fetchData (){
        
        
        let provider = MoyaProvider<ApiServer>(plugins: [NetworkLoggerPlugin(verbose: true)])
        provider.rx.request(.transactions).subscribe { event in
            switch event {
            case .success(let response):
            // do something with the data
                print("Success")
                print(response.response)
//                do{
//                    let transaction: [TransactionsModel] = try response.mapJSON() as [TransactionsModel]
//                    print(transaction)
//                }catch{
//                    print("Can't parse data")
//                }
                
            case .error(let error):
                print("Fail")
                // handle the error
                print(error)
            }
        }
        
    }
    
}

