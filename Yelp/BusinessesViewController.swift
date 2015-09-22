//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by  Rajiv B on 4/23/15.
//  Copyright (c) 2015  Rajiv B. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FiltersViewControllerDelegate {

    var businesses: [Business]!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // For setting up tables rows
        tableView.delegate = self
        tableView.dataSource = self
        
        // For layouts.
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
            
        Business.searchWithTerm("Restaurents", completion: { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            self.tableView.reloadData()
            for business in businesses {
                println(business.name!)
                println(business.address!)
            }
        })
        
        /*Business.searchWithTerm("Restaurants", sort: .Distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            self.tableView.reloadData()

            for business in businesses {
                print(business.name!)
                print(business.address!)
            }
        }*/
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if businesses != nil {
            return businesses!.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        var cell = tableView.dequeueReusableCellWithIdentifier("BusinessCell",forIndexPath: indexPath) as! BusinessCell
        
        cell.business = businesses[indexPath.row]
        
       return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       let navigationController = segue.destinationViewController as! UINavigationController
       let filtersViewController = navigationController.topViewController as! FiltersViewController
        
       filtersViewController.delegate = self
    }

    func filtersViewController(filtersViewController: FiltersViewController, didUpdateFilters filters: [String : AnyObject]) {
        var categories = filters["categories"] as? [String]
        
        Business.searchWithTerm("Restaurents", sort: .Distance, categories: categories, deals: true) { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            self.tableView.reloadData()
            
        }
    }
}
