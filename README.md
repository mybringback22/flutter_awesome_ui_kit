# FLUTTER AWESOME UI KIT(BETA)

<img src="resources/futter_aweseom_ui_kit_beta.png" width="800" >


## Components
* AwesomeButton
* AwesomeProfileImage
* AwesomeTextBoxed
* AwesomeSnackbar

## AwesomeButton

<p>AwesomeButton offers 3 types of button with number of customizations that can cater to every usecase a developer can ever face using development. It also offers user feedback on click and press in the form of ripples effect</p>

### Types
* rounded()
* roundedCornors()
* flat()

### Demo

<img src="resources/button_demo_one.png" width="800" >

<img src="resources/button_demo_two.png" width="800" >

### Usage

```dart
// Rounded Cornors
AwesomeButton(
    "Rounded Cornors",
    textSize: 20,
    borderColor: Colors.green,
    borderWidth: 2,
    backgroundColor: Colors.white,
    textColor: Colors.green,
    showShadow: true,
    shadowColor: Colors.green,
    enabled: true,
    disabledBackgroundColor: Colors.grey.withOpacity(0.4),
    padding: const EdgeInsets.symmetric(vertical: 20,),
    onClick: () {},
).roundedCornors(),


// Rounded
AwesomeButton(
    "Rounded",
    textSize: 20,
    borderColor: Colors.blue,
    borderWidth: 2,
    backgroundColor: Colors.white,
    textColor: Colors.blue,
    enabled: true,
    showShadow: true,
    shadowColor: Colors.grey,
    disabledBackgroundColor: Colors.grey.withOpacity(0.4),
    padding: const EdgeInsets.symmetric(vertical: 20,),
    onClick: () {},
).rounded(),

// Flat
AwesomeButton(
    "Flat",
    textSize: 20,
    borderColor: Colors.green,
    borderWidth: 2,
    backgroundColor: Colors.white,
    textColor: Colors.green,
    enabled: true,
    disabledBackgroundColor: Colors.grey.withOpacity(0.4),
    padding: const EdgeInsets.symmetric(vertical: 20,),
    onClick: () {},
).flat()
```


## AwesomeProfileImage

<p>AwesomeProfileImage offer varity option for customization that makes adding profile image in your application easier 

Customization offers include shape, size, border color and status type

</p>

### Demo 
<img src="resources/profile_demo_two.gif" width="400" >


### Types
* display() - Display Profile image with border and status
* displayLive()  - For when user is live on the platform 
* displayWithTextStatus() - Display Profile image with border and status as text
* displayWithIcon() - Adds a clickable icon to the profile

### Profile Display Shape

ProfileDisplayShape is used for making different shapes for AwesomeProfileImage

```dart
ProfileDisplayShape.circle
ProfileDisplayShape.square
ProfileDisplayShape.squareround
```

### Profile Display Size

ProfileDisplaySize is used for making different size for AwesomeProfileImage

```dart
ProfileDisplaySize.mini
ProfileDisplaySize.small
ProfileDisplaySize.medium
ProfileDisplaySize.large
```

### User Status

UserStatus is used for adding different status to AwesomeProfilePicture

```dart
UserStatus.online
UserStatus.offline
UserStatus.away
UserStatus.busy
UserStatus.dnd
UserStatus.inactive
```

### Usage

**display** <br>


```dart
AwesomeProfileImage(
    profileDisplaySize: profileDisplaySize,
    borderWidth: (showBorder) ? 2 : 0,
    borderColor: Colors.black,
    profileDisplayShape: profileDisplayShape,
    placeholderAssets: "assets/images/umar.jpg",
    imageUrl: "https://i.imgur.com/HEXRUsu.jpeg",
).display(
    showStatus: true, 
    userStatus: UserStatus.online,
)
```

**displayLive** <br>

**Note:**  displayLive Does not support ProfileDisplaySize.medium

```dart
AwesomeProfileImage(
    profileDisplaySize:ProfileDisplaySize.medium,
    borderWidth: (showBorder) ? 4 : 0,
    borderColor: Colors.green,
    profileDisplayShape: ProfileDisplayShape.squareround,
    placeholderAssets: "assets/images/umar.jpg",
    backgoundColor: Colors.white,
    imageUrl: "https://i.imgur.com/HEXRUsu.jpeg",
    onImageClicked:(){
        // On Image clicked
    }
).displayLive(
    showStatus: true,
    userStatus: UserStatus.online,
    badgeColor: Colors.red,
    ripplesColor: Colors.red.shade500,
    tickerProvider: this,
    badgeText: "Live"
)
```

**displayWithTextStatus** <br>

```dart
AwesomeProfileImage(
    profileDisplaySize: ProfileDisplaySize.medium,
    borderWidth: (showBorder) ? 2 : 0,
    borderColor: Colors.black,
    profileDisplayShape: ProfileDisplayShape.squareround,
    imageUrl: "https://i.imgur.com/HEXRUsu.jpeg",
    onImageClicked: () {
        // On Image clicked
    }
).displayWithTextStatus(
    showStatus: true, 
    userStatus: UserStatus.online,
)
```

**displayWithIcon** <br>

```dart
AwesomeProfileImage(
    profileDisplaySize: profileDisplaySize,
    borderWidth: (showBorder) ? 2 : 0,
    borderColor: Colors.black,
    profileDisplayShape: profileDisplayShape,
    imageUrl: "https://i.imgur.com/HEXRUsu.jpeg",
    onImageClicked: () {
       // On Image clicked
    }
).displayWithIcon(
    iconBackgroundColor: Colors.white,
    iconBorderWidth: 2,
    iconBorderColor: Colors.black,
    iconColor: Colors.black,
    icon: Icons.mic,
    onIconClicked: () {
        // On icon clicked
}),
```

## AwesomeTextBoxed

<p>AwesomeTextBoxed is a awesome boxed text with icon which can be used as warning, info, error or success  indicator</p>

### Demo

<img src="resources/demo_text_boxed.png" width="800" >

### Text Boxed Type

TextBoxType is used for getting different types of AwesomeTextBoxed as shown in demo

```dart
TextBoxType.info
TextBoxType.error
TextBoxType.warning
TextBoxType.success
TextBoxType.custom
```

### Border Shape

BorderShape is used for making different shapes for AwesomeTextBoxed

```dart
BorderShape.circle
BorderShape.rounded
BorderShape.flat
```

### Usage

```dart
AwesomeTextBoxed(
    "Operation sucessfull",
    textBoxType: TextBoxType.info,
    maxLines: 3,
    borderShape: BorderShape.rounded,
    margin: const EdgeInsets.only(bottom: 20,top: 5,),
)
```
