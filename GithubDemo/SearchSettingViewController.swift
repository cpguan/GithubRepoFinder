//
//  SearchSettingViewController.swift
//  GithubDemo
//
//  Created by Pan Guan on 3/2/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class SearchSettingViewController: UIViewController,SettingsPresentingViewControllerDelegate {

    weak var delegate: SettingsPresentingViewControllerDelegate?
    var settings: GithubRepoSearchSettings?
    var preSetValue = 10
    
    @IBOutlet weak var miniStarSlide: UISlider!
    
    @IBOutlet weak var miniStarValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        miniStarValue.text = "\(settings!.minStars)"
        miniStarSlide.value = Float(settings!.minStars)
        preSetValue = Int(miniStarSlide.value)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func miniStarUpdate(_ sender: Any) {
        let value = Int(miniStarSlide.value)
        miniStarValue.text = "\(value)"
        settings?.minStars = value
    }
    
    @IBAction func saveSettings(_ sender: Any) {
        self.delegate?.didSaveSettings(settings: settings!)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelSettings(_ sender: Any) {
        self.delegate?.didCancelSettings()
        let preVal = preSetValue
        miniStarValue.text = "\(preVal)"
        miniStarSlide.value = Float(preVal)
        settings?.minStars = preVal
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func didSaveSettings(settings: GithubRepoSearchSettings) {
    }
    
    func didCancelSettings() {
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
