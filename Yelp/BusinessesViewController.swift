//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by  Rajiv B on 4/23/15.
//  Copyright (c) 2015  Rajiv B. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FiltersViewControllerDelegate, UISearchBarDelegate {

    var businesses: [Business]!
    var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Adding search bar
        searchBar = UISearchBar()
        searchBar.sizeToFit()
        searchBar.placeholder = "e.g. Sushi, cheeseburger"
        navigationItem.titleView = searchBar
        
        // For setting up tables rows
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        // For layouts.
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 150
        
            
        Business.searchWithTerm("Restaurants", sort: .Distance, categories: ["asianfusion"], deals: false,completion: { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            self.tableView.reloadData()
        })
    }
    
    final func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
      // Add filtering
        if searchText != "" {
          Business.searchWithTerm(searchText, sort: .Distance, categories: ["asianfusion"], deals: false,completion: { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            self.tableView.reloadData()
           })
        }
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
        //super.prepareForSegue(segue, sender: sender)
        if segue.destinationViewController is UINavigationController {
            let navigationController = segue.destinationViewController as! UINavigationController
            
            if navigationController.viewControllers[0] is FiltersViewController {
                let controller = navigationController.viewControllers[0] as! FiltersViewController
                controller.delegate = self
            }
        }
    }
    
    func getFilters() -> Dictionary<String, String> {
        var param = Dictionary<String, String>()
        for (key, value) in FilterList.instance.getParameters() {
            param[key] = value
        }
        return param
    }

    
    func onFilterSearch(controller: FiltersViewController) {
      // Call search
        var filters = getFilters()
        var deals_filter = false
        if (filters["deals_filter"] == "1") {
            deals_filter = true
        }
        var categoryList = Array(arrayLiteral: String())
        if (filters["category_filter"] != nil) {
        categoryList = Array(arrayLiteral: filters["category_filter"]!)
        }
        
        Business.searchWithTerm("Restaurants", sort: nil, categories: categoryList, deals: deals_filter) { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            self.tableView.reloadData()
        }
   }
}