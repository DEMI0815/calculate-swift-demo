//
//  ViewController.swift
//  Calculate
//
//  Created by Yidi Zhao on 2019/10/9.
//  Copyright © 2019 Yidi Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var showNumber: UILabel!

    @IBOutlet var buttons: [UIButton]!

    var num1: Double?

    var num2: Double?

    var isNum2: Bool = false

    var decimalPointFlag: Bool = false

    var oneOperator: String?
    
    override func loadView() {
        super.loadView()
        print("loadView")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //Do any additional setup after loading the view
        print("viewDidLoad: 页面加载时，只执行一次")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear: 进入界面时，都会被呼叫")
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("viewWillLayoutSubviews")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("viewDidLayoutSubviews: 1.view被添加到视图层次中。2.bounds change时会被呼叫，如旋转屏幕时。")
        for button in buttons {
            button.layer.cornerRadius = button.bounds.height / 2
            button.layoutIfNeeded()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillDisapear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    func cleanShowNumber() {
        if showNumber.text == "0" || (isNum2 && num2 == nil && showNumber.text != "0.") || (oneOperator == nil && !decimalPointFlag) {
            showNumber.text = ""
        }
    }

    @IBAction func numberClick(_ sender: UIButton) {

        cleanShowNumber()
        
        guard let title = sender.currentTitle, var showNumberText = showNumber.text else {
            // TODO: others
            print("-----------------title empty")
            return
        }
        
        showNumberText += title
        showNumber.text = showNumberText

        evaluate(showNumberText: showNumberText)
    }

    private func evaluate(showNumberText: String){
        if isNum2 {
            num2 = NSString(string: showNumberText).doubleValue
        } else {
            num1 = NSString(string: showNumberText).doubleValue
        }
    }
    
    @IBAction func decimalPointClick() {
        if !decimalPointFlag {
            
            guard var showNumberText = showNumber.text else {
                return
            }
            
            showNumberText += "."
            showNumber.text = showNumberText
            
            evaluate(showNumberText: showNumberText)

            decimalPointFlag = !decimalPointFlag
        }
    }

    @IBAction func operatorClick(_ sender: UIButton) {
        isNum2 = true
        decimalPointFlag = false
        switch sender.currentTitle {
        case "+":
            oneOperator = "+"
        case "-":
            oneOperator = "-"
        case "x":
            oneOperator = "*"
        case "/":
            oneOperator = "/"
        default:
            oneOperator = ""
        }
    }

    @IBAction func resultClick(_ sender: UIButton) {
        if isNum2 {
            if oneOperator == "/" && num2 == 0 {
                cleanClick(sender)
                return
            }

            var result: Double = 0
            guard let number1 = num1, let number2 = num2 else {
                return
            }
            
            switch oneOperator {
            case "+":
                result = number1 + number2
            case "-":
                result = number1 - number2
            case "*":
                result = number1 * number2
            case "/":
                result = number1 / number2
            default:
                result = 0
            }

            showNumber.text = result.description

            num1 = result
            num2 = nil
            isNum2 = false
            oneOperator = nil
        }
    }


    // TODO:拼写错误
    @IBAction func cleanClick(_ sender: UIButton) {
        showNumber.text = "0"
        num1 = nil
        num2 = nil
        isNum2 = false
        decimalPointFlag = false
        oneOperator = nil
    }

}

