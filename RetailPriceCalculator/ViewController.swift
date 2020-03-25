//
//  ViewController.swift
//  RetailPriceCalculator
//
//  Created by Maulana on 24/03/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buyPriceText: UITextField!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var profitSliderLabel: UILabel!
    @IBOutlet weak var profitSlider: UISlider!
    
    var buyPrice = ""
    var nominalPrice = 0.0
    var valueProfit = 0.0
    var labelValueProfit = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func price() {
        buyPrice = buyPriceText.text ?? ""
        nominalPrice = Double(buyPrice) ?? 0.0
        captionLabel.alpha = 1
        resultLabel.alpha = 1
    }
    
    func valueSlider() {
        profitSliderLabel.text = "\(Int(valueProfit)) %"
        labelValueProfit = profitSliderLabel.text ?? ""
    }
    
    func updateValueSlider(value: Int) {
        profitSlider.value = Float(value)
    }
    
    @IBAction func sliderProfit(_ sender: UISlider) {
           price()
           valueSlider()
           valueProfit = Double(sender.value)
           let valueSlider = String(format: "%.2f", valueProfit)
           let result = nominalPrice * (1+(valueProfit / 100.0))
           let resultProfit = String(format: "%.2f", result)
           captionLabel.text = "Harga Beli \(buyPrice) \rKeuntungan yang Di Inginkan \(valueSlider) %"
            resultLabel.text = "Harga Jual =  \(resultProfit)"
           
       }
    
    @IBAction func lowRateButton(_ sender: UIButton) {
        price()
        updateValueSlider(value: 25)
        profitSliderLabel.text = "\(sender.tag) %"
       
        let result = nominalPrice * 1.25
        let resultProfit = String(format: "%.0f", result)
        captionLabel.text = "Harga Beli \(buyPrice) \rKeuntungan yang Di Inginkan \(sender.tag) %"
        resultLabel.text = "Harga Jual =  \(resultProfit)"
    }
    
    
    @IBAction func medRateButton(_ sender: UIButton) {
        price()
        updateValueSlider(value: 50)
        profitSliderLabel.text = "\(sender.tag) %"
        let result = nominalPrice * 1.5
        let resultProfit = String(format: "%.0f", result)
        captionLabel.text = "Harga Beli \(buyPrice) \rKeuntungan yang Di Inginkan \(sender.tag) %"
        resultLabel.text = "Harga Jual =  \(resultProfit)"
    }
    
    @IBAction func highRateButton(_ sender: UIButton) {
        price()
        updateValueSlider(value: 75)
        profitSliderLabel.text = "\(sender.tag) %"
        let result = nominalPrice * 1.75
        let resultProfit = String(format: "%.0f", result)
        captionLabel.text = "Harga Beli \(buyPrice) \rKeuntungan yang Di Inginkan \(sender.tag) %"
        resultLabel.text = "Harga Jual =  \(resultProfit)"
    }
          
}
    

