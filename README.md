

## 기능 요약
- 정수 계산기 구현
- 기본 사칙연산: +, -, *, /
- `=` 버튼 클릭 시 계산 실행
- `AC` 버튼으로 초기화
- 입력값 실시간 표현

## 구현 단계 (Lv1 ~ Lv8)
- [x] Lv1: 수식 라벨 구성
- [x] Lv2: 가로 버튼 스택 구현
- [x] Lv3: 세로 스택뷰로 정렬
- [x] Lv4: 연산자 버튼 색상 구분
- [x] Lv5: 버튼 원형 스타일
- [x] Lv6: 입력 값 표시
- [x] Lv7: 초기화(AC) 기능
- [x] Lv8: `=` 버튼 계산 처리


# iOS 계산기 앱 (CalculatorProject)

## 프로젝트 개요

Swift와 UIKit을 활용하여 iOS에서 동작하는 계산기 앱을 구현했습니다.  
사용자는 버튼을 눌러 수식을 입력하고, `=` 버튼으로 결과를 확인할 수 있습니다.  
기본적인 사칙연산(+ - * /)을 지원하며, `AC` 버튼을 통해 수식을 초기화할 수 있습니다.

---

## 사용 기술

- 언어: Swift 5.9
- 개발 환경: Xcode (UIKit / 코드베이스 UI)
- UI 구성: AutoLayout + StackView
- 수식 계산: NSExpression 사용

---

## 기능

- 숫자 및 연산자 버튼 UI 구성
- 수식 입력 기능 (`append`)
- 수식 계산 기능 (`=` 버튼)
- 초기화 기능 (`AC` 버튼)
- 예외 처리: 0으로 시작하는 숫자 제거, 잘못된 수식 방지

---

## 프로젝트 구조
```
Calculator/
├── ViewController.swift         // 전체 흐름과 초기 세팅
├── CalculatorView.swift         // UI 컴포넌트 (UILabel, StackView)
├── CalculatorLogic.swift        // 입력 처리 및 수식 계산 로직
└── README.md # 프로젝트 설명 문서
```


---

## 기능 상세 설명

### 1. 수식 라벨 및 버튼 UI 구성 (Lv1~Lv5)
- UILabel로 수식 표시
- StackView로 버튼 정렬 (4 x 4 형태)
- 숫자 버튼과 연산자 버튼 구분 (색상 및 cornerRadius 적용)
- AutoLayout으로 반응형 UI 구성

### 2. 입력 기능 (Lv6)

```
swift
func append(_ value: String) {
    if expression == "0" {
        expression = value  // 앞자리 0 제거
    } else {
        expression += value
    }
}
```
사용자 입력이 "0"일 경우 → 새 숫자로 덮어쓰기
그 외에는 이어붙이기


### 3. 초기화 기능 (Lv7)
```
func clear() {
    expression = "0"
}
```
"AC" 버튼 클릭 시 호출되어 수식 초기화

### 4. 수식 계산 기능 (Lv8)
```
func calculate() -> String {
    let exp = NSExpression(format: expression)
    if let result = exp.expressionValue(with: nil, context: nil) as? NSNumber {
        return result.stringValue
    } else {
        return "Error"
    }
}
```
NSExpression을 활용해 문자열 수식 계산
오류 발생 시 "Error" 반환

### 예외 처리
수식 앞에 "0"이 중복되면 제거
1++2처럼 연산자가 중복될 수 있는 수식 입력 제한 (선택적으로 구현)
계산 도중 잘못된 수식 → "Error"로 처리하여 앱이 종료되지 않도록 함

### 실행 방법
Xcode에서 CalculatorProject 열기
시뮬레이터 또는 디바이스에서 실행 (Run)
버튼 클릭으로 수식 입력 및 계산 수행

