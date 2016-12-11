//
//  MultitouchViewController.swift
//  Multitouch
//
//  Created by Daniel Clelland on 11/12/16.
//  Copyright © 2016 Daniel Clelland. All rights reserved.
//

import UIKit
import MultitouchGestureRecognizer

class MultitouchViewController: UIViewController {
    
    @IBOutlet var multitouchGestureRecognizer: MultitouchGestureRecognizer!
    
    // MARK: Views
    
    @IBOutlet var multitouchView: MultitouchView! {
        didSet {
            multitouchView.draw(multitouchGestureRecognizer: multitouchGestureRecognizer)
        }
    }
    
    @IBOutlet var countLabel: UILabel! {
        didSet {
            countLabel.text = "(\(multitouchGestureRecognizer.count))"
        }
    }
    
    // MARK: Controls
    
    @IBOutlet var modeSegmentedControl: UISegmentedControl! {
        didSet {
            switch multitouchGestureRecognizer.mode {
            case .stack:
                modeSegmentedControl.selectedSegmentIndex = 0
            case .queue:
                modeSegmentedControl.selectedSegmentIndex = 1
            }
        }
    }
    
    @IBOutlet var countSlider: UISlider! {
        didSet {
            countSlider.value = Float(multitouchGestureRecognizer.count)
        }
    }
    
    @IBOutlet var sustainSwitch: UISwitch! {
        didSet {
            sustainSwitch.isOn = multitouchGestureRecognizer.sustain
        }
    }
    
    // MARK: Interface actions
    
    @IBAction func modeSegmentedControlValueChanged(_ modeSegmentedControl: UISegmentedControl) {
        switch modeSegmentedControl.selectedSegmentIndex {
        case 0:
            multitouchGestureRecognizer.mode = .stack
        case 1:
            multitouchGestureRecognizer.mode = .queue
        default:
            break
        }
    }
    
    @IBAction func countSliderValueChanged(_ countSlider: UISlider) {
        multitouchGestureRecognizer.count = Int(countSlider.value)
        countLabel.text = "(\(multitouchGestureRecognizer.count))"
    }
    
    @IBAction func sustainSwitchValueChanged(_ sustainSwitch: UISwitch) {
        multitouchGestureRecognizer.sustain = sustainSwitch.isOn
    }

}

// MARK: - Multitouch gesture recognizer delegate

extension MultitouchViewController: MultitouchGestureRecognizerDelegate {

    func multitouchGestureRecognizer(_ gestureRecognizer: MultitouchGestureRecognizer, touchDidBegin touch: UITouch) {
        multitouchView.draw(multitouchGestureRecognizer: multitouchGestureRecognizer)
    }
    
    func multitouchGestureRecognizer(_ gestureRecognizer: MultitouchGestureRecognizer, touchDidMove touch: UITouch) {
        multitouchView.draw(multitouchGestureRecognizer: multitouchGestureRecognizer)
    }
    
    func multitouchGestureRecognizer(_ gestureRecognizer: MultitouchGestureRecognizer, touchDidCancel touch: UITouch) {
        multitouchView.draw(multitouchGestureRecognizer: multitouchGestureRecognizer)
    }
    
    func multitouchGestureRecognizer(_ gestureRecognizer: MultitouchGestureRecognizer, touchDidEnd touch: UITouch) {
        multitouchView.draw(multitouchGestureRecognizer: multitouchGestureRecognizer)
    }

}
