//
//  ViewController.swift
//  CalculatorProject
//
//  Created by Suzie Kim on 4/3/25.
//

import UIKit

class ViewController: UIViewController {
    
    // 라벨 정의
    private let expressionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .black
        label.textColor = .white
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 60)
        label.text = "12345" // Lv1 고정 텍스트
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 버튼 타이틀 배열 (Lv2는 한 줄만)
    private let buttonTitles: [String] = ["1", "2", "3", "+"]
    
    // 첫 줄 가로 스택뷰
    private let horizontalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillEqually
        stack.backgroundColor = .black
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black // 화면 배경
        
        setupUI()
        setupConstraints()
    }
    
    // 라벨을 뷰에 추가
    private func setupUI() {
        view.addSubview(expressionLabel)
        view.addSubview(horizontalStackView)
        
        // 버튼 추가
        for title in buttonTitles {
            let button = makeButton(title: title)
            horizontalStackView.addArrangedSubview(button)
        }
    }
    
    // 오토레이아웃 설정
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            expressionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            expressionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            expressionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            expressionLabel.heightAnchor.constraint(equalToConstant: 100),
            
            horizontalStackView.topAnchor.constraint(equalTo: expressionLabel.bottomAnchor, constant: 60),
            horizontalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            horizontalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            horizontalStackView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    
    private func makeButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        button.layer.cornerRadius = 40
        return button
    }
}
