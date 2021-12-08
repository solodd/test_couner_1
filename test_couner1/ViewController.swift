import UIKit

class ViewController: UIViewController {
    // MARK: Private Properties
    private var counter = 0 {
        didSet {
            label.text = "\(counter)"
        }
    }
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 45)
        label.text = "\(counter)"
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
   
    private lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Counter", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(label)
        view.addSubview(button)
        configureLayoutConstraints()
    }
    
    // MARK: Actions
    @objc func tappedButton(_ sender: UIButton) {
        animateScale(sender)
        guard counter < 5 else {
            zeroing()
            return
        }
        counter += 1
    }

    
    // MARK: Private Methods
    private func configureLayoutConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            button.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    private func zeroing() {
        let alert = UIAlertController(title: "Warning", message: "counter > 5", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.counter = 0
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

