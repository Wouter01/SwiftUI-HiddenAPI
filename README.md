## SwiftUI-HiddenAPI

This package allows you to use various hidden SwiftUI features.
Compatible with macOS 12.0+, iOS 15.0+

### Why is it an xcframework?
This exposes functions in SwiftUI for the hidden features that are not in the swiftinterface files.
Modifications to the libraries are needed to make the Swift compiler see these symbols, which is why this is built outside of SPM and linked to the main snapshots package as a binaryTarget.
For a more in-depth explanation, see [here](https://github.com/EmergeTools/SnapshotPreviews-iOS/tree/main/PreviewsSupport).

### Warning
These features are not exposed by the stable interface and may be removed or changed in OS version updates.
Note that this package was only tested against macOS 14 / iOS 17. Some features may not be available on older versions, but lack `@available` annotations. If you notice any crashes / issues on lower versions, please create an issue.

### Overview
All exposed functions are behind the `hidden` variable. This way, when Apple makes them public, no name clashes occur.


#### WithCurrentWindow
Get the current NSWindow from the environment.

```swift
struct WithCurrentWindowTestView: View {
    @Environment(\.hidden.withCurrentWindow) var withCurrentWindow
    
    var body: some View {
        Text("Hello")
            .task {
                withCurrentWindow { window in
                    guard let window else { return }
                    print("Hello from \(window.title)")
                }
            }
    }
}
```

#### OpenSettings
Open SwiftUI Settings, just like you would open a window.
Works on macOS 14.0, 13.0, and below.

```swift
struct OpenSettingsTestView: View {
    @Environment(\.hidden.openSettings) var openSettings
    
    var body: some View {
        Button("Open Settings") {
            openSettings()
        }
    }
}
```

#### AppActions
Open SwiftUI Windows, Documents, and Settings outside Views.

```swift
class AppActionsTestDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        AppActions.openSettings()
        AppActions.openWindow(id: "TestWindow")
    }
}
```

#### FloatingWindowStyle
```swift
struct FloatingWindowStyleTestScene: Scene {
    var body: some Scene {
        WindowGroup {
            Text("Hello")
        }
        .windowStyle(.hidden.floating)
    }
}
```

#### Scene modifiers
Example:
```swift
struct WindowBackgroundTestScene: Scene {
    var body: some Scene {
        WindowGroup {
            Text("Hello")
        }
        .hidden.windowBackground(.regularMaterial)
    }
}
```

```swift
/// Customize the window background. Use `.clear` for a transparent window, use `.*Material` for a blurred background
func windowBackground(_ shape: some ShapeStyle) -> some Scene
```

```swift
/// Disable automatic window opening behavior..
/// For example, when set to `.hidden`, launching the app or clicking the app icon won't create a new window of that scene.
/// Note that previously created windows may reappear.
func defaultVisibility(_ visibility: Visibility) -> some Scene
```

```swift
/// Determine if a window should be closed when the user tries to close the window.
/// Returning `true` will close the window, `false` will keep the window open.
func windowShouldClose(_ perform: @escaping () -> Bool) -> some Scene
```

#### View modifiers
Example:
```swift
struct OpenSettingsTestView: View {
    var body: some View {
        Form {
            List {
                Text("Hello")
            }
            .hidden.accessoryBar {
                HStack(spacing: .zero) {
                    Button("Add", systemImage: "plus") {}
                    Divider()
                    Button("Remove", systemImage: "minus") {}
                }
            }
        }
        .formStyle(.grouped)
    }
}

```

```swift
/// Apply a variable blur overlay to a view.
func variableBlur(maxRadius: CGFloat, mask: Image, opaque: Bool) -> some View
```

```swift
/// Change the toolbar behavior when the window is fullscreen.
/// `.showsWithWindow` is the default behavior. `.showsWithMenuBar` will hide the toolbar when fullscreen.
func fullScreenToolbarBehavior(_ behavior: FullScreenToolbarBehavior) -> some View
```

```swift
/// Get a trigger when a row has been selected by the user, and gets clicked again.
/// This differs from a TapGesture, as there is no time limit between the clicks.
func onReselect(enabled: Bool, perform: (() -> ())?) -> some View
```

```swift
/// Adjust the padding around a Form with FormStyle `.grouped`
func formInsets(_ edges: Edge.Set, _ value: CGFloat) -> some View
func formInsets(_ edges: Edge.Set, _ value: EdgeInsets) -> some View
```

```swift
/// Adjust the inset of an individual row in a Form with FormStyle `.grouped`
func formRowInsets(_ insets: EdgeInsets?) -> some View
```

```swift
/// Set the indentation level of a Form row.
func formRowIndentationLevel(_ level: Int?) -> some View
```

```swift
/// Change the background color of a Form.
func formBackground<S: ShapeStyle>(_ shape: S?) -> some View
```

```swift
/// Change the background color of an individual row in a Form.
func formRowBackground<S: ShapeStyle>(_ shape: S?) -> some View
```

```swift
/// Change the background color of a section.
func sectionBackground(_ visibility: Visibility) -> some View
```

```swift
/// Add a trailing info icon to a Form row.
/// As an example, see system bluetooth settings.
func formInfoAction(action: @escaping () -> Void) -> some View
```

```swift
/// Change the visibility of the trailing info icon in a Form row.
func formRowInfoVisibility(_ visibility: Visibility) -> some View
```

```swift
/// Add a trailing Form row view, which becomes visible when hovered over the row.
/// As an example, see system wifi settings.
func formAccessory(@ViewBuilder accessories: () -> some View) -> some View
```

```swift
/// Change the visibility of the trailing Form row view.
func formAccessoryVisibility(_ visibility: Visibility) -> some View
```

```swift
/// Add a bottom row to a Form.
func bottomBar(@ViewBuilder content: () -> some View) -> some View
```

```swift
/// Add a sticky footer to List or Table. The List or Table needs to be wrapped in a Form with style `grouped`.
/// As an example, see system privacy settings -> accessibility
func accessoryBar(@ViewBuilder content: () -> some View) -> some View
```

```swift
/// Control the visibility of the list reorder controls. Untested.
func listReorderControlVisibility(_ visibility: ListAccessoryVisibility) -> some View
```

#### Form initializers

```swift
public extension Form {
    /// Add a footer to a form.
    static func withFooter<C: View, F: View>(@ViewBuilder content: () -> C, @ViewBuilder footer: () -> F) -> some View
}
```
