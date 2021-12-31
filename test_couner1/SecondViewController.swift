import UIKit

class SecondViewController: UIViewController {
    
    
    
    // MARK: Private Properties
    
    private lazy var VC3: UIButton = {
        let buttonPlus = UIButton(type: .custom)
        buttonPlus.setTitle("Weather", for: .normal)
        buttonPlus.tintColor = .white
        buttonPlus.backgroundColor = .systemBlue
        buttonPlus.layer.cornerRadius = 10
        buttonPlus.addTarget(self, action: #selector(tappedVC3), for: .touchUpInside)
        buttonPlus.translatesAutoresizingMaskIntoConstraints = false
        return buttonPlus
    }()
    private lazy var VC4: UIButton = {
        let buttonPlus = UIButton(type: .custom)
        buttonPlus.setTitle("Gallery", for: .normal)
        buttonPlus.tintColor = .white
        buttonPlus.backgroundColor = .systemBlue
        buttonPlus.layer.cornerRadius = 10
        buttonPlus.addTarget(self, action: #selector(tappedVC4), for: .touchUpInside)
        buttonPlus.translatesAutoresizingMaskIntoConstraints = false
        return buttonPlus
    }()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        view.addSubview(VC3)
        view.addSubview(VC4)
        configureLayoutConstraints()
    }
    // MARK: Actions
    @objc func tappedVC3(_ sender: UIButton) {
        animateScale(sender)
    }
    
    @objc func tappedVC4(_ sender: UIButton) {
        animateScale(sender)
    }
    
    
    // MARK: Private Methods
    private func configureLayoutConstraints() {
        NSLayoutConstraint.activate([
            VC3.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            VC3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            VC3.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -15),
            VC3.heightAnchor.constraint(equalToConstant: 50),
            VC4.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            VC4.leadingAnchor.constraint(equalTo:  view.centerXAnchor, constant: 0),
            VC4.trailingAnchor.constraint(equalTo:view.leadingAnchor, constant: 30),
            VC4.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func animateScale(_ view: UIView) {
        UIView.animate(withDuration: 0.2 / 2, animations: {
            view.transform = .init(scaleX: 0.98, y: 0.98)
        }, completion: { _  in
            UIView.animate(withDuration: 0.2 / 2, animations: {
                view.transform = .identity
            })
        })
    }
    
}

