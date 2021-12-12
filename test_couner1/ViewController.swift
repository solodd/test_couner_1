import UIKit

class ViewController: UIViewController {
    // MARK: Private Properties
    private var currentCounter = 0 {
        didSet {
            currentLabel.text = "Current counter: \(currentCounter)"
        }
    }
    private var mainCounter = 0 {
        didSet {
            mainLabel.text = "Total counter: \(mainCounter)"
        }
    }
    
    private lazy var currentLabel: UILabel = {
        let currentLabel = UILabel()
        currentLabel.font = .boldSystemFont(ofSize: 35)
        currentLabel.text = "Current counter: \(currentCounter)"
        currentLabel.textColor = .black
        currentLabel.textAlignment = .center
        currentLabel.translatesAutoresizingMaskIntoConstraints = false
        return currentLabel
    }()
    
    private lazy var mainLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.font = .boldSystemFont(ofSize: 25)
        mainLabel.text = "Total counter: \(mainCounter)"
        mainLabel.textColor = .gray
        mainLabel.textAlignment = .center
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        return mainLabel
    }()
    
    private lazy var buttonPlus: UIButton = {
        let buttonPlus = UIButton(type: .custom)
        buttonPlus.setTitle("Counter +", for: .normal)
        buttonPlus.tintColor = .white
        buttonPlus.backgroundColor = .systemBlue
        buttonPlus.layer.cornerRadius = 10
        buttonPlus.addTarget(self, action: #selector(tappedButtonPlus), for: .touchUpInside)
        buttonPlus.translatesAutoresizingMaskIntoConstraints = false
        return buttonPlus
    }()
    private lazy var buttonMinus: UIButton = {
        let buttonMinus = UIButton(type: .custom)
        buttonMinus.setTitle("Counter -",for: .normal)
        buttonMinus.tintColor = .white
        buttonMinus.backgroundColor = .systemBlue
        buttonMinus.layer.cornerRadius = 10
        buttonMinus.addTarget(self, action: #selector(tappedButtonMinus), for: .touchUpInside)
        buttonMinus.translatesAutoresizingMaskIntoConstraints = false
        return buttonMinus
    }()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(currentLabel)
        view.addSubview(mainLabel)
        view.addSubview(buttonPlus)
        view.addSubview(buttonMinus)
        configureLayoutConstraints()
    }
    
    // MARK: Actions
    @objc func tappedButtonPlus(_ sender: UIButton) {
        animateScale(sender)
        mainCounter += 1
        guard currentCounter < 5 else {
            let message = "counter > 5"
            alerting(message: message)
            return
        }
        currentCounter += 1
        
    }
    
    
    @objc func tappedButtonMinus(_ sender: UIButton) {
        animateScale(sender)
        mainCounter += 1
        guard currentCounter > 0 else {
            let message = "counter < 0"
            alerting(message: message)
            return
        }
        currentCounter -= 1
        
    }
    
    
    // MARK: Private Methods
    private func configureLayoutConstraints() {
        NSLayoutConstraint.activate([
            currentLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            currentLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 95),
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonPlus.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -205),
            buttonPlus.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            buttonPlus.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            buttonPlus.heightAnchor.constraint(equalToConstant: 50),
            buttonMinus.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            buttonMinus.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            buttonMinus.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            buttonMinus.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func alerting(message :String) {
        let alert = UIAlertController(title: "Warning", message: message , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.currentCounter = 0
        }))
        present(alert, animated: true, completion: nil)
        
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

