import UIKit
import EasyAutolayout

class ViewController: UIViewController {

    private let containerView = UIView()
    private let imagePlaceholder = UIView()
    private let titleLabel = UILabel()
    private let detailsLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(containerView)
        containerView.addSubview(imagePlaceholder)
        containerView.addSubview(titleLabel)
        containerView.addSubview(detailsLabel)

        titleLabel.text = "Title"
        detailsLabel.text = "Details"

        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.gray.cgColor
        imagePlaceholder.layer.borderWidth = 1
        imagePlaceholder.layer.borderColor = UIColor.gray.cgColor
        titleLabel.layer.borderWidth = 1
        titleLabel.layer.borderColor = UIColor.gray.cgColor
        detailsLabel.layer.borderWidth = 1
        detailsLabel.layer.borderColor = UIColor.gray.cgColor

        containerView.pin.center(in: view).width(to: 300).height(to: 80)
        imagePlaceholder.pin.edges([.left, .top, .bottom], to: containerView, insets: .init(top: 10, left: 10, bottom: 10, right: 0)).height(toWidth: imagePlaceholder)
        titleLabel.pin.after(of: imagePlaceholder, offset: 10).top(to: containerView, offset: 10).trailing(to: containerView, offset: 10)
        detailsLabel.pin.below(of: titleLabel, offset: 2).edges([.left, .right], to: titleLabel)
    }

}
