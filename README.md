# swiftui-Flow-Coordinator-pattern-in-iOS14
SwiftUI Flow Coordinator pattern to coordinate navigation between views


I demonstrate you how you can use Flow Coordinator with SwiftUI to separate Navigation logic from View logic. 
In UIKit this pattern was very popular and such Flow Coordinators enable to push or present new view controllers separating this task from view controllers and view models code. This allow to decouple view controllers view code from its navigation and to easily change flow in application. 
Similar thing can be done in SwiftUI to the some extent.

a. Most of the navigation in SwiftUI can be done using @Binding that keeps activation state of navigation and SwiftUI special modifiers and views i.e.
fullScreenCover, sheet, alert, confirmationDialog or NavigationLink.

b. Typically we separate presentation logic from business logic (or preparing view data) by splitting code into View and ViewModel.
ViewModel should prepare all necessary data to display in view (outputs), and handle all actions coming from view (inputs).
View should just handle displaying of this data and layouting them on screen.

In SwiftUI all navigation primitives must be called in context of view to work correctly. So we can do some assumptions about flow coordinators: 
1. Flow Coordinator is View 
2. We have Flow Coordinator per screen
3. Navigation events should be passed to Flow Coordinator from ViewModel
4. We need some enum that will represent those navigation events

c. Creating protocol representing flow coordinator state 
This protocol enable us to pass navigation events from view model to flow coordinator.

protocol ContentFlowStateProtocol: ObservableObject {
    var activeLink: ContentLink? { get set }
}

Here ContentLink is enum that represents different navigation events/actions.
This protocol should be implemented by our ViewModel. This way view model in response to user action can handle them and pass navigation events to flow coordinator via this FlowStateProtocol.
So our complete ContentViewModel processing several user actions and implementing ContentFlowStateProtocol can look like this.

Creating ContentLink enum for navigation events 
This enumaration defines different navigation events that can happen in our screen of application. This events can have some parameters passed along them. Moreover ContentLink enum should be Identifiable and Hashable.


enum ContentLink: Hashable, Identifiable {
    case firstLink
    case firstLinkParametrized(text: String)
    
    case secondLink
    case secondLinkParametrized(number: Int)
    
    case thirdLink

    case sheetLink(item: String)
}

Implementing per screen FlowCoordinator view
The most essential part of our Flow coordinator patter will be ContentFlowCoordinator view. It will handle all per screen navigation logic.

Firstly its init (here implicit) will have to parameters both using generics. 
1. state that is of type implementing ContentFlowStateProtocol. 
2. content which will be screen view @ViewBuilder

Secondly state need to be stored as @ObservedObject and it shouldn’t be @StateObject as ContentFlowStateProtocol is implemented by ContentViewModel and this view model will be already stored as @StateObject in screen ContentView.
Thirdly we have helper bindings made as computed properties for NavigationLink i.e. activeLink and for sheet presentation i.e. sheetItem.
All navigation logic is implemented inside ContentFlowCoordinator body computed property. There is added NavigationView, embedded navigationLinks property and attached sheet(item:…) modifier.
Last but not least we have factory functions that build our destination/content views. They extract eventual navigation event parameters, construct view models with them and finally view using this view model.

Using FlowCoordinator with View
The final step that remain to complete ContentView screen is to put it all together and implement this view. This is the same view you so at the beginning of this tutorial but with added our brand new ContentFlowCoordinator and extending view model generic type to require to adopt the ContentFlowStateProtocol.
