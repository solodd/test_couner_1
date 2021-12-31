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
    
    private let secondViewConroller: SecondViewController = SecondViewController(nibName: nil, bundle: nil)

    private var key = "username"
    
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
    private lazy var buttonReset: UIButton = {
        let buttonReset = UIButton(type: .custom)
        buttonReset.setTitle("Reset counter", for: .normal)
        buttonReset.tintColor = .white
        buttonReset.backgroundColor = .systemRed
        buttonReset.layer.cornerRadius = 10
        buttonReset.addTarget(self, action: #selector(tappedButtonReset), for: .touchUpInside)
        buttonReset.translatesAutoresizingMaskIntoConstraints = false
        return buttonReset
    }()
    private lazy var buttonChange: UIButton = {
        let buttonChange = UIButton(type: .custom)
        buttonChange.setTitle("Open SVC", for: .normal)
        buttonChange.tintColor = .white
        buttonChange.backgroundColor = .systemGreen
        buttonChange.layer.cornerRadius = 10
        buttonChange.addTarget(self, action: #selector(tappedButtonNext), for: .touchUpInside)
        buttonChange.translatesAutoresizingMaskIntoConstraints = false
        return buttonChange
    }()
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(currentLabel)
        view.addSubview(mainLabel)
        view.addSubview(buttonPlus)
        view.addSubview(buttonMinus)
        view.addSubview(buttonReset)
        view.addSubview(buttonChange)
        configureLayoutConstraints()
        mainCounter = loadMainCounter()
    }
    
    // MARK: Actions
    @objc func tappedButtonPlus(_ sender: UIButton) {
        animateScale(sender)
        mainCounter += 1
        saveMainCounter(value: mainCounter, key: key)
        guard currentCounter < 5 else {
            let message = "Current counter > 5"
            alerting(message: message)
            return
        }
        currentCounter += 1
    }
    
    @objc func tappedButtonMinus(_ sender: UIButton) {
        animateScale(sender)
        mainCounter += 1
        saveMainCounter(value: mainCounter, key: key)
        guard currentCounter > 0 else {
            let message = "Current counter < 0"
            alerting(message: message)
            return
        }
        currentCounter -= 1
    }
    
    @objc func tappedButtonReset(_ sender: UIButton) {
        animateScale(sender)
        mainCounter = 0
        saveMainCounter(value: mainCounter, key: key)
    }
    @objc func tappedButtonNext(_ sender: UIButton) {
        let secondViewController:SecondViewController = SecondViewController()
        self.present(secondViewController, animated: true, completion: nil)

     }
    
    // MARK: Private Methods
    private func configureLayoutConstraints() {
        NSLayoutConstraint.activate([
            currentLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            currentLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 95),
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonPlus.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            buttonPlus.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            buttonPlus.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -15),
            buttonPlus.heightAnchor.constraint(equalToConstant: 50),
            buttonMinus.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            buttonMinus.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 15),
            buttonMinus.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            buttonMinus.heightAnchor.constraint(equalToConstant: 50),
            buttonReset.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -85),
            buttonReset.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 15),
            buttonReset.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            buttonReset.heightAnchor.constraint(equalToConstant: 50),
            buttonChange.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -85),
            buttonChange.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            buttonChange.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -15),
            buttonChange.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func alerting(message :String) {
        let alert = UIAlertController(title: "Warning", message: message , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            //self.currentCounter = 0
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
    private func saveMainCounter(value :Int, key: String){
        UserDefaults.standard.set(value, forKey: key)
    }
    private func loadMainCounter() -> Int {
        let mainCounterSaved = (UserDefaults.standard.value(forKey: key)) as? Int
        return mainCounterSaved ?? 0
    }
    
    
}

