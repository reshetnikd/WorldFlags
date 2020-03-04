//
//  ViewController.swift
//  WorldFlags
//
//  Created by Dmitry Reshetnik on 27.02.2020.
//  Copyright © 2020 Dmitry Reshetnik. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var countries = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let fm = FileManager.default
//        let path = Bundle.main.resourcePath!
//        let items = try! fm.contentsOfDirectory(atPath: path)
//
//        for item in items {
//            if item.hasSuffix("@3x.png") {
//                countries.append(item)
//            }
//        }
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        title = "World Flags"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row].count <= 2 ? countries[indexPath.row].uppercased() : countries[indexPath.row].capitalized
        cell.imageView?.image = UIImage(named: countries[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.country = tableView.cellForRow(at: indexPath)?.textLabel?.text
            vc.flag = countries[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }


}

