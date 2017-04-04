//
//  AircraftListVC.swift
//  Landing Distance Calculator
//
//  Created by Chetwyn on 3/7/17.
//  Copyright © 2017 Clarke Enterprises. All rights reserved.
//

import UIKit
import CoreData

class AircraftListVC: UITableViewController {
    
    var aircraft = [Aircraft]()

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTestData()
        getAircraft()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return aircraft.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AircraftCell", for: indexPath) as! AircraftListCell
        cell.configureCell(aircraft: aircraft[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedAircraft = aircraft[indexPath.row] as Aircraft
        let configurations = Array(selectedAircraft.configuration!)
        performSegue(withIdentifier: "toConfigurationListVC", sender: configurations)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? ConfigurationListVC {
            if let configuration = sender as? [Configuration] {
                destination.selectedConfigurations = configuration
            }
        }
    }
    
    func getAircraft() {
        
        let fetchRequest: NSFetchRequest<Aircraft> = Aircraft.fetchRequest()
        let typeSort = NSSortDescriptor(key: "type", ascending: true)
        let engineSort = NSSortDescriptor(key: "engine", ascending: true)
        fetchRequest.sortDescriptors = [typeSort, engineSort]
        
        do {
            self.aircraft = try context.fetch(fetchRequest)
            self.tableView.reloadData()
            
        } catch {
            
            let error = error as NSError
            print("\(error)")
        }
    }
    
    func generateTestData() {
        
        let aircraft1 = Aircraft(context: context)
        aircraft1.type = "737-700W"
        aircraft1.engine = "CFM56-7B22 (22K)"
        
        let aircraft2 = Aircraft(context: context)
        aircraft2.type = "737-700W"
        aircraft2.engine = "CFM56-7B24 (24K)"
        
        let aircraft3 = Aircraft(context: context)
        aircraft3.type = "737-800W"
        aircraft3.engine = "CFM56-7B26 (26K)"
        
        let aircraft4 = Aircraft(context: context)
        aircraft4.type = "737-800W SFP"
        aircraft4.engine = "CFM56-7B26 (26K)"
        
        let configuration1 = Configuration(context: context)
        configuration1.name = "Flaps 15"
        configuration1.type = "Normal"
        configuration1.flapSetting = ""
        configuration1.notes = "Reference distance is based on sea-level, standard day, no wind or slope, VREF15 approach speed, two-engine detent No. 2 reverse thrust, and auto-speedbrakes.\n\nFor MAX MANUAL braking and manual speedbrakes, increase landing distance by 230 ft.\n\nFor auto brake and manual speedbrakes, increase landing distance by 200 ft.\n\nReference Distance includes an air distance allowance of 1500 ft. from threshold to touchdown.\n\nAll reference distances and adjustments used have been increased by 15%."
        configuration1.addToAircraft(aircraft3)
        
        let configuration2 = Configuration(context: context)
        configuration2.name = "Flaps 40"
        configuration2.type = "Normal"
        configuration2.flapSetting = ""
        configuration2.notes = "Reference distance is based on sea-level, standard day, no wind or slope, VREF40 approach speed, two-engine detent No. 2 reverse thrust, and auto-speedbrakes.\n\nFor MAX MANUAL braking and manual speedbrakes, increase landing distance by 210 ft.\n\nFor auto brake and manual speedbrakes, increase landing distance by 170 ft.\n\nReference Distance includes an air distance allowance of 1500 ft. from threshold to touchdown.\n\nAll reference distances and adjustments used have been increased by 15%."
        configuration2.addToAircraft(aircraft3)
        
        let configuration3 = Configuration(context: context)
        configuration3.name = "Loss of System B"
        configuration3.type = "Non-Normal"
        configuration3.flapSetting = "Flaps 15"
        configuration3.notes = "Reference distance is based on sea level, standard day, no wind or slope, and maximum available reverse thrust.\n\nMAX MANUAL assumes maximum achievable manual braking.\n\nReference Distance includes an air distance allowance of 1500 ft. from threshold to touchdown.\n\nActual (unfactored) distances are shown."
        configuration3.addToAircraft(aircraft3)
        
        let configuration4 = Configuration(context: context)
        configuration4.name = "One Engine Inoperative Distance"
        configuration4.type = "Non-Normal"
        configuration4.flapSetting = "Flaps 15"
        configuration4.notes = "Reference distance is based on sea level, standard day, no wind or slope, and maximum available reverse thrust.\n\nMAX MANUAL assumes maximum achievable manual braking.\n\nReference Distance includes an air distance allowance of 1500 ft. from threshold to touchdown.\n\nActual (unfactored) distances are shown."
        configuration4.addToAircraft(aircraft3)
        
        //ad.saveContext()
        
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

}
