//
//  ViewController.swift
//  fiap-beer-app
//
//  Created by Luiz Valdemar on 7/15/17.
//  Copyright © 2017 Luiz Valdemar. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UITableViewController {

    var datasource: [NSDictionary] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIController.loadBeers { value in
            self.datasource = value
            self.tableView.reloadData()
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = datasource[indexPath.row]
        let story = storyboard?.instantiateViewController(withIdentifier: "detail-storyboard") as! BeerDetailTableViewCell
        
        story.item = item
        
        navigationController?.pushViewController(story, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BeerTableViewCell
        let item = datasource[indexPath.row]
        
        row.title.text = item.value(forKey: "name") as! NSString as String
        row.detail.text = "Teor Alcoolico: \(item.value(forKey: "abv") as! NSNumber)"
        row.img.image = nil
        
        let request = URL(string: item.value(forKey: "image_url") as! NSString as String)
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: request!)
            
            DispatchQueue.main.async {
                print("resultado recebido")
                
                row.img.image = UIImage(data: data!)
            }
        }
        
        return row
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }


}

