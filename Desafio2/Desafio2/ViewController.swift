import UIKit

class ViewController: UIViewController {
    // MARK: variables
    let cores: [UIColor] = [.blue, .green, .red, .yellow, .black, .gray, .brown, .magenta, .cyan, .white]
    var indiceCorAtual = 0
    
    // MARK: itens in screen
    private lazy var square: UIView = {
        let square = UIView()
        square.backgroundColor = .orange
        square.translatesAutoresizingMaskIntoConstraints = false
        return square
    }()
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.setTitle("Toque aqui", for: .normal)
        button.addTarget(self, action: #selector(mudarCorQuadrado), for: .touchUpInside)
        return button
    }()
    // MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = . white
        setupLayout()
    }
    // MARK: add subviews
    func setupLayout(){
        view.addSubview(square)
        view.addSubview(button)
        setupUI()
    }
    // MARK: add Constraints
    func setupUI(){
        
        let square = [
            square.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            square.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            square.widthAnchor.constraint(equalToConstant: 150),
            square.heightAnchor.constraint(equalToConstant: 150),
            ]
        let button = [
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 170),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 30),
        ]
        NSLayoutConstraint.activate(square + button)
    }
    // MARK: objc
    @objc func mudarCorQuadrado() {
        indiceCorAtual = (indiceCorAtual + 1) % cores.count
        view.subviews.first?.backgroundColor = cores[indiceCorAtual]
    }
}

