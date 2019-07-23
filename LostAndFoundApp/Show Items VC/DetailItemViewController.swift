//
//  DetailItemViewController.swift
//  LostAndFoundApp
//
//  Created by vipul garg on 2019-07-23.
//  Copyright © 2019 Nayna. All rights reserved.
//

import UIKit

class DetailItemViewController: UIViewController {

    var name = ""
    var category = ""
    var dol = ""
    var reward = ""
    var descpt = ""
    var place = ""
    var image = UIImage()
    
    
    
    @IBOutlet weak var category_txt: UILabel!
    @IBOutlet weak var dol_txt: UILabel!
    @IBOutlet weak var rwd_txt: UILabel!
    @IBOutlet weak var descp_txt: UILabel!
    @IBOutlet weak var place_txt: UILabel!
    @IBOutlet weak var name_txt: UILabel!
    @IBOutlet weak var imageIV: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.imageIV.image = image
        self.name_txt.text = name
        self.descp_txt.text = descpt
        self.category_txt.text = category
        self.dol_txt.text = dol
        self.rwd_txt.text = reward
        
        
        
        /*
        itemName = Products.dictOfProducts[indexPath.row]!.productsName
        
        performSegue(withIdentifier: "detailVC", sender: self)
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "detail1VC"){
            var vc = segue.destination as! DetailItemViewController
            
            vc.asdas = self.itemName
        }
       */
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
