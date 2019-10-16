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

    @IBOutlet var button1: UIButton!

    var num1: Double = 0

    var num2: Double = 0

    var isNum2: Bool = false

    var decimalPointFlag: Bool = false

    // TODO:拼写错误
    var operatorr: String = ""

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

    // TODO:拼写错误
    @IBAction func clike(_ button: UIButton) {

        // TODO: ！ ？ 的区别，怎么更合理的使用？  抽方法，合理命名来表示该方法做了什么事情
        if showNumber.text! == "0" || (isNum2 && num2 == 0 && showNumber.text != "0.") || (operatorr == "" && !decimalPointFlag) {
            showNumber.text = ""
        }

        showNumber.text = showNumber.text! + button.titleLabel!.text!

        // TODO: 有共性的代码抽方法
        if isNum2 {
            num2 = NSString(string: showNumber.text!).doubleValue
        } else {
            num1 = NSString(string: showNumber.text!).doubleValue
        }
    }

    // TODO:拼写错误
    @IBAction func decimalPointClike() {
        if !decimalPointFlag {
            showNumber.text = showNumber.text! + "."
            if isNum2 {
                num2 = (showNumber.text! as NSString).doubleValue
            } else {
                num1 = (showNumber.text! as NSString).doubleValue
            }

            decimalPointFlag = !decimalPointFlag
        }
    }

    // TODO:拼写错误
    @IBAction func operatorClike(_ sender: UIButton) {
        isNum2 = true
        decimalPointFlag = false
        switch sender.titleLabel!.text! {
        case "+":
            operatorr = "+"
        case "-":
            operatorr = "-"
        case "x":
            operatorr = "*"
        case "/":
            operatorr = "/"
        default:
            operatorr = ""
        }
    }

    // TODO:拼写错误
    @IBAction func resultClike(_ sender: UIButton) {
        if isNum2 {
            if operatorr == "/" && num2 == 0 {
                num1 = 0
                num2 = 0
                isNum2 = false
                decimalPointFlag = false
                operatorr = ""
                return
            }

            var result: Double = 0
            switch operatorr {
            case "+":
                result = num1 + num2
            case "-":
                result = num1 - num2
            case "*":
                result = num1 * num2
            case "/":
                result = num1 / num2
            default:
                result = 0
            }

            showNumber.text = result.description

            num1 = result
            num2 = 0
            isNum2 = false
            operatorr = ""
        }
    }


    // TODO:拼写错误
    @IBAction func clearClike(_ sender: UIButton) {
        showNumber.text = "0"
        num1 = 0
        num2 = 0
        isNum2 = false
        decimalPointFlag = false
        operatorr = ""
    }

}

class roundnessButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 0.5 * bounds.size.height
    }

    // TODO: 为什么需要init？
    required init?(coder: NSCoder) {
        fatalError()
    }
}

