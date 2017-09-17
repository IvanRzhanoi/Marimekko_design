//
//  ClothingStyleTableViewController.swift
//  MarimekkoDesigApp
//
//  Created by Ivan Rzhanoi on 16/09/2017.
//  Copyright © 2017 Ivan Rzhanoi. All rights reserved.
//

import UIKit

class ClothingStyleTableViewController: UITableViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    var myStyles = [Data]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        loadSampleData()
        self.myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.myStyles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClothingStyleTableViewCell", for: indexPath) as! ClothingStyleTableViewCell

        // Configure the cell...

        DispatchQueue.main.async {
            // Fetches the appropriate styles for the data source layout.
            let style = self.myStyles[indexPath.row]
            
            
            
            if let image = style.clothingStyle {
                cell.clothingStyle.image = image
            }
            
            if let image = style.clothingStyle {
                cell.clothingStyle.image = image
            }
        }
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    private func loadSampleData() {
        let photo1 = #imageLiteral(resourceName: "image1.jpg")
        let photo2 = #imageLiteral(resourceName: "image2.jpg")
        let photo3 = #imageLiteral(resourceName: "image3.jpg")
        let photo4 = #imageLiteral(resourceName: "image4.jpg")
        let photo5 = #imageLiteral(resourceName: "image5.jpg")
        
        guard let style1 = Data(clothingStyle: photo1) else {
            fatalError("Unable to instantiate 1st Clothing Style")
        }
        
        guard let style2 = Data(clothingStyle: photo2) else {
            fatalError("Unable to instantiate 2nd Clothing Style")
        }
        
        guard let style3 = Data(clothingStyle: photo3) else {
            fatalError("Unable to instantiate 3rd Clothing Style")
        }
        
        guard let style4 = Data(clothingStyle: photo4) else {
            fatalError("Unable to instantiate 4th Clothing Style")
        }
        
        guard let style5 = Data(clothingStyle: photo5) else {
            fatalError("Unable to instantiate 5th Clothing Style")
        }
        
        myStyles += [style1, style2, style3, style4, style5]
    }
}
