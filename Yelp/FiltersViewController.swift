//
//  FiltersViewController.swift
//  Yelp
//
//  Created by Rajiv Bammi on 9/22/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

 protocol FiltersViewControllerDelegate {
    func onFilterSearch(controller: FiltersViewController)
}

class FiltersViewController: UITableViewController {
    var model: FilterList?
    var delegate: FiltersViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("inside function viewDidLoad")
        self.tableView.rowHeight = UITableViewAutomaticDimension
        //self.model = FilterList(objInstance: FilterList.instance)
        self.model = FilterList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
       return self.model!.filters.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Tells the data source to return the number of rows in a given section of a table view.
        let filter = self.model!.filters[section] as Filter
        if !filter.opened {
            if filter.numItemsVisible > 0 && filter.numItemsVisible < filter.options.count {
                return filter.numItemsVisible! + 1
            }
        }
        return filter.options.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Asks the data source for a cell to insert in a particular location of the table view.
       let mySelectedColor = UIColor(
            red:0.5,
            green:0.5,
            blue:0.5,
            alpha:1.0)
        
        let myUnSelectedColor = UIColor(
            red:1.0,
            green:1.0,
            blue:1.0,
            alpha:1.0)
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        let filter = self.model!.filters[indexPath.section] as Filter
      
        switch filter.type {
        case .Multiple:
            if indexPath.row == 0 {
                let option = filter.options[indexPath.row]
                cell.textLabel!.text = filter.label
                cell.textLabel!.textColor = .lightGrayColor()
            }
            else if filter.opened || indexPath.row < filter.numItemsVisible {
                let option = filter.options[indexPath.row]
                cell.textLabel!.text = option.label
                if option.selected {
                   cell.backgroundColor = mySelectedColor
                   cell.accessoryView = UIImageView(image: UIImage(named: "Check"))
                } else {
                    cell.accessoryView = UIImageView(image: UIImage(named: "Uncheck"))
                    cell.backgroundColor = myUnSelectedColor
                }
            } else {
                cell.textLabel!.text = "See All>>"
                cell.textLabel!.textColor = .lightGrayColor()
            }
        default:
            let option = filter.options[indexPath.row]
            cell.textLabel!.text = option.label
            let switchView = UISwitch(frame: CGRectZero)
            switchView.on = option.selected
            switchView.addTarget(self, action: "handleSwitchValueChanged:", forControlEvents: UIControlEvents.ValueChanged)
            cell.accessoryView = switchView
            
        }
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Tells that specific row is selected now.
        let filter = self.model!.filters[indexPath.section]
        switch filter.type {
        case .Multiple:
            if !filter.opened && (indexPath.row == indexPath.length + 2){
                filter.opened = true
                self.tableView.reloadSections(NSMutableIndexSet(index: indexPath.section), withRowAnimation: .Automatic)
            } else {
                let option = filter.options[indexPath.row]
                option.selected = !option.selected
                self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
        default:
            break
        }
    }

    func handleSwitchValueChanged(switchView: UISwitch) -> Void {
        let cell = switchView.superview as! UITableViewCell
        
        if let indexPath = self.tableView.indexPathForCell(cell) {
            let filter = self.model!.filters[indexPath.section] as Filter
            let option = filter.options[indexPath.row]
            option.selected = switchView.on
        }
    }

    @IBAction func onCancelButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onSearchButton(sender: AnyObject) {
        FilterList.instance.createSelectionCopy(self.model!)
        self.dismissViewControllerAnimated(true, completion: nil)
        self.delegate?.onFilterSearch(self)
    }

}
