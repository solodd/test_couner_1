import UIKit

class ViewController: UIViewController {
    var counter = 0
    private lazy var label: UILabel = {
        let label = UILabel()
        return label
    }()
    private func zeroing(){
        counter = 0
        label.text = "Counter = \(counter)"
        let alert = UIAlertController  (title: "Warning", message:   "counter > 5", preferredStyle: .alert)
        let okButton = UIAlertAction (title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
    @objc func tappedButton() {
        counter += 1
        label.text = "Counter = \(counter)"
        if counter > 5 {zeroing()}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let btn = UIButton(type: .custom) as UIButton
        btn.backgroundColor = .gray
        btn.setTitle("Add +1", for: .normal)
        btn.frame = CGRect(x: 75, y: 100, width: 200, height: 100)
        btn.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        self.view.addSubview(btn)
    
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 100)
        label.textColor = .black
        label.text = "counter = \(counter)"
        self.view.addSubview(label)
    }
    
    
    
    
}

