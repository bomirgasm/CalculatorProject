//
//  CalculatorView.swift
//  CalculatorProject
//
//  Created by Suzie Kim on 4/4/25.
//

import UIKit

class CalculatorView: UIView {

    // 공개 속성 (ViewController에서 접근 예정)
    let expressionLabel = UILabel()
    let verticalStackView = UIStackView()

    private let buttonTitles: [[String]] = [
        ["1", "2", "3", "+"],
        ["4", "5", "6", "-"],
        ["7", "8", "9", "*"],
        ["AC", "0", "=", "/"]
    ]

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        setupLabel()
        setupStackViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLabel() {
        expressionLabel.text = "12345"
        expressionLabel.textAlignment = .right
        expressionLabel.font = .boldSystemFont(ofSize: 60)
        expressionLabel.textColor = .white
        expressionLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(expressionLabel)
    }

    private func setupStackViews() {
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 10
        verticalStackView.distribution = .fillEqually
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(verticalStackView)

        for row in buttonTitles {
            let hStack = makeHorizontalStackView()
            for title in row {
                let button = makeButton(title: title)
                hStack.addArrangedSubview(button)
            }
            verticalStackView.addArrangedSubview(hStack)
        }
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            expressionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 200),
            expressionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            expressionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            expressionLabel.heightAnchor.constraint(equalToConstant: 100),

            verticalStackView.topAnchor.constraint(equalTo: expressionLabel.bottomAnchor, constant: 60),
            verticalStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            verticalStackView.widthAnchor.constraint(equalToConstant: 350),
            verticalStackView.heightAnchor.constraint(equalToConstant: (80 * 4 + 10 * 3))
        ])
    }

    private func makeHorizontalStackView() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillEqually
        return stack
    }

    private func makeButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)

        if isOperator(title) {
            button.backgroundColor = .orange
        } else {
            button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        }

        button.layer.cornerRadius = 40
        return button
    }

    private func isOperator(_ symbol: String) -> Bool {
        return ["+", "-", "*", "/", "AC", "="].contains(symbol)
    }
}
