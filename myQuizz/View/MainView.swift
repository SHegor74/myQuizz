import UIKit


class MainView: UIView {
    
    static let shared = MainView()
    
    var scoreLabel = UILabel()
    var questionLabel = UILabel()
    
    var progressBar = UIProgressView()
    
    lazy var firstAnswer = naviButton(title: "firstAnswer")
    lazy var secondAnswer = naviButton(title: "secondAnswer")
    lazy var thirdAnswer = naviButton(title: "thirdAnswer")
    
    var bubblesImage = UIImageView()
    
    var stack = UIStackView()
    
    
    init() {
        super.init(frame: CGRect())
        self.backgroundColor = UIColor(red: 51/255.0, green: 59/255.0, blue: 90/255.0, alpha: 1)
        setConstraints()
        setViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func naviButton(title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        button.titleLabel?.textAlignment = .center
        button.clipsToBounds = true
        button.layer.borderWidth = 6
        button.layer.borderColor = UIColor(red: 77/255, green: 99/255, blue: 140/255, alpha: 1).cgColor
        button.layer.cornerRadius = 30
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    
    
    func setViews() {

        scoreLabel.text = "Score: 0"
        scoreLabel.textColor = .white
        
        questionLabel.textColor = .white
        questionLabel.textAlignment = .center
        
        bubblesImage.image = UIImage(named: "Background-Bubbles")
    }
    
    
    func setConstraints() {
        stack = UIStackView(subviews: [firstAnswer, secondAnswer, thirdAnswer], axis: .vertical, spacing: 10, aligment: .fill, distribution: .fillEqually)
        
        Helper.tamicOff(views: [scoreLabel, questionLabel, progressBar, stack, bubblesImage])
        Helper.addSubView(views: [scoreLabel, questionLabel, stack, progressBar, bubblesImage], to: self)
        
        NSLayoutConstraint.activate([
            scoreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            scoreLabel.topAnchor.constraint(equalTo: topAnchor, constant: 70),
            
            bubblesImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            bubblesImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            bubblesImage.rightAnchor.constraint(equalTo: rightAnchor),
            
            progressBar.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -70),
            progressBar.heightAnchor.constraint(equalToConstant: 5),
            progressBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            progressBar.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            
            questionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            questionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -500),
            questionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            questionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            
            stack.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 100),
            stack.bottomAnchor.constraint(equalTo: progressBar.topAnchor, constant: -50),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stack.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),          
        ])
    }
    
}
