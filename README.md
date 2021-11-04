# EasyAutolayout

### This:
```swift
subView.translatesAutoresizingMaskIntoConstraints = false
subView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
subView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.37).isActive = true
subView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
subView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
```

### Can be changed to this:
```swift
subView.pin.top(to: view).height(to: view, multiplier: 0.37).width(to: view).centerX(in: view)
```
