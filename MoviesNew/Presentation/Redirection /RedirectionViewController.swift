//
//  RedirectionViewController.swift
//  MoviesNew
//
//  Created by Olga Saliy on 9/4/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import UIKit

class RedirectionViewController: UIViewController {

    var presenter: RedirectionPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = RedirectionPresenterImpl(self, ConfigurationDataProvider())
        presenter?.loadConfigurations()
    }

}

extension RedirectionViewController: RedirectionView {
    
    func show(error: String) {
        let alertController = UIAlertController(title: "Error",
                                                message: error,
                                                preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK",
                                                style: UIAlertActionStyle.default,handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func redirect(to controller: String, in storyboard: String) {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: controller) as UIViewController
        present(vc, animated: true, completion: nil)
    }
    
}
