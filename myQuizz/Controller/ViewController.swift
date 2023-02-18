import UIKit

class ViewController: UIViewController {
    
    let mainView = MainView()
    
    lazy var questionLabel = mainView.questionLabel
    lazy var scoreLabel = mainView.scoreLabel
    
    lazy var progressBar = mainView.progressBar
    
    lazy var firstAnswer = mainView.firstAnswer
    lazy var secondAnswer = mainView.secondAnswer
    lazy var thirdAnswer = mainView.thirdAnswer
    
    lazy var bubblesImage = mainView.bubblesImage
    
    var quizzLogic = QuizzLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        updateUI()
        pressedButton()
    }
    
    func pressedButton() {
        firstAnswer.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        secondAnswer.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        thirdAnswer.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
    }
    

    @objc func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.titleLabel!.text!
        let resultAnswer = quizzLogic.checkAnswer(userAnswer)

        if resultAnswer {
            sender.backgroundColor = UIColor.green
            sender.layer.cornerRadius = 20
        } else {
            sender.backgroundColor = UIColor.red
            sender.layer.cornerRadius = 20
        }
        
        quizzLogic.getNextQuestion()

        updateUI()
    }
    
    func updateUI() {
        questionLabel.text = quizzLogic.questionText()
        buttons()
        progressBar.progress = quizzLogic.progressBar()
        scoreLabel.text = "Score: \(quizzLogic.score)"
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.firstAnswer.backgroundColor = UIColor.clear
            self.secondAnswer.backgroundColor = UIColor.clear
            self.thirdAnswer.backgroundColor = UIColor.clear
            
        }
    }
    
    func buttons() {
        firstAnswer.setTitle(quizzLogic.firstAnswerText(), for: .normal)
        secondAnswer.setTitle(quizzLogic.secondAnswerText(), for: .normal)
        thirdAnswer.setTitle(quizzLogic.thirdAnswerText(), for: .normal)
    }
    
}
