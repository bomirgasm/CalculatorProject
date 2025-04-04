//
//  ViewController.swift
//  CalculatorProject
//
//  Created by Suzie Kim on 4/3/25.
//

import UIKit

class ViewController: UIViewController {
    
    private let calculatorView = CalculatorView()
    private let logic = CalculatorLogic()
    
    override func loadView() {
        view = calculatorView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonActions()
    }
    
    private func setupButtonActions() {
        for hStack in calculatorView.verticalStackView.arrangedSubviews {
            guard let hStack = hStack as? UIStackView else { continue }

            for case let button as UIButton in hStack.arrangedSubviews {
                button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            }
        }
    }

    @objc private func buttonTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }

        //Lv7 AC 기능
        if title == "AC" {
            logic.clear()
            calculatorView.expressionLabel.text = logic.expression
            return
        }
        //Lv6: 입력 추가 처리
        logic.append(title)
        calculatorView.expressionLabel.text = logic.expression
    }
    
}
