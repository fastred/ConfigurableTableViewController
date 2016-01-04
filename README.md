# ConfigurableTableViewController

Simple view controller that provides a way to configure a table view with multiple types of cells while keeping type safety. To learn what and whys I encourage you to read the associated blog post (TODO: LINK).

## Usage

Let's say we want to present a table view controller with four rows: two with text and two with images. We start by creating view data structures that cells will be configurable with:

```swift
struct TextCellViewData {
    let title: String
}

struct ImageCellViewData {
    let image: UIImage
}
```

and the cells themselves:

```swift
class TextTableViewCell: UITableViewCell {
    func updateWithViewData(viewData: TextCellViewData) {
        textLabel?.text = viewData.title
    }
}

class ImageTableViewCell: UITableViewCell {
    func updateWithViewData(viewData: ImageCellViewData) {
        imageView?.image = viewData.image
    }
}
```

Now to present a table view controller with those cells, we simply configure it in the following way:

```swift
import ConfigurableTableViewController

...

let viewController = ConfigurableTableViewController(items: [
    CellConfigurator<TextTableViewCell>(viewData: TextCellViewData(title: "Foo")),
    CellConfigurator<ImageTableViewCell>(viewData: ImageCellViewData(image: apple)),
    CellConfigurator<ImageTableViewCell>(viewData: ImageCellViewData(image: google)),
    CellConfigurator<TextTableViewCell>(viewData: TextCellViewData(title: "Bar")),
    ])

presentViewController(viewController, animated: true, completion: nil)
```

And ta-da :balloon::

<img src="https://raw.githubusercontent.com/fastred/ConfigurableTableViewController/master/demo.png?token=AAMEh9MRg_K2gNrcJ8DAmqvpQaHRwNGlks5WkrCNwA%3D%3D" width="300">

I encourage you to check both the [implementation][Framework] and an [example app][ExampleApp].

## Demo

To run the example project; clone the repo, open the project and run `ExampleApp` target.

## Requirements

iOS 8 and above.

## Installation

Carthage and CocoaPods compatibility coming soon!

## Author

Arkadiusz Holko:

* [Blog](http://holko.pl/)
* [@arekholko on Twitter](https://twitter.com/arekholko)

 [Framework]: https://github.com/fastred/ConfigurableTableViewController/tree/master/Framework
 [ExampleApp]: https://github.com/fastred/ConfigurableTableViewController/tree/master/ExampleApp

