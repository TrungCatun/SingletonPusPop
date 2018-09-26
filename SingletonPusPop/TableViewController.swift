//
//  TableViewController.swift
//  SingletonPusPop
//
//  Created by trung on 2018/08/20.
//  Copyright © 2018 trung. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet var noDataView: UIView!
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var outletButtonAdd: UIBarButtonItem!
    
    var hasNoData = true {
        didSet {
            hasNoData ? (tableView.tableFooterView = noDataView) : (tableView.tableFooterView = footerView)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        hasNoData = Singleton.inSingleton.array.count == 0
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        hasNoData = Singleton.inSingleton.array.count == 0
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Singleton.inSingleton.array.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = Singleton.inSingleton.array[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Singleton.inSingleton.array.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            hasNoData = Singleton.inSingleton.array.count == 0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Singleton.inSingleton.index = indexPath.row
        //Singleton.inSingleton.add = false
        if let toDetail = storyboard?.instantiateViewController(withIdentifier: "idDetailViewController") as? DetailViewController {
            navigationController?.pushViewController(toDetail, animated: true)
        }
    }
    
    
    @IBAction func buttonAddTableView(_ sender: Any) {
        Singleton.inSingleton.add = true
        if let vc = storyboard?.instantiateViewController(withIdentifier: "idDetailViewController") as? DetailViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
 


}
