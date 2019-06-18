//
//  ViewController.swift
//  Calculator
//
//  Created by Sabir Ahmed on 5/14/19.
//  Copyright © 2019 Sabir Ahmed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let PLUS = 10
    let MINUS = 11
    let MULTIPLY = 12
    let DIVIDE = 13
    
    @IBOutlet weak var  lblText : UILabel?
    
    var num1 : NSInteger = 0
    var num2 : NSInteger = 0
    var operand : NSInteger = 0
    var answer : Double = 0.0
    var cNum : NSInteger = 0
    var flag: Bool = false
    var digit: Bool = false
    
    var theNumber : String = "0"
    var pNum : Int = 0
    
    @IBAction func calculate(sender : UIButton){
        
        if flag == false {
            num2 = Int(theNumber)!
            flag = true
        }

        if operand == PLUS{
            answer = Double(cNum + Int(theNumber)!)
            theNumber = String(answer)
            printNumber()
            cNum = Int(answer)
            
        }
        
        if operand == MINUS{
            answer = Double(cNum - Int(theNumber)!)
            theNumber = String(answer)
            printNumber()
            cNum = Int(answer)
            
        }
        
        if operand == MULTIPLY{
            answer = Double(cNum * Int(theNumber)!)
            theNumber = String(answer)
            printNumber()
            cNum = Int(answer)
        }
        
        if operand == DIVIDE{
            
            if Int(theNumber) == 0{
                
                let alert = UIAlertController(title: "Error", message: "Can't devide by zero", preferredStyle: .alert)
                
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                
                alert.addAction(cancelAction)
                present(alert, animated: true)
                
                
            }else{
                answer = Double((cNum) / Int(theNumber)!)
                theNumber = String(answer)
                printNumber()
                cNum = Int(answer)
            }
        }
        num1 = cNum
        num2 = 0
        // Default operand is plus
        operand = PLUS
        theNumber = String(answer)
        printNumber()
        
        answer = 0.0
        theNumber = "0"
        
    }
    
    @IBAction func setOperand(sender : UIButton){
        
        print("operand number in equal to:", operand)
        
        if sender.tag >= 10 && sender.tag <=  13{
            operand = sender.tag
            saveNum1(id: cNum)
            
        }
        
        if sender.tag == -2{
            theNumber = "0"
            flag = false
            cNum = 0
            operand = PLUS
            printNumber()
        }
        
        
    }
    
    
    
    func saveNum1( id: Int){
        if flag == false {
            num1 = Int(theNumber)!
            flag = true
        }else
        {
            num1 = cNum
        }
        cNum = num1
        theNumber = "0"
        printNumber()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        printNumber()
    }
    
    func printNumber(){
        lblText?.text = theNumber
        
    }
    
    @IBAction func pressNum(sender : UIButton){
       
        
        if sender.tag >= 0 && sender.tag <= 9 {
            
                theNumber += String(sender.tag)
                printNumber()
           
        }
       
        
    }

    
    
    

}

