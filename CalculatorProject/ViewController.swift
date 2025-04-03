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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black // 화면 배경

        setupUI()
        setupConstraints()
    }

    // 라벨을 뷰에 추가
    private func setupUI() {
        view.addSubview(expressionLabel)
    }

    // 오토레이아웃 설정
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            expressionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            expressionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            expressionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            expressionLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
