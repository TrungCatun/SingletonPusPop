//
//  ViewController.swift
//  SingletonPusPop
//
//  Created by trung on 2018/08/20.
//  Copyright © 2018 trung. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var textFieldDetailViewController: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        if Singleton.inSingleton.add != true {
           textFieldDetailViewController.text = Singleton.inSingleton.array[Singleton.inSingleton.index]
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func buttonDetailViewController(_ sender: Any) {
        
        if Singleton.inSingleton.add == true {
            Singleton.inSingleton.array.append(textFieldDetailViewController.text ?? "")
        }
        else {
        Singleton.inSingleton.array[Singleton.inSingleton.index] = textFieldDetailViewController.text ?? ""
        }
        navigationController?.popViewController(animated: true)
        
        
    }
    
    

}

