//
//  ViewController.swift
//  Fav books and movies
//
//  Created by Mykala Lemmons on 4/4/19.
//  Copyright © 2019 Mykala Lemmons. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
   
    var booksLoaded = false
    var booksOrMovies = 1
    
    var favMovies = ["La La Land", "The Help", "Harry Potter and the Goblet of Fire", "Harry Potter and the Half-Blood Prince"]
    var favBooks = ["1984", "Cold Mountain", "Harry Potter and the Prisoner of Azkaban",]
    
    
    @IBOutlet weak var buttonLabel: UIButton!
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var addTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if booksLoaded == false {
            return favMovies.count
        }
        if booksLoaded == true {
            return favBooks.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "favoritesTableView")
        if booksLoaded == false {
            let holderText = favMovies[indexPath.row]
            myCell?.textLabel?.text = holderText
        }
        if booksLoaded == true {
            let holderTextTwo = favBooks[indexPath.row]
            myCell?.textLabel?.text = holderTextTwo
        }
        return myCell!
    }

    @IBAction func switchButtonPressed(_ sender: Any) {
        switch booksOrMovies {
        case 1:
            booksLoaded = true
            booksOrMovies += 1
            myTableView.reloadData()
        case 2:
            booksLoaded = false
            booksOrMovies -= 1
        default:
            break
        }
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        if booksLoaded == false {
            favMovies.insert(addTextField.text ?? "blah", at: 0)
            myTableView.reloadData()
        }
        if booksLoaded == true {
            favBooks.insert(addTextField.text ?? "blah", at: 0)
            myTableView.reloadData()
        }
    }
    
    @IBAction func removeButtonPressed(_ sender: Any) {
        if booksLoaded == false {
            favMovies.removeLast()
            myTableView.reloadData()
        }
        if booksLoaded == true {
            favBooks.removeLast()
            myTableView.reloadData()
        }
    }
}

