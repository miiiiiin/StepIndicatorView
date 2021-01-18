//
//  SingleDemoViewController.swift
//  StepIndicatorView
//
//  Created by Running Raccoon on 2021/01/15.
//

import UIKit

class SingleDemoViewController: UIViewController {
    
    let firstSteps = [
        "First",
        "Second",
        "Third can be very long and include a lot of unintersting text that spans several lines.",
        "Last but not least",
    ]
    
    lazy var stepProgressView: StepProgressView = {
        let view = StepProgressView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.steps = firstSteps
        view.currentStep = 0
        view.stepShape = .circle
        view.lineWidth = 2.5
        view.horizontalPadding = 16
        view.verticalPadding = 8 // between steps (0 => default based on textFont)
        view.horizontalPadding = 8 // between shape and text (0 => default based on textFont)
        return view
    }()
    
    lazy var stepIndicatorView: StepIndicatorView = {
        let view = StepIndicatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfSteps = 6
        view.currentStep = 0
        view.circleColor = .blue
        view.circleTintColor = .gray
        view.circleStrokeWidth = 3.0
        view.circleRadius = 10.0
        view.lineColor = view.circleColor
        view.lineTintColor = view.circleTintColor
        view.lineMargin = 4.0
        view.lineStrokeWidth = 2.0
        view.displayNumbers = true
        view.direction = .leftToRight
        view.showFlag = true
        return view
    }()
    
    lazy var newStepProgressView: StepProgressIndicatorView = {
        let view = StepProgressIndicatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.steps = firstSteps
        view.numberOfSteps = firstSteps.count
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
        view.direction = .leftToRight
        view.showFlag = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        [stepProgressView, stepIndicatorView, newStepProgressView].forEach(self.view.addSubview(_:))
        
        NSLayoutConstraint.activate([
            stepProgressView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            stepProgressView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            stepProgressView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            stepIndicatorView.topAnchor.constraint(equalTo:    self.stepProgressView.bottomAnchor),
            stepIndicatorView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            stepIndicatorView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            stepIndicatorView.heightAnchor.constraint(equalTo: stepProgressView.heightAnchor, multiplier: 1),
            
            newStepProgressView.topAnchor.constraint(equalTo: self.stepIndicatorView.bottomAnchor),
            newStepProgressView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            newStepProgressView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            newStepProgressView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
}
