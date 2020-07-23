//
//  ViewController.swift
//  Caculator
//
//  Created by Huy on 7/23/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit
enum OpetationCaculator: String {
    case Divide = "/"
    case Multiply = "*"
    case Add = "+"
    case Subtract = "-"
    case Empty = "Empty"
}
class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    // phep tinh hien tai
    var currentOperation = OpetationCaculator.Empty
    // luu so duoc chon
    var runningNumber = ""
    // so ben trai bieu thuc
    var leftValStr = ""
    // so ben phai
    var rightValStr = ""
    // luu ket qua
    var result: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func clearAction(_ sender: UIButton) {
        processOperation(operation: OpetationCaculator.Empty)
               runningNumber = ""
               result = ""
               leftValStr = ""
               rightValStr = ""
               resultLabel.text = "0"
    }
    
    
    
    @IBAction func equalAction(_ sender: UIButton) {
        processOperation(operation: currentOperation)
    }
   
    
    @IBAction func addAction(_ sender: UIButton) {
        
        processOperation(operation: OpetationCaculator.Add)
    }

    @IBAction func subAction(_ sender: UIButton) {
        processOperation(operation: OpetationCaculator.Subtract)
    }
    
    
    @IBAction func mulAction(_ sender: UIButton) {
        processOperation(operation: OpetationCaculator.Multiply)
    }
    
    
    @IBAction func divideAction(_ sender: UIButton) {
        processOperation(operation: OpetationCaculator.Divide)
    }
    
    @IBAction func numberAction(_ sender: UIButton) {
        runningNumber += "\(sender.tag)"
        print(sender.tag)
        resultLabel.text = runningNumber
    }
    
    
    func processOperation(operation: OpetationCaculator){
        if currentOperation != OpetationCaculator.Empty{
            // nếu có phép tính được chọn thì nhảy vào đây
            if runningNumber != "" {
                // nếu sau biểu thức là số thì nhảy vào đây
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == OpetationCaculator.Multiply {
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                } else if currentOperation == OpetationCaculator.Divide {
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                } else if currentOperation == OpetationCaculator.Subtract {
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                } else if currentOperation == OpetationCaculator.Add {
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                }
                
                leftValStr = result
                resultLabel.text = result
            }
        }else{ // nếu không có phép tính được chọn thì nhảy vào đây
            leftValStr = runningNumber
            runningNumber = ""
        }
        currentOperation = operation
    }
    
}

