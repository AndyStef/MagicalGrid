//
//  SpecialityViewController.swift
//  Techmed
//
//  Created by Stef on 5/12/17.
//  Copyright © 2017 Stef. All rights reserved.
//

import UIKit

class SpecialityViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.frame = CGRect(x: 0, y: 0, width: 120, height: 35)
        navigationItem.titleView = imageView
        scrollView.contentSize = CGSize(width: view.frame.width, height: 1000)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        return cell
    }
}
