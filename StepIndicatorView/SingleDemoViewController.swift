//
//  SingleDemoViewController.swift
//  StepIndicatorView
//
//  Created by Running Raccoon on 2021/01/15.
//

import UIKit

class SingleDemoViewController: UIViewController {
    
    lazy var stepIndicatorView: StepIndicatorView = {
        let view = StepIndicatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfSteps = 6
        view.currentStep = 0
        view.circleColor = .green
        view.circleTintColor = .lightGray
        view.circleStrokeWidth = 3.0
        view.circleRadius = 10.0
        view.lineColor = view.circleColor
        view.lineTintColor = view.circleTintColor
        view.lineMargin = 4.0
        view.lineStrokeWidth = 2.0
        view.displayNumbers = true
        view.direction = .topToBottom
        view.showFlag = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        print("stepindicator: \(stepIndicatorView.currentStep)")
       
        [stepIndicatorView].forEach(self.view.addSubview(_:))
        
        NSLayoutConstraint.activate([
            stepIndicatorView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            stepIndicatorView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            stepIndicatorView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            stepIndicatorView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
}
