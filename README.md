# EasyAutolayout

### This:
`view.translatesAutoresizingMaskIntoConstraints = false
view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.37).isActive = true
view.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true`

### Can be cahnged to this:
`view.pin.top(to: view).height(to: view, multiplier: 0.37).width(to: view).centerX(in: view)`
