//
//  BeerDetailTableViewCell.swift
//  fiap-beer-app
//
//  Created by Luiz Valdemar on 7/15/17.
//  Copyright © 2017 Luiz Valdemar. All rights reserved.
//

import UIKit

class BeerDetailTableViewCell: UIViewController {

    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var phrase: UILabel!
    @IBOutlet weak var descricao: UITextView!
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var teor: UILabel!
    @IBOutlet weak var amargor: UILabel!
    
    var item : NSDictionary = [:]
    
    override func viewDidLoad() {
        titulo.text = item.value(forKey: "name") as! NSString as String
        phrase.text = item.value(forKey: "tagline") as! NSString as String
        descricao.text = item.value(forKey: "description") as! NSString as String
        
        teor.text = "\(item.value(forKey: "abv") as! NSNumber)"
        amargor.text = "\(item.value(forKey: "ibu") as! NSNumber)"
        
        let request = URL(string: item.value(forKey: "image_url") as! NSString as String)
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: request!)
            
            DispatchQueue.main.async {
                self.img.image = UIImage(data: data!)
            }
        }
    }
    
}
