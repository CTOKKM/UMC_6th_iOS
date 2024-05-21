//
//  StringTweenViewController.swift
//  AnimationLib
//
//  Created by KKM on 5/21/24.
//

import UIKit
import TweenKit

let alphabetString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

func convertCharacterToInt(_ character: Character) -> Int {
    for (index, char) in alphabetString.enumerated() {
        if char == character {
            return index
        }
    }
    fatalError("Unable to convert character to int: \(character)")
}

func convertIntToCharacter(_ int: Int) -> Character {
    for (index, char) in alphabetString.enumerated() {
        if index == int {
            return char
        }
    }
    fatalError("Unable to convert int to character: \(int)")
}

extension Int: Tweenable {
    public func lerp(t: Double, end: Int) -> Int {
        print("t = \(t)")
        let intT = Int(t)
        return self + ((end - self) * intT)
    }
    
    public func distanceTo(other: Int) -> Double {
        fatalError("Not implemented")
    }
}

extension String: Tweenable {
    public func lerp(t: Double, end: String) -> String {
        precondition(self.count == end.count)
        
        if t < 0.00001 {
            return self
        }
        if t > 1 - 0.0005 {
            return end
        }
        
        let fromNumber = self.asNumber()
        let toNumber = end.asNumber()
        
        let interpolated = Double(fromNumber).lerp(t: t, end: Double(toNumber))
        return String(number: Int(interpolated), length: self.count)
    }
    
    init(number: Int, length: Int) {
        var characters = [Character]()
        
        for index in (0..<length) {
            if index == length-1 {
                let charNum = number % alphabetString.count
                characters.append(convertIntToCharacter(charNum))
            } else {
                let distanceFromEnd = length - index - 1
                var num = number
                (0..<distanceFromEnd).forEach { _ in
                    num /= alphabetString.count
                }
                num -= 1
                num = num % alphabetString.count
                characters.append(convertIntToCharacter(num))
            }
        }
        
        self.init(characters)
    }
    
    func asNumber() -> Int {
        var cumulative = 0
        
        for (index, char) in self.reversed().enumerated() {
            var num = convertCharacterToInt(char)
            
            if index == 0 {
                cumulative += num
            } else {
                num += 1
                (0..<index).forEach { _ in
                    num *= alphabetString.count
                }
                cumulative += num
            }
        }
        return cumulative
    }
    
    var alphabetLength: Int {
        return alphabetString.count
    }
    
    public func distanceTo(other: String) -> Double {
        fatalError("Not implemented")
    }
}

extension UIColor {
    convenience init(rgb: Int) {
        self.init(
            red: CGFloat((rgb >> 16) & 0xFF) / 255.0,
            green: CGFloat((rgb >> 8) & 0xFF) / 255.0,
            blue: CGFloat(rgb & 0xFF) / 255.0,
            alpha: 1.0
        )
    }
}

class StringTweenViewController: UIViewController {
    private let scheduler = ActionScheduler(automaticallyAdvanceTime: true)
    
    private let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Hello"
        label.font = UIFont.systemFont(ofSize: 40, weight: UIFont.Weight(rawValue: 4))
        label.textAlignment = .center
        return label
    }()
    
    private let gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        view.addSubview(label)
        
        // Setup gradient layer
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Text animation
        let textAction = InterpolationAction(from: "Hello", to: "World", duration: 4, easing: .exponentialInOut) { [unowned self] in
            self.label.text = $0
        }
        
        // Background gradient color animation
        let colorsAction = InterpolationAction(from: [UIColor.red, UIColor.blue], to: [UIColor.green, UIColor.yellow], duration: 4, easing: .exponentialInOut) { [unowned self] in
            self.gradientLayer.colors = $0.map { $0.cgColor }
        }
        
        // Combine text and color animations
        let group = ActionGroup(actions: textAction, colorsAction)
        
        // Create a sequence with a delay at each end
        let sequence = ActionSequence(actions: DelayAction(duration: 0.5), group, DelayAction(duration: 0.5))
        
        // Run it forever
        scheduler.run(action: sequence.yoyo().repeatedForever())
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        label.frame = view.bounds
        gradientLayer.frame = view.bounds
    }
}

extension Array: Tweenable where Element: Tweenable {
    public func lerp(t: Double, end: [Element]) -> [Element] {
        precondition(self.count == end.count)
        return zip(self, end).map { $0.lerp(t: t, end: $1) }
    }
    
    public func distanceTo(other: [Element]) -> Double {
        fatalError("Not implemented")
    }
}

