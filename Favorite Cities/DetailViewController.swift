//
//  DetailViewController.swift
//  Favorite Cities
//
//  Created by Zoe Berthold on 7/9/18.
//  Copyright © 2018 Zoe Berthold. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var populationTextField: UITextField!
    var detailItem: City? {
        didSet {
            // Update the view.
            configureView()
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureView(){
        //update the user interface for the detail item
        if let city = self.detailItem {
            if cityTextField != nil {
                cityTextField.text = city.name
                stateTextField.text = city.state
                populationTextField.text = String(city.population)
                imageView.image = UIImage(data: city.image)
                
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let city = self.detailItem{
            city.name = cityTextField.text!
            city.state = stateTextField.text!
            city.population = Int(populationTextField.text!)!
        }
    }

   

}

