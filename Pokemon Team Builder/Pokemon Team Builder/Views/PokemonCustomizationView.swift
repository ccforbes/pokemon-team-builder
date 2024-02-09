//
//  PokemonCustomizationView.swift
//  Pokemon Team Builder
//
//  Created by Chris Forbes on 2/8/24.
//

import UIKit

class PokemonCustomizationView: UIView {
    
    // MARK: - Properties
    
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    private let titleLabelViewWrapper: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private let inputWrapper: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        return view
    }()
    
    private lazy var textInput: UITextField = {
        let textInput = UITextField()
        textInput.translatesAutoresizingMaskIntoConstraints = false
        textInput.textColor = .white
        textInput.borderStyle = .roundedRect
        textInput.backgroundColor = .darkGray
        textInput.attributedPlaceholder = NSMutableAttributedString(
            string: "Name",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.lightGray
            ]
        )
        textInput.font = UIFont.systemFont(ofSize: 16)
        textInput.delegate = self
        return textInput
    }()
    
    private lazy var dropdownMenuButton: UIButton = {
        let button = UIButton(primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.contentHorizontalAlignment = .left;
        return button
    }()
    
    private let title: String
    private let inputMethod: InputMethod
    private let values: [String]
    
    // MARK: - Initializers
    
    init(title: String, inputMethod: InputMethod, values: [String]) {
        self.title = title
        self.inputMethod = inputMethod
        self.values = values
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        setupTitle()
        setupInputMethod()
        contentStackView.addArrangedSubview(titleLabelViewWrapper)
        contentStackView.addArrangedSubview(inputWrapper)
        addSubview(contentStackView)
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setupTitle() {
        titleLabel.text = title
        titleLabelViewWrapper.addArrangedSubview(titleLabel)
    }
    
    private func setupInputMethod() {
        switch inputMethod {
        case .text:
            setupTextInput()
        case .dropdown:
            setupDropdownMenuButton()
        }
    }
    
    private func setupTextInput() {
        inputWrapper.addSubview(textInput)
        textInput.text = values.first
        NSLayoutConstraint.activate([
            textInput.topAnchor.constraint(equalTo: inputWrapper.topAnchor),
            textInput.leadingAnchor.constraint(equalTo: inputWrapper.leadingAnchor),
            textInput.bottomAnchor.constraint(equalTo: inputWrapper.bottomAnchor),
            textInput.trailingAnchor.constraint(equalTo: inputWrapper.trailingAnchor)
        ])
    }
    
    private func setupDropdownMenuButton() {
        inputWrapper.addSubview(dropdownMenuButton)
        dropdownMenuButton.setTitle(values.first, for: .normal)
        setupMenu()
        NSLayoutConstraint.activate([
            dropdownMenuButton.topAnchor.constraint(equalTo: inputWrapper.topAnchor),
            dropdownMenuButton.leadingAnchor.constraint(equalTo: inputWrapper.leadingAnchor, constant: 7),
            dropdownMenuButton.bottomAnchor.constraint(equalTo: inputWrapper.bottomAnchor),
            dropdownMenuButton.trailingAnchor.constraint(equalTo: inputWrapper.trailingAnchor)
        ])
    }
    
    private func setupMenu() {
        let actionClosure = { (action: UIAction) in
            print(action.title)
        }
        var menuChildren: [UIMenuElement] = []
        for value in values {
            menuChildren.append(UIAction(title: value, handler: actionClosure))
        }
        dropdownMenuButton.menu = UIMenu(options: .displayInline, children: menuChildren)
        dropdownMenuButton.showsMenuAsPrimaryAction = true
        dropdownMenuButton.changesSelectionAsPrimaryAction = true
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension PokemonCustomizationView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 12 // Nickname char limit
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)
        
        return newString.count <= maxLength
    }
}

// MARK: - InputMethod Enum

enum InputMethod {
    case text, dropdown
}
