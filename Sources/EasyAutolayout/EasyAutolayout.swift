import UIKit

public protocol ViewPin {

    var constraints: [NSLayoutConstraint] { get }

    @discardableResult
    func edges(_ edges: UIRectEdge, to target: LayoutArea, insets: UIEdgeInsets, priority: UILayoutPriority?) -> ViewPin

    @discardableResult
    func leading(to target: LayoutArea, offset: CGFloat, priority: UILayoutPriority?) -> ViewPin

    @discardableResult
    func trailing(to target: LayoutArea, offset: CGFloat, priority: UILayoutPriority?) -> ViewPin

    @discardableResult
    func top(to target: LayoutArea, offset: CGFloat, priority: UILayoutPriority?) -> ViewPin

    @discardableResult
    func bottom(to target: LayoutArea, offset: CGFloat, priority: UILayoutPriority?) -> ViewPin

    @discardableResult
    func above(of target: LayoutArea, offset: CGFloat, priority: UILayoutPriority?) -> ViewPin

    @discardableResult
    func below(of target: LayoutArea, offset: CGFloat, priority: UILayoutPriority?) -> ViewPin

    @discardableResult
    func before(of target: LayoutArea, offset: CGFloat, priority: UILayoutPriority?) -> ViewPin

    @discardableResult
    func after(of target: LayoutArea, offset: CGFloat, priority: UILayoutPriority?) -> ViewPin

    @discardableResult
    func width(to target: LayoutArea, insets: UIEdgeInsets, priority: UILayoutPriority?) -> ViewPin

    @discardableResult
    func width(to constant: CGFloat, priority: UILayoutPriority?) -> ViewPin

    @discardableResult
    func height(toWidth target: LayoutArea, multiplier: CGFloat, priority: UILayoutPriority?) -> ViewPin

    @discardableResult
    func height(to target: LayoutArea, multiplier: CGFloat, priority: UILayoutPriority?) -> ViewPin

    @discardableResult
    func height(to constant: CGFloat, priority: UILayoutPriority?) -> ViewPin

    @discardableResult
    func size(to size: CGSize, priority: UILayoutPriority?) -> ViewPin

    @discardableResult
    func size(to size: CGFloat, priority: UILayoutPriority?) -> ViewPin

    @discardableResult
    func center(in target: LayoutArea, priority: UILayoutPriority?) -> ViewPin

    @discardableResult
    func centerY(in target: LayoutArea, priority: UILayoutPriority?) -> ViewPin

    @discardableResult
    func centerX(in target: LayoutArea, priority: UILayoutPriority?) -> ViewPin
}

public extension ViewPin {

    @discardableResult
    func edges(_ edges: UIRectEdge = .all, to target: LayoutArea, insets: UIEdgeInsets = .zero, priority: UILayoutPriority? = nil) -> ViewPin {
        self.edges(edges, to: target, insets: insets, priority: priority)
    }

    @discardableResult
    func leading(to target: LayoutArea, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> ViewPin {
        self.edges(.left, to: target, insets: .init(top: 0, left: offset, bottom: 0, right: 0), priority: priority)
    }

    @discardableResult
    func trailing(to target: LayoutArea, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> ViewPin {
        self.edges(.right, to: target, insets: .init(top: 0, left: 0, bottom: 0, right: offset), priority: priority)
    }

    @discardableResult
    func top(to target: LayoutArea, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> ViewPin {
        self.edges(.top, to: target, insets: .init(top: offset, left: 0, bottom: 0, right: 0), priority: priority)
    }

    @discardableResult
    func bottom(to target: LayoutArea, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> ViewPin {
        self.edges(.bottom, to: target, insets: .init(top: 0, left: 0, bottom: offset, right: 0), priority: priority)
    }

    @discardableResult
    func above(of target: LayoutArea, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> ViewPin {
        self.above(of: target, offset: offset, priority: priority)
    }

    @discardableResult
    func below(of target: LayoutArea, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> ViewPin {
        self.below(of: target, offset: offset, priority: priority)
    }

    @discardableResult
    func before(of target: LayoutArea, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> ViewPin {
        self.before(of: target, offset: offset, priority: priority)
    }

    @discardableResult
    func after(of target: LayoutArea, offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> ViewPin {
        self.after(of: target, offset: offset, priority: priority)
    }

    @discardableResult
    func width(to target: LayoutArea, insets: UIEdgeInsets = .zero, priority: UILayoutPriority? = nil) -> ViewPin {
        self.width(to: target, insets: insets, priority: priority)
    }

    @discardableResult
    func width(to constant: CGFloat = 0, priority: UILayoutPriority? = nil) -> ViewPin {
        self.width(to: constant, priority: priority)
    }

    @discardableResult
    func height(toWidth target: LayoutArea, multiplier: CGFloat = 1, priority: UILayoutPriority? = nil) -> ViewPin {
        self.height(toWidth: target, multiplier: multiplier, priority: priority)
    }

    @discardableResult
    func height(to target: LayoutArea, multiplier: CGFloat = 0, priority: UILayoutPriority? = nil) -> ViewPin {
        self.height(to: target, multiplier: multiplier, priority: priority)
    }

    @discardableResult
    func height(to constant: CGFloat = 0, priority: UILayoutPriority? = nil) -> ViewPin {
        self.height(to: constant, priority: priority)
    }

    @discardableResult
    func size(to size: CGSize, priority: UILayoutPriority? = nil) -> ViewPin {
        self.width(to: size.width, priority: priority).height(to: size.height, priority: priority)
    }

    @discardableResult
    func size(to size: CGFloat, priority: UILayoutPriority? = nil) -> ViewPin {
        self.width(to: size, priority: priority).height(to: size, priority: priority)
    }

    @discardableResult
    func center(in target: LayoutArea, priority: UILayoutPriority? = nil) -> ViewPin {
        self.centerX(in: target, priority: priority).centerY(in: target, priority: priority)
    }

    @discardableResult
    func centerY(in target: LayoutArea, priority: UILayoutPriority? = nil) -> ViewPin {
        self.centerY(in: target, priority: priority)
    }

    @discardableResult
    func centerX(in target: LayoutArea, priority: UILayoutPriority? = nil) -> ViewPin {
        self.centerX(in: target, priority: priority)
    }

}

private final class ViewPinImpl: ViewPin {

    var constraints: [NSLayoutConstraint] = []

    private let source: UIView

    deinit {
        NSLayoutConstraint.activate(constraints)
    }

    init(_ source: UIView) {
        self.source = source
        source.translatesAutoresizingMaskIntoConstraints = false
    }

    func edges(_ edges: UIRectEdge, to target: LayoutArea, insets: UIEdgeInsets, priority: UILayoutPriority?) -> ViewPin {
        var edges = edges
        if edges.contains(.all) {
            edges = [.left, .right, .top, .bottom]
        }
        if edges.contains(.left) {
            let constraint = source.leadingAnchor.constraint(equalTo: target.leadingAnchor, constant: insets.left)
            append(constraint, priority: priority)
        }
        if edges.contains(.right) {
            let constraint = source.trailingAnchor.constraint(equalTo: target.trailingAnchor, constant: -insets.right)
            append(constraint, priority: priority)
        }
        if edges.contains(.top) {
            let constraint = source.topAnchor.constraint(equalTo: target.topAnchor, constant: insets.top)
            append(constraint, priority: priority)
        }
        if edges.contains(.bottom) {
            let constraint = source.bottomAnchor.constraint(equalTo: target.bottomAnchor, constant: -insets.bottom)
            append(constraint, priority: priority)
        }
        return self
    }

    func above(of target: LayoutArea, offset: CGFloat, priority: UILayoutPriority?) -> ViewPin {
        let constraint = source.bottomAnchor.constraint(equalTo: target.topAnchor, constant: -offset)
        append(constraint, priority: priority)
        return self
    }

    func below(of target: LayoutArea, offset: CGFloat, priority: UILayoutPriority?) -> ViewPin {
        let constraint = source.topAnchor.constraint(equalTo: target.bottomAnchor, constant: offset)
        append(constraint, priority: priority)
        return self
    }

    func before(of target: LayoutArea, offset: CGFloat, priority: UILayoutPriority?) -> ViewPin {
        let constraint = source.trailingAnchor.constraint(equalTo: target.leadingAnchor, constant: -offset)
        append(constraint, priority: priority)
        return self
    }

    func after(of target: LayoutArea, offset: CGFloat, priority: UILayoutPriority?) -> ViewPin {
        let constraint = source.leadingAnchor.constraint(equalTo: target.trailingAnchor, constant: offset)
        append(constraint, priority: priority)
        return self
    }

    func width(to target: LayoutArea, insets: UIEdgeInsets, priority: UILayoutPriority?) -> ViewPin {
        let constraint = source.widthAnchor.constraint(equalTo: target.widthAnchor, constant: -(insets.left + insets.right))
        append(constraint, priority: priority)
        return self
    }

    func width(to constant: CGFloat, priority: UILayoutPriority?) -> ViewPin {
        let constraint = source.widthAnchor.constraint(equalToConstant: constant)
        append(constraint, priority: priority)
        return self
    }

    func height(toWidth target: LayoutArea, multiplier: CGFloat, priority: UILayoutPriority?) -> ViewPin {
        let constraint = source.heightAnchor.constraint(equalTo: target.widthAnchor, multiplier: multiplier)
        append(constraint, priority: priority)
        return self
    }

    func height(to target: LayoutArea, multiplier: CGFloat, priority: UILayoutPriority?) -> ViewPin {
        let constraint = source.heightAnchor.constraint(equalTo: target.heightAnchor, multiplier: multiplier)
        append(constraint, priority: priority)
        return self
    }

    func height(to constant: CGFloat, priority: UILayoutPriority?) -> ViewPin {
        let constraint = source.heightAnchor.constraint(equalToConstant: constant)
        append(constraint, priority: priority)
        return self
    }

    func centerY(in target: LayoutArea, priority: UILayoutPriority?) -> ViewPin {
        let constraint = source.centerYAnchor.constraint(equalTo: target.centerYAnchor)
        append(constraint, priority: priority)
        return self
    }

    func centerX(in target: LayoutArea, priority: UILayoutPriority?) -> ViewPin {
        let constraint = source.centerXAnchor.constraint(equalTo: target.centerXAnchor)
        append(constraint, priority: priority)
        return self
    }

    private func append(_ constraint: NSLayoutConstraint, priority: UILayoutPriority?) {
        if let priority = priority {
            constraint.priority = priority
        }
        constraints.append(constraint)
    }
}

public extension UIView {
    var pin: ViewPin {
        ViewPinImpl(self)
    }
}

public protocol LayoutArea {
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    var leftAnchor: NSLayoutXAxisAnchor { get }
    var rightAnchor: NSLayoutXAxisAnchor { get }
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    var widthAnchor: NSLayoutDimension { get }
    var heightAnchor: NSLayoutDimension { get }
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    var centerYAnchor: NSLayoutYAxisAnchor { get }
}

extension UIView: LayoutArea {}
extension UILayoutGuide: LayoutArea {}
